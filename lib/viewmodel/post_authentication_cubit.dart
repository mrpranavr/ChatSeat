import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onionchatflutter/repository/channel_repository.dart';
import 'package:onionchatflutter/repository/channels_table.dart'
    as channels_table;
import 'package:onionchatflutter/repository/messages_table.dart'
    as messages_table;
import 'package:onionchatflutter/viewmodel/messenger_service.dart';
import 'package:onionchatflutter/xmpp/Connection.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../repository/message_repository.dart';
import '../xmpp/extensions/vcard_temp/VCardManager.dart';

class PostAuthenticationCubit extends Cubit<PostAuthenticationState> {
  final Connection _connection;

  PostAuthenticationCubit(
      PostAuthenticationState initialState, this._connection)
      : super(initialState);

  Future<void> initialize(final String username) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '$username-chats.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.transaction((txn) async {
        await txn.execute(channels_table.createQuery);
        await txn.execute(channels_table.createViewQuery);
        await txn.execute(messages_table.createQuery);
      });
    });

    emit(ReadyState(XmppMessenger(
        MessageRepository.fromDatabase(database),
        StreamController.broadcast(),
        StreamController.broadcast(),
        _connection,
        ChannelRepository.fromDatabase(database),
        VCardManager.getInstance(_connection),
        StreamController.broadcast(),
        StreamController.broadcast())));
  }
}

abstract class PostAuthenticationState {}

class InitialState extends PostAuthenticationState {}

class ReadyState extends PostAuthenticationState {
  final XmppMessenger messenger;

  ReadyState(this.messenger);
}
