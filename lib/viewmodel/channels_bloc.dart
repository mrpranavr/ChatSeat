import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onionchatflutter/model/chat_channel.dart';
import 'package:onionchatflutter/viewmodel/messenger_service.dart';

class ChannelsBloc extends Bloc<ChannelsEvent, ChannelsState> {
  final Messenger _messenger;
  ChannelsBloc(this._messenger) : super(UninitializedState()) {
    on<InitEvent>(onInit);
    on<FetchEvent>(onFetch);
    on<CreateChannelEvent>(onCreateChannel);
    on<AddChannelEvent>(onAddChannel);
  }

  FutureOr<void> onInit(final InitEvent event, Emitter<ChannelsState> emit) async {
    final List<ChatChannel> channels = await _messenger.fetchChannels(0, 10);
    emit(LoadedState(channels, false));
    _messenger.channelCreations.listen((event) {
        add(AddChannelEvent(event));
    });
  }

  FutureOr<void> onFetch(final FetchEvent event, Emitter<ChannelsState> emit) async {
    final stateC = state;
    if (stateC is! LoadedState) {
      return;
    }
    final List<ChatChannel> channels = await _messenger.fetchChannels(stateC.channels.length, 10);
    stateC.completedLoading = channels.isNotEmpty;
    stateC.channels.addAll(channels);
    emit(stateC);
  }

  FutureOr<void> onCreateChannel(final CreateChannelEvent event, Emitter<ChannelsState> emit) async {
    _messenger.createChannel(event.channelId);
  }

  FutureOr<void> onAddChannel(final AddChannelEvent event, Emitter<ChannelsState> emit) async {
    final stateC = state;
    if (stateC is! LoadedState) {
      return;
    }
    stateC.channels.add(event.channel);
    emit(stateC);
  }
}

abstract class ChannelsEvent {}

class InitEvent extends ChannelsEvent {}

class FetchEvent extends ChannelsEvent {}

class CreateChannelEvent extends ChannelsEvent {
  final String channelId;

  CreateChannelEvent(this.channelId);
}

class AddChannelEvent extends ChannelsEvent {
  final ChatChannel channel;

  AddChannelEvent(this.channel);
}

abstract class ChannelsState {}

class UninitializedState extends ChannelsState {}

class LoadedState extends ChannelsState {
  final List<ChatChannel> channels;
  bool completedLoading;

  LoadedState(this.channels, this.completedLoading);
}