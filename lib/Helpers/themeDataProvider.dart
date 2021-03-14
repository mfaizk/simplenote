import 'package:flutter/material.dart';

class ThemeDataProvider extends ChangeNotifier {
  Color primarColor = Color(0xff6200EE);
  Color secondaryColor = Color(0xff3700B3);
  Color tertiaryColor = Color(0xffBB86FC);

  colorChanger(String colorString) {
    if (true) {
      this.primarColor = Color(0xff6200EE);
      this.secondaryColor = Color(0xff3700B3);
      this.tertiaryColor = Color(0xffBB86FC);
    } else {}
    notifyListeners();
  }
}
