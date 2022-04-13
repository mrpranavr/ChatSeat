import 'dart:async';

import 'package:onionchatflutter/model/chat_channel.dart';
import 'package:onionchatflutter/repository/channels_table.dart' as channels_table;

import 'package:sqflite/sqflite.dart';

class ChannelRepository {
  final Database database;

  ChannelRepository.fromDatabase(this.database);

  Future<ChatChannel> insert(ChatChannel channel) async {
    await database.insert(channels_table.tableName, channel.toTableMap());
    return channel;
  }

  Future<ChatChannel?> getChannel(String name) async {
    List<Map<String, Object?>> maps = await database.query(
        channels_table.viewName,
        columns: channels_table.viewColumns,
        where: '${channels_table.colName} = ?',
        whereArgs: [name]
    );
    if (maps.isNotEmpty) {
      return ChatChannel.fromViewMap(maps.first);
    }
    return null;
  }

  Future<void> delete(String name) async {
    await database.delete(
        channels_table.tableName,
        where: '${channels_table.colName} = ?',
        whereArgs: [name]
    );
  }

  Future<void> update(ChatChannel channel) async {
    await database.update(channels_table.tableName, channel.toTableMap());
  }

  Future close() async => database.close();
}