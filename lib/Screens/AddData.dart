import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenote/Helpers/themeDataProvider.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDataProvider>(
      builder: (context, tdp, child) {
        return Hero(
            tag: 'dataEnter',
            child: Container(
              color: tdp.primarColor,
            ));
      },
    );
  }
}
