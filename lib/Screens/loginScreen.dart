import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simplenote/Helpers/firebaseAuthHelper.dart';
import 'package:simplenote/Helpers/themeDataProvider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer2<ThemeDataProvider, FirebaseAuthHelper>(
        builder: (context, tdp, fireAuthHelper, child) {
      return SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Lottie.asset('assets/header.json', fit: BoxFit.contain),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  color: tdp.currentColorMode,
                  child: SingleChildScrollView(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.05)),
                      shadowColor: tdp.secondaryColor,
                      color: tdp.primarColor,
                      elevation: 5.0,
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.02,
                          MediaQuery.of(context).size.width * 0.05,
                          MediaQuery.of(context).size.width * 0.02,
                          MediaQuery.of(context).size.width * 0.2),
                      child: Form(
                          key: key,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Divider(),
                              Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.03),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter valid Email';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        this.email = newValue.toString();
                                      });
                                    }
                                  },
                                  style: TextStyle(color: tdp.currentColorMode),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.03),
                                    labelText: 'Email',
                                    labelStyle:
                                        TextStyle(color: tdp.currentColorMode),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: tdp.currentColorMode,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: tdp.currentColorMode,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                    ),
                                    icon: Icon(
                                      Icons.email,
                                      color: tdp.currentColorMode,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.03),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter valid password';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        this.password = newValue.toString();
                                      });
                                    }
                                  },
                                  style: TextStyle(color: tdp.currentColorMode),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.03),
                                    labelText: 'Password',
                                    labelStyle:
                                        TextStyle(color: tdp.currentColorMode),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: tdp.currentColorMode,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: tdp.currentColorMode,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                    ),
                                    icon: Icon(
                                      Icons.lock,
                                      color: tdp.currentColorMode,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.03,
                                )),
                                color: tdp.tertiaryColor,
                                onPressed: () {
                                  if (key.currentState.validate())
                                    key.currentState.save();
                                  User user =
                                      fireAuthHelper.loginWithEmailAndPass(
                                          this.email, this.password);
                                  if (user == null) {
                                    print('unable to login');
                                  }
                                },
                                child: FittedBox(
                                  alignment: Alignment.center,
                                  fit: BoxFit.fill,
                                  child: Text(
                                    'Login',
                                    style:
                                        TextStyle(color: tdp.currentColorMode),
                                  ),
                                ),
                              ),
                              Divider(),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width,
                                color: tdp.primarColor,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      color: tdp.primarColor,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              fireAuthHelper.googleLogin();
                                            },
                                            child: FaIcon(
                                                FontAwesomeIcons.google,
                                                color: tdp.currentColorMode),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print('facebook');
                                            },
                                            child: FaIcon(
                                                FontAwesomeIcons.facebook,
                                                color: tdp.currentColorMode),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print('twitter');
                                            },
                                            child: FaIcon(
                                                FontAwesomeIcons.twitter,
                                                color: tdp.currentColorMode),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      color: tdp.primarColor,
                                      child: MaterialButton(
                                        elevation: 0,
                                        color: tdp.primarColor,
                                        onPressed: () {},
                                        child: FittedBox(
                                          alignment: Alignment.bottomLeft,
                                          fit: BoxFit.fill,
                                          child: Text(
                                            'skip',
                                            style: TextStyle(
                                                color: tdp.tertiaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
