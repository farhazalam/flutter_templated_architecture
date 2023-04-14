import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../config/route_constants.dart';
import '../../helpers/locale_helper.dart';
import '../../localization/l10n.dart';
import '../../provider/locale_provider.dart';

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
          Consumer<LocaleProvider>(
            builder: (_, localeProv, __) {
              return DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: localeProv.locale,
                  icon: Container(width: 12),
                  items: LocaleHelper.allLocales.map(
                    (locale) {
                      return DropdownMenuItem(
                        value: locale,
                        onTap: () {
                          localeProv.setLocale(locale);
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
