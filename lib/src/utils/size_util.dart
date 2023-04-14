import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

enum DeviceType { mobile, tablet, web, mac, windows, linux, fuchsia }

class SizeUtil {
  static late Orientation orientation;
  static late BoxConstraints boxConstraints;

  static late DeviceType deviceType;

  static late double height;
  static late double width;

  static void setScreenSize(
      Orientation currentOrientation, BoxConstraints constraints) {
    orientation = currentOrientation;
    boxConstraints = constraints;

    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth;
      height = boxConstraints.maxHeight;
    } else {
      width = boxConstraints.maxHeight;
      height = boxConstraints.maxWidth;
    }

    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else if (Platform.isAndroid || Platform.isIOS) {
      if ((orientation == Orientation.portrait && width < 600) ||
          (orientation == Orientation.landscape && height < 600)) {
        deviceType = DeviceType.mobile;
      } else {
        deviceType = DeviceType.tablet;
      }
    } else if (Platform.isMacOS) {
      deviceType = DeviceType.mac;
    } else if (Platform.isWindows) {
      deviceType = DeviceType.windows;
    } else if (Platform.isLinux) {
      deviceType = DeviceType.linux;
    } else {
      deviceType = DeviceType.fuchsia;
    }
  }
}

//! Extension
extension SizerExt on num {
  double get sizeHeight => this * SizeUtil.height / 100;
  double get sizeWidth => this * SizeUtil.width / 100;
  double get sizeSP => this * (SizeUtil.width / 3) / 100;
}
