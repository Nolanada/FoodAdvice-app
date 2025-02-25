import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobilefoodadviceapp/models/user.dart';
import 'package:mobilefoodadviceapp/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users _userFromFirebaseUser(User? user) {
    return user != null ? Users(uid: user.uid) : Users(uid: '');
  }

//Auth change stream
  Stream<Users?> getUserData() {
    return FirebaseAuth.instance.authStateChanges().map((User? firebaseUser) {
      if (firebaseUser != null) {
        return Users(uid: firebaseUser.uid);
        // email: firebaseUser.email ?? ''
      } else {
        return null;
      }
    });
  }

  // Sign In anonymously
  Future<User?> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Exception: ${e.message}");
      return null;
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

// Sign Out
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
//
// Sign In with email and password
Future signInWithEmailPassword(String email, String password) async {
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = result.user;
    return _userFromFirebaseUser(user);
  } catch (e) {
    print(e.toString());
    return null;
  }
}
//
// Register with email and password
Future registerWithEmail(String email, String password) async {
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = result.user;

    if (user != null) {
      // Create a new document for the user
      await DatabaseService(uid: user.uid).updateUserData('uname', 'date', 'category', 'content');
      return _userFromFirebaseUser(user);
    } else {
      print('User is null');
      return null;
    }
  } catch (e) {
    print(e.toString());
    return null;
  }
}
}
