import 'package:flutter/material.dart';

import '../services/local/preference.dart';

class DarkThemeProvider with ChangeNotifier {
  final PreferenceService _preferenceService;
  DarkThemeProvider(this._preferenceService);

  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    _preferenceService.setDarkTheme(value);
    notifyListeners();
  }

  void initThemeProvider() async {
    final bool isDark = await _preferenceService.getTheme();
    isDarkTheme = isDark;
  }
}
