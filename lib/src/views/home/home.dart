import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/src/localization/l10n.dart';
import 'package:provider/provider.dart';

import '../../helpers/locale_helper.dart';
import '../../provider/locale_provider.dart';
import '../../provider/theme_provider.dart';
import '../../utils/alerts.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Alerts.showInfoSnackbar('Some Error');
            },
            child: const Text('Show Snackbar'),
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseCrashlytics.instance.recordError(
                    'some error', null,
                    reason: 'Error in Home', fatal: true);
              },
              child: const Text('Crash Report')),
          const Text('Dark Mode'),
          Consumer<DarkThemeProvider>(
            builder: (context, prov, child) {
              return Switch(
                value: prov.isDarkTheme,
                onChanged: (value) {
                  prov.isDarkTheme = value;
                },
              );
            },
          ),
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
          )
        ],
      ),
    );
  }
}
