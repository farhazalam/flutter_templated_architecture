import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/asset_constants.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../../cubit/locale/locale_cubit.dart';
import '../../cubit/theme/theme_cubit.dart';
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

    context.read<LocaleCubit>().initLocale();
    context.read<ThemeCubit>().initThemeProvider();
    context.read<AuthCubit>().init();
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
