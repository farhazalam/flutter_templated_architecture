import 'package:go_router/go_router.dart';

import '../config/route_constants.dart';
import '../views/auth/login.dart';
import '../views/home/home.dart';
import '../views/widgets/no_internet.dart';

class CustomRouter {
  static List<GoRoute> getRoutes() {
    return [
      GoRoute(
        path: Routes.home,
        builder: (context, state) =>
            HomePage(title: (state.extra as String?) ?? ''),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.noInternet,
        builder: (context, state) => const NoInternetPage(),
      ),
    ];
  }
}
