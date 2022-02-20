import 'package:onionchatflutter/repository/messages_table.dart' as messages_table;

abstract class Message {
  int? id;
  final MessageType type;
  final String from;
  final String channelName;
  final int timestamp;

  Message(this.id, this.type, this.from, this.channelName, this.timestamp);

}

enum MessageType {
  TEXT,
  FILE,
  IMAGE,
  AUDIO,
}

class TextMessage extends Message {
  final String message;

  TextMessage(
      {int? id,
      required String from,
      required String channelName,
      required int timestamp,
      required this.message})
      : super(id, MessageType.TEXT, from, channelName, timestamp);
}

class DownloadableMessage extends Message {
  final String url;
  final String name;
  final int size;

  String? _localPath;

  String? get localPath => _localPath;

  bool get isDownloaded => _localPath != null;

  DownloadableMessage(
      {int? id,
      required MessageType type,
      required String from,
      required String channelName,
      required int timestamp,
      required this.url,
      required this.name,
      required this.size,
      String? localPath})
      : _localPath = localPath,
        super(id, type, from, channelName, timestamp);

  Future<bool> tryDownload() async {
    return true;
  }
}
