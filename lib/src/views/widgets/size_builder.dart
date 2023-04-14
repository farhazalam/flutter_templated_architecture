import 'package:flutter/widgets.dart';

import '../../utils/size_util.dart';

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

class SizeBuilder extends StatelessWidget {
  const SizeBuilder({Key? key, required this.builder}) : super(key: key);
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtil.setScreenSize(orientation, constraints);
        return builder(context, orientation, SizeUtil.deviceType);
      });
    });
  }
}
