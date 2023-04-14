import 'package:shared_preferences/shared_preferences.dart';

import '../../config/locale_constants.dart';
import '../../config/preference_constants.dart';

class PreferenceService {
  final SharedPreferences _pref;
  PreferenceService(this._pref);

  //!================================USER=====================================

  void storeToken(String? token) {
    _pref.setString(PreferenceConstants.accessToken, token!);
  }

  String getToken() {
    return (_pref.getString(PreferenceConstants.accessToken) ?? '');
  }

  void logoutuser() {
    _pref.remove(PreferenceConstants.accessToken);
  }

  //!================================LOCALE=====================================

  void storeLocale(String? localeCode) {
    _pref.setString(PreferenceConstants.localeKey, localeCode!);
  }

  String getLocale() {
    return (_pref.getString(PreferenceConstants.localeKey) ??
        LocaleConstants.englishLocale);
  }

  //!================================THEME=====================================

  setDarkTheme(bool value) {
    _pref.setBool(PreferenceConstants.themeKey, value);
  }

  Future<bool> getTheme() async {
    return (_pref.getBool(PreferenceConstants.themeKey) ?? false);
  }
}
