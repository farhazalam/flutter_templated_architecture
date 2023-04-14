import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../config/constants.dart';

class FirebaseHelper {
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {}

  static void _firebaseMessagingForegroundHandler(RemoteMessage message) {
    if (message.notification != null) {}
  }

  static void initFirebaseMessaging() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging _messaging = FirebaseMessaging.instance;
    await _messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );
    _messaging.getToken().then((token) {
      log(token ?? '');
    });
    _messaging.getAPNSToken().then((apnstoken) {});

    FirebaseMessaging.onMessage.listen((RemoteMessage message) =>
        _firebaseMessagingForegroundHandler(message));

    _messaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    _messaging.onTokenRefresh.listen((event) {});

    _messaging.subscribeToTopic(Constants.alertTopic);
  }

  static NavigatorObserver initFirebaseAnalyticsObserver() {
    return FirebaseAnalyticsObserver(analytics: GetIt.I<FirebaseAnalytics>());
  }
}
