import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'enviroment_constant.dart';

class Constants {
//!================================CONTACT=====================================

  static const String whatsappPhone = "9876543210";
  static const String email = "inquiry@example.com";
  static const String callPhone = "9876543210";

//!================================APP URL=====================================

  static const String playstoreUrl =
      "https://play.google.com/store/apps/details?id=com.example.app";
  static const String appstoreUrl =
      "https://apps.apple.com/in/app/testapp/id123456";

//!===========================NOTIFICATION TOPICS=====================================

  static final String alertTopic =
      dotenv.env[EnviromentConstant.alertTopic] ?? '';

//!==================================API=============================================

  static final String baseUrl = dotenv.env[EnviromentConstant.baseUrl] ?? '';
}
