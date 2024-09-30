import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String sender;
  final String content;
  final DateTime createdAt;

  Message({
    required this.sender,
    required this.content,
    required this.createdAt,
  });

  factory Message.fromFirestore(Map<String, dynamic> data) {
    return Message(
      sender: data['sender'],
      content: data['content'],
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'sender': sender,
      'content': content,
      'createdAt': createdAt,
    };
  }
}
