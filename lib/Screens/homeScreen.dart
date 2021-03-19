import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenote/Helpers/themeDataProvider.dart';
import 'package:simplenote/Screens/AddData.dart';

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
        bottomNavigationBar: BottomAppBar(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          shape: CircularNotchedRectangle(),
          color: tdp.primarColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton(
          backgroundColor: tdp.currentColorMode,
          elevation: 5.0,
          onPressed: () {
            // FirebaseAuth.instance.signOut();

            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return AddData();
              },
            ));
          },
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.fill,
            child: Icon(
              Icons.add,
              color: tdp.primarColor,
            ),
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
