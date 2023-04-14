import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/locale_constants.dart';
import '../../helpers/locale_helper.dart';
import '../../services/local/preference.dart';

class LocaleCubit extends Cubit<Locale> {
  final PreferenceService _preferenceService;
  LocaleCubit(this._preferenceService) : super(locale);

  static Locale locale = const Locale(LocaleConstants.englishLocale);

  void initLocale() {
    final String localeString = _preferenceService.getLocale();
    final Locale locale = LocaleHelper.allLocales.singleWhere(
        (element) => element.languageCode.compareTo(localeString) == 0);
    emit(locale);
  }

  void setLocale(Locale locale) {
    if (LocaleHelper.allLocales.contains(locale) == false) return;
    _preferenceService.storeLocale(locale.languageCode);
    emit(locale);
  }

  void clearLocale() {
    emit(const Locale(LocaleConstants.englishLocale));
  }
}
