import 'package:fluttertemplate/src/router/router.dart';
import 'package:go_router/go_router.dart';
import '../app.dart';

import '../config/route_constants.dart';

class RouterHelper {
  static GoRouter initializeRouter() {
    return GoRouter(
      initialLocation: Routes.login,
      navigatorKey: navigator,
      routes: CustomRouter.getRoutes(),
    );
  }
}
