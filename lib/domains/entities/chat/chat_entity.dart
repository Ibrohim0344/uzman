class ChatsEntity {
  String userImage;
  String userName;
  List<String>? message;
  int? unreadMessage;
  DateTime time;

  ChatsEntity({
    required this.userImage,
    required this.userName,
    required this.time,
    this.message,
    this.unreadMessage,
  });
}
