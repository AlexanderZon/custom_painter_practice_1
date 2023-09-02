import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = true;
  ThemeData _currentTheme = ThemeData.light();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = setCurrentThemeLight();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = setCurrentThemeDark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        break;
    }
  }

  bool get darkTheme => this._darkTheme;

  set darkTheme(value) {
    this._darkTheme = value;
    this._customTheme = false;

    if (value) {
      _currentTheme = setCurrentThemeDark();
    } else {
      _currentTheme = setCurrentThemeLight();
    }

    notifyListeners();
  }

  bool get customTheme => this._customTheme;
  set customTheme(value) {
    this._customTheme = value;
    this._darkTheme = false;

    if (value) {
      _currentTheme = setCurrentThemeLight();
    } else {
      _currentTheme = setCurrentThemeLight();
    }
    notifyListeners();
  }

  ThemeData get currentTheme => this._currentTheme;

  ThemeData setCurrentThemeDark() {
    _currentTheme = ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff16202B),
        secondaryHeaderColor: Color(0xff48A0EB),
        primaryColor: Colors.pink,
        primaryColorDark: Colors.pink,
        textTheme: TextTheme(bodySmall: TextStyle(color: Colors.white)));
    return _currentTheme;
  }

  ThemeData setCurrentThemeLight() {
    _currentTheme = ThemeData.light()
        .copyWith(primaryColor: Colors.pink, primaryColorDark: Colors.pink);
    return _currentTheme;
  }
}
