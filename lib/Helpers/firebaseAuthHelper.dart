import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper extends ChangeNotifier {
  User user;
  StreamSubscription authHelper;

  FirebaseAuthHelper() {
    FirebaseAuth auth = FirebaseAuth.instance;
    authHelper = auth.authStateChanges().listen((User user) {
      this.user = user;
      notifyListeners();
    });
  }

  isAuthenticated() {
    return this.user != null;
  }
}
