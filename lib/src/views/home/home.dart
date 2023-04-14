import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/localization/l10n.dart';
import '../../cubit/theme/theme_cubit.dart';
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
          BlocBuilder<ThemeCubit, bool>(
            builder: (context, state) {
              return Switch(
                value: state,
                onChanged: (value) {
                  context.read<ThemeCubit>().updateIsDarkTheme(value);
                },
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
