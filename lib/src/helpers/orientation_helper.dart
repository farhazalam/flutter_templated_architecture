import 'package:flutter/services.dart';

class OrientationHelper {
  static Future setPreferredOrientation() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
