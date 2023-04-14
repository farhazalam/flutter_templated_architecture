import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/asset_constants.dart';
import '../../provider/auth_provider.dart';
import '../../provider/locale_provider.dart';
import '../../provider/theme_provider.dart';
import '../../utils/size_util.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController animation;
  Animation<double>? _fadeInFadeOut;
  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.65, end: 1).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();

    final localeProvStatic =
        Provider.of<LocaleProvider>(context, listen: false);
    localeProvStatic.initLocale();

    final themeProvStatic =
        Provider.of<DarkThemeProvider>(context, listen: false);
    themeProvStatic.initThemeProvider();

    final authProvStatic = Provider.of<AuthProvider>(context, listen: false);
    authProvStatic.init();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.white),
          FadeTransition(
            opacity: _fadeInFadeOut!,
            child: Image.asset(
              ImageConstants.logo,
              alignment: Alignment.center,
              width: 75.sizeWidth,
            ),
          ),
        ],
      )),
    );
  }
}
