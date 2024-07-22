class Message {
  String message;
  String senderId;
  String receiverId;
  String timestamp;

  Message(
      {required this.message,
      required this.senderId,
      required this.receiverId,
      required this.timestamp});

  factory Message.fromJson(Map<String, String> message) {
    return Message(
        message: message["message"]!,
        senderId: message["senderId"]!,
        receiverId: message["receiverId"]!,
        timestamp: message["timestamp"]!);
  }

  Map<String, String> toMap(Message message) {
    return {
      "message": message.message,
      "senderId": message.senderId,
      "receiverId": message.receiverId,
      "timestamp": message.timestamp
    };
  }
}
