import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simplenote/Helpers/themeDataProvider.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ThemeDataProvider>(
        builder: (context, tdp, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.075),
              child: AppBar(
                backgroundColor: tdp.currentColorMode,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Center(
                  child: Text(
                    'Add Data',
                    style: TextStyle(color: tdp.primarColor),
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: tdp.primarColor,
              onPressed: () {},
              child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.fill,
                child: FaIcon(
                  FontAwesomeIcons.check,
                  color: tdp.currentColorMode,
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.925,
                width: MediaQuery.of(context).size.width,
                color: tdp.currentColorMode,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: tdp.currentColorMode,
                      height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(hintText: 'Title'),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      color: tdp.currentColorMode,
                      child: TextFormField(
                        maxLines: 99999,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: 'Body',
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
