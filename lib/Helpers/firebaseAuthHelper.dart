import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper extends ChangeNotifier {
  bool authState = false;

  bool authStateInit() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User user) {
      if (user == null) {
        this.authState = false;
      } else {
        this.authState = true;
      }
    });
    notifyListeners();
    return this.authState;
  }
}
