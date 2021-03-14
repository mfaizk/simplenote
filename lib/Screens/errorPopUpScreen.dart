import 'package:flutter/material.dart';

class ErrorPopUpScreen extends StatefulWidget {
  @override
  _ErrorPopUpScreenState createState() => _ErrorPopUpScreenState();
}

class _ErrorPopUpScreenState extends State<ErrorPopUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
      ),
    );
  }
}
