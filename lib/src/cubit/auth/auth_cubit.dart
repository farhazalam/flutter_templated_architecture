import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../app.dart';
import 'auth_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../config/route_constants.dart';
import '../../services/local/preference.dart';
import '../../services/remote/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  final PreferenceService _preferenceService;
  final Connectivity _connectivity;
  final PackageInfo _packageInfo;

  AuthCubit(this._authService, this._preferenceService, this._connectivity,
      this._packageInfo)
      : super(const AuthState());

  Future<void> init() async {
    var versionNumber =
        'Version: ${_packageInfo.version}+${_packageInfo.buildNumber}';
    emit(state.copyWith(versionNumber: versionNumber));

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

    var customer = await _authService.getCustomerDetails();
    emit(state.copyWith(user: customer));

    customer == null
        ? GoRouter.of(navigator.currentContext!).go(Routes.login)
        : GoRouter.of(navigator.currentContext!)
            .go(Routes.home, extra: 'Test login');
  }
}
