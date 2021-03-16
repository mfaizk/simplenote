import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenote/Helpers/themeDataProvider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<ThemeDataProvider>(builder: (context, tdp, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: tdp.primarColor,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: tdp.primarColor,
          elevation: 5.0,
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.fill,
            child: Icon(Icons.add),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: tdp.secondaryColor,
          ),
        ),
      );
    }));
  }
}
