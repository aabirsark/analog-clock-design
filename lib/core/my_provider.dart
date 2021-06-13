import 'package:flutter/widgets.dart';

class MyThemeProvider extends ChangeNotifier {
  bool _lightTheme = true;

  // ? to change the value
  void changeThemeState() {
    _lightTheme = !_lightTheme;
    notifyListeners();
  }

  // ? getter of _lightTheme
  bool get themeMode => _lightTheme;
}
