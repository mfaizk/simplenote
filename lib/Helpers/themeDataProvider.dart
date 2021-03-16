import 'package:flutter/material.dart';

class ThemeDataProvider extends ChangeNotifier {
  Color currentColorMode = Color(0xffffffff);
  Color primarColor = Color(0xff6200EE);
  Color secondaryColor = Color(0xff3700B3);
  Color tertiaryColor = Color(0xffBB86FC);

  colorChanger(String colorString) {
    if (true) {
      this.currentColorMode = Color(0xffffffff);
      this.primarColor = Color(0xff6200EE);
      this.secondaryColor = Color(0xff3700B3);
      this.tertiaryColor = Color(0xffBB86FC);
    } else {}
    notifyListeners();
  }
}
