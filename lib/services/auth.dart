import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user;
    } catch (e) {
      e.toString();
    }
  }

  Future registerAccount(
      String email, String displayName, String password) async {
    try {
      var credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
      return credential.user;
    } catch (e) {
      e.toString();
    }
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      e.toString();
    }
  }
}

class Authentication {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    // TODO: Add auto login logic

    return firebaseApp;
  }
}
