import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../config/route_constants.dart';
import '../../cubit/locale/locale_cubit.dart';
import '../../helpers/locale_helper.dart';
import '../../localization/l10n.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<LocaleCubit, Locale>(
            builder: (context, state) {
              return DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: state,
                  icon: Container(width: 12),
                  items: LocaleHelper.allLocales.map(
                    (locale) {
                      return DropdownMenuItem(
                        value: locale,
                        onTap: () {
                          ReadContext(context)
                              .read<LocaleCubit>()
                              .setLocale(locale);
                        },
                        child: Center(
                          child: Text(
                            locale.languageCode,
                            style: const TextStyle(fontSize: 32),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (_) {},
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          Text(
            context.l10n?.helloWorld ?? '',
          ),
          ElevatedButton(
              onPressed: () {
                context.push(Routes.home, extra: 'Test');
              },
              child: const Text('Next Page'))
        ],
      )),
    );
  }
}
