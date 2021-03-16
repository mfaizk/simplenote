import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:simplenote/Helpers/firebaseAuthHelper.dart';
import 'package:simplenote/Helpers/themeDataProvider.dart';
import 'package:simplenote/Screens/errorPopUpScreen.dart';
import 'package:simplenote/Screens/logInOrNot.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeDataProvider()),
      ChangeNotifierProvider(create: (context) => FirebaseAuthHelper())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Material(child: ErrorPopUpScreen());
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Material(child: LogInOrNot());
          }

          return Material(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
