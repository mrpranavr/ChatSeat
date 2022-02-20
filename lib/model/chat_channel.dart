class ChatChannel {
  int? id;
  final String name;
  final String avatarFilePath;
  int lastViewed;
  String? lastMessage;
  int? unreadCount;

  ChatChannel(
      {this.id,
      required this.name,
      required this.avatarFilePath,
      required this.lastViewed,
      this.lastMessage,
      this.unreadCount});
}