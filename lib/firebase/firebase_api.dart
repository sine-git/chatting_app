import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  Future<void> initNotification() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    final token = await _firebaseMessaging.getToken();
    print("Token is ${token}");
  }
}
