import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenote/Helpers/firebaseAuthHelper.dart';
import 'package:simplenote/Helpers/themeDataProvider.dart';
import 'package:simplenote/Screens/homeScreen.dart';
import 'package:simplenote/Screens/loginScreen.dart';

class LogInOrNot extends StatefulWidget {
  @override
  _LogInOrNotState createState() => _LogInOrNotState();
}

class _LogInOrNotState extends State<LogInOrNot> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeDataProvider, FirebaseAuthHelper>(
      builder: (context, tdp, fAuthHelper, child) {
        if (fAuthHelper.authState) {
          return HomeScreen();
        }
        return LoginScreen();
      },
    );
  }
}
