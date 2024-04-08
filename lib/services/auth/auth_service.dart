import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //get instances of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //get current user
  User? get currentUser => _firebaseAuth.currentUser;
  //sign in
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    //try sign user in
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    //catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    //try sign user up
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    //catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
