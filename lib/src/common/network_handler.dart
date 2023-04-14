import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:go_router/go_router.dart';

import '../app.dart';
import '../config/route_constants.dart';
import '../services/local/preference.dart';
import '../utils/alerts.dart';

class NetworkHandler {
  final Dio _dio;
  final PreferenceService _preferenceService;
  NetworkHandler(this._dio, this._preferenceService);

  //! GET REQUEST
  Future get({required String url}) async {
    try {
      final res = await _dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer ${_preferenceService.getToken()}'},
        ),
      );
      if (res.statusCode == 400) {
        var message = res.data['message'];
        Alerts.showErrorSnackbar(
            (message is String) ? message : 'Something went wrong');
      }
      if (res.statusCode == 403) {
        _preferenceService.logoutuser();
        GoRouter.of(navigator.currentContext!).go(Routes.login);
      }

      if (res.statusCode == 200 || res.statusCode == 201) {
        return res;
      } else {
        return null;
      }
    } catch (e, stackTrace) {
      await FirebaseCrashlytics.instance
          .recordError(e, stackTrace, reason: 'Error in Http GET', fatal: true);
      Alerts.showErrorSnackbar('Something went wrong');
      return null;
    }
  }

  //! POST REQUEST
  Future post({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      final res = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer ${_preferenceService.getToken()}'},
        ),
      );
      if (res.statusCode == 400) {
        var message = res.data['message'];
        Alerts.showErrorSnackbar(
            (message is String) ? message : 'Something went wrong');
      }
      if (res.statusCode == 403) {
        _preferenceService.logoutuser();
        GoRouter.of(navigator.currentContext!).go(Routes.login);
      }

      if (res.statusCode == 200 || res.statusCode == 201) {
        return res;
      } else {
        return null;
      }
    } catch (e, stackTrace) {
      await FirebaseCrashlytics.instance.recordError(e, stackTrace,
          reason: 'Error in Http POST', fatal: true);
      Alerts.showErrorSnackbar('Something went wrong');
      return null;
    }
  }

  //! UPDATE REQUEST
  Future put({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      final res = await _dio.put(
        url,
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer ${_preferenceService.getToken()}'},
        ),
      );
      if (res.statusCode == 400) {
        var message = res.data['message'];
        Alerts.showErrorSnackbar(
            (message is String) ? message : 'Something went wrong');
      }
      if (res.statusCode == 403) {
        _preferenceService.logoutuser();
        GoRouter.of(navigator.currentContext!).go(Routes.login);
      }

      if (res.statusCode == 200 || res.statusCode == 201) {
        return res;
      } else {
        return null;
      }
    } catch (e, stackTrace) {
      await FirebaseCrashlytics.instance
          .recordError(e, stackTrace, reason: 'Error in Http PUT', fatal: true);
      Alerts.showErrorSnackbar('Something went wrong');
      return null;
    }
  }

  //! DELETE REQUEST
  Future delete({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      final res = await _dio.delete(
        url,
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer ${_preferenceService.getToken()}'},
        ),
      );
      if (res.statusCode == 400) {
        var message = res.data['message'];
        Alerts.showErrorSnackbar(
            (message is String) ? message : 'Something went wrong');
      }
      if (res.statusCode == 403) {
        _preferenceService.logoutuser();
        GoRouter.of(navigator.currentContext!).go(Routes.login);
      }

      if (res.statusCode == 200 || res.statusCode == 201) {
        return res;
      } else {
        return null;
      }
    } catch (e, stackTrace) {
      await FirebaseCrashlytics.instance
          .recordError(e, stackTrace, reason: 'Error in Http DEL', fatal: true);
      Alerts.showErrorSnackbar('Something went wrong');
      return null;
    }
  }

  //! Post Form Data
  Future postFormData({
    required String url,
    required FormData data,
  }) async {
    try {
      final res = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer ${_preferenceService.getToken()}'},
        ),
      );
      if (res.statusCode == 400) {
        var message = res.data['message'];
        Alerts.showErrorSnackbar(
            (message is String) ? message : 'Something went wrong');
      }
      if (res.statusCode == 403) {
        _preferenceService.logoutuser();
        GoRouter.of(navigator.currentContext!).go(Routes.login);
      }

      if (res.statusCode == 200 || res.statusCode == 201) {
        return res;
      } else {
        return null;
      }
    } catch (e, stackTrace) {
      await FirebaseCrashlytics.instance.recordError(e, stackTrace,
          reason: 'Error in Http Form Data', fatal: true);
      Alerts.showErrorSnackbar('Something went wrong');
      return null;
    }
  }
}
