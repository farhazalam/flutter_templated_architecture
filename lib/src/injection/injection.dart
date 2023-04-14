import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/network_handler.dart';
import '../config/constants.dart';
import '../provider/auth_provider.dart';
import '../provider/home_provider.dart';
import '../provider/locale_provider.dart';
import '../provider/theme_provider.dart';
import '../services/local/preference.dart';
import '../services/remote/auth_service.dart';
import '../services/remote/home_service.dart';

final GetIt s1 = GetIt.instance;

Future<void> initDependencyInjection() async {
  //! Connection Checker
  s1.registerLazySingleton(() => Connectivity());

  //! Dio
  s1.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    )..interceptors.add(PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
      )),
  );

  //! Shared Preference
  final pref = await SharedPreferences.getInstance();
  s1.registerLazySingleton(() => pref);

  //!Package Info
  final packageInfo = await PackageInfo.fromPlatform();
  s1.registerLazySingleton(() => packageInfo);

  //! Common
  s1.registerLazySingleton(() => PreferenceService(s1()));
  s1.registerLazySingleton(() => NetworkHandler(s1(), s1()));

  //! Sevices
  s1.registerLazySingleton(
    () => AuthService(s1()),
  );
  s1.registerLazySingleton(
    () => HomeService(s1()),
  );

  //! Providers
  s1.registerLazySingleton(
    () => AuthProvider(s1(), s1(), s1(), s1()),
  );
  s1.registerLazySingleton(
    () => HomeProvider(s1(), s1()),
  );
  s1.registerLazySingleton(
    () => LocaleProvider(s1()),
  );
  s1.registerLazySingleton(
    () => DarkThemeProvider(s1()),
  );
}
