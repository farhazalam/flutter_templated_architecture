import 'package:flutter/material.dart';

import '../config/locale_constants.dart';
import '../helpers/locale_helper.dart';
import '../services/local/preference.dart';

class LocaleProvider extends ChangeNotifier {
  final PreferenceService _preferenceService;
  LocaleProvider(this._preferenceService);

  Locale _locale = const Locale(LocaleConstants.englishLocale);
  Locale get locale => _locale;

  void initLocale() {
    final String localeString = _preferenceService.getLocale();
    final Locale locale = LocaleHelper.allLocales.singleWhere(
        (element) => element.languageCode.compareTo(localeString) == 0);
    _locale = locale;
  }

  void setLocale(Locale locale) {
    if (LocaleHelper.allLocales.contains(locale) == false) return;
    _preferenceService.storeLocale(locale.languageCode);
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale(LocaleConstants.englishLocale);
    notifyListeners();
  }
}
