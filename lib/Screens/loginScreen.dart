import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simplenote/Helpers/themeDataProvider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<ThemeDataProvider>(builder: (context, tdp, child) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Lottie.asset('assets/header.json', fit: BoxFit.contain),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Card(
                  color: Colors.white,
                  elevation: 5.0,
                  shadowColor: tdp.primarColor,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.02,
                        MediaQuery.of(context).size.width * 0.05,
                        MediaQuery.of(context).size.width * 0.02,
                        MediaQuery.of(context).size.width * 0.2),
                    child: Container(
                      decoration: BoxDecoration(
                          color: tdp.primarColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
