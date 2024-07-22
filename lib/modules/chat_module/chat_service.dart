import 'package:chatting_app/modules/auth_module/auth_service.dart';
import 'package:chatting_app/modules/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthService _authService = Modular.get<AuthService>();

  Future<void> sendMessage(Message message) async {
    try {
      List ids = [message.senderId, message.receiverId];
      ids.sort();
      String roomId = ids.join("_");
      _firestore
          .collection("chat_rooms")
          //.doc(message.senderId + "_" + _authService.currentUser!.uid)
          .doc(roomId)
          .collection("messages")
          .add(message.toMap(message));
    } on FirebaseException catch (e) {
      throw (e.code);
    }
  }

  Stream<QuerySnapshot> getMessages(String senderId) {
    try {
      List ids = [_authService.currentUser!.uid, senderId];
      ids.sort();
      String roomId = ids.join("_");
      // String roomId = _authService.currentUser!.uid + "_" + senderId;
      print("Message room Id is ${roomId}");
      return _firestore
          .collection("chat_rooms")
          //.doc(_authService.currentUser!.uid + "_" + senderId)
          .doc(roomId)
          .collection("messages")
          .orderBy("timestamp")
          .snapshots();
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }
}
