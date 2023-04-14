import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertemplate/src/helpers/router_helper.dart';
import 'package:get_it/get_it.dart';
import 'cubit/auth/auth_cubit.dart';
import 'cubit/locale/locale_cubit.dart';
import 'cubit/theme/theme_cubit.dart';
import 'theme/theme.dart';
import 'views/widgets/error_builder.dart';
import 'views/widgets/size_builder.dart';

import 'config/enviroment_constant.dart';
import 'helpers/locale_helper.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeBuilder(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetIt.I<ThemeCubit>(),
          ),
          BlocProvider(
            create: (context) => GetIt.I<LocaleCubit>(),
          ),
          BlocProvider(
            create: (context) => GetIt.I<AuthCubit>(),
          ),
        ],
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            return BlocBuilder<ThemeCubit, bool>(
              builder: (context, isDarkTheme) {
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
