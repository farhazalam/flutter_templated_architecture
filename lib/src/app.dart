import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'provider/theme_provider.dart';
import 'theme/theme.dart';
import 'helpers/router_helper.dart';
import 'views/widgets/error_builder.dart';
import 'views/widgets/size_builder.dart';

import 'config/enviroment_constant.dart';
import 'helpers/locale_helper.dart';
import 'helpers/provider_helper.dart';
import 'provider/locale_provider.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeBuilder(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: ProviderHelper.getProvidersList(),
        child: Selector<LocaleProvider, Locale>(
          selector: (_, localeProv) => localeProv.locale,
          builder: (_, locale, __) {
            return Selector<DarkThemeProvider, bool>(
              selector: (_, themeProv) => themeProv.isDarkTheme,
              builder: (context, isDarkTheme, child) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner:
                      (dotenv.env[EnviromentConstant.enviroment] ?? '') ==
                              'production'
                          ? false
                          : true,
                  locale: locale,
                  supportedLocales: LocaleHelper.allLocales,
                  localizationsDelegates: LocaleHelper.initLocalDelegates(),
                  title: 'Structured Template',
                  routerConfig: RouterHelper.initializeRouter(),
                  theme: Themes.lightTheme(),
                  darkTheme: Themes.darkTheme(),
                  themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
                  builder: (BuildContext context, Widget? widget) {
                    ErrorWidget.builder = (FlutterErrorDetails errorDetails) =>
                        ErrorBuilderPage(errorDetails: errorDetails);

                    return widget ?? Container();
                  },
                );
              },
            );
          },
        ),
      );
    });
  }
}
