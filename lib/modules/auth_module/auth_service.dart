import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _fireauth = FirebaseAuth.instance;
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  User? get currentUser => _fireauth.currentUser;
  Future<UserCredential> login(email, password) async {
    try {
      UserCredential userCredential = await _fireauth
          .signInWithEmailAndPassword(email: email, password: password);
      _fireStore
          .collection("users")
          .doc(userCredential!.user!.uid)
          .set({"uid": userCredential!.user!.uid, "email": email});
      return userCredential;
    } on FirebaseException catch (e, tr) {
      print(tr);
      throw Exception(e.code);
    }
  }

  Stream<List<Map<String, dynamic>>> getUsers() {
    try {
      return _fireStore.collection("users").snapshots().map(((snapshot) {
        return snapshot.docs
            .map((docs) {
              final user = docs.data();
              print("user information is ${user}");
              return user;
            })
            .toList()
            .where((element) {
              return element["uid"] != currentUser!.uid;
            })
            .toList();
      }));
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }
}
