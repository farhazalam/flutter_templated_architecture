import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../config/locale_constants.dart';

class LocaleHelper {
  static final allLocales = [
    const Locale(LocaleConstants.englishLocale),
    const Locale(LocaleConstants.hindiLocale)
  ];

  static Iterable<LocalizationsDelegate<dynamic>> initLocalDelegates() {
    return [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
  }
}
