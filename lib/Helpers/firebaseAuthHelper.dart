import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthHelper extends ChangeNotifier {
  User user;

  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  FirebaseAuthHelper() {
    auth.authStateChanges().listen((User user) {
      this.user = user;
      notifyListeners();
    });
  }

  isAuthenticated() {
    return this.user != null;
  }

  loginWithEmailAndPass(String email, String password) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => print(value.user));
  }

  googleLogin() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    auth.signInWithCredential(credential).then((value) {
      this.user = value.user;
      notifyListeners();
    });
    return true;
  }
}
