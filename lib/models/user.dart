import 'package:firebase_auth/firebase_auth.dart';

class Users {
  final String uid;
  // final String email;
  // , required this.email
  // email: firebaseUser.email ?? ''

  Users({required this.uid});

  factory Users.fromFirebaseUser(User firebaseUser) {
    return Users(uid: firebaseUser.uid,);
  }
}