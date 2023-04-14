import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/local/preference.dart';

class ThemeCubit extends Cubit<bool> {
  final PreferenceService _preferenceService;
  ThemeCubit(this._preferenceService) : super(isDarkTheme);

  static const isDarkTheme = false;

  void updateIsDarkTheme(bool value) {
    emit(value);
    _preferenceService.setDarkTheme(value);
  }

  void initThemeProvider() async {
    final bool isDark = await _preferenceService.getTheme();
    emit(isDark);
  }
}
