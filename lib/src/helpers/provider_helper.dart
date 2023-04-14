import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../provider/theme_provider.dart';

import '../provider/auth_provider.dart';
import '../provider/home_provider.dart';
import '../provider/locale_provider.dart';

class ProviderHelper {
  static List<SingleChildWidget> getProvidersList() {
    return [
      ChangeNotifierProvider<LocaleProvider>(
          create: (_) => GetIt.I<LocaleProvider>()),
      ChangeNotifierProvider<AuthProvider>(
          create: (_) => GetIt.I<AuthProvider>()),
      ChangeNotifierProvider<HomeProvider>(
          create: (_) => GetIt.I<HomeProvider>()),
      ChangeNotifierProvider<DarkThemeProvider>(
          create: (_) => GetIt.I<DarkThemeProvider>()),
    ];
  }
}
