import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertemplate/src/app.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../config/route_constants.dart';
import '../models/user.dart';
import '../services/local/preference.dart';
import '../services/remote/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  final PreferenceService _preferenceService;
  final Connectivity _connectivity;
  final PackageInfo _packageInfo;
  AuthProvider(this._authService, this._preferenceService, this._connectivity,
      this._packageInfo);

  User? customer;
  String versionNumber = '';

  Future<void> init() async {
    versionNumber =
        'Version: ${_packageInfo.version}+${_packageInfo.buildNumber}';
    var connectionStatus = await _connectivity.checkConnectivity();
    if (connectionStatus == ConnectivityResult.none) {
      GoRouter.of(navigator.currentContext!).go(Routes.noInternet);
      return;
    }

    String token = _preferenceService.getToken();
    if (token.isEmpty) {
      await Future.delayed(const Duration(seconds: 2));
      GoRouter.of(navigator.currentContext!).go(Routes.login);
      return;
    }

    customer = await _authService.getCustomerDetails();
    notifyListeners();
    customer == null
        ? GoRouter.of(navigator.currentContext!).go(Routes.login)
        : GoRouter.of(navigator.currentContext!)
            .go(Routes.home, extra: 'Test login');
  }
}
