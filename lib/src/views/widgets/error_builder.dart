import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/size_util.dart';

class ErrorBuilderPage extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const ErrorBuilderPage({Key? key, required this.errorDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) {
      FirebaseCrashlytics.instance.recordError(
          errorDetails.exception, errorDetails.stack,
          reason: 'Error occured (Red Screen)', fatal: true);
    }

    return Scaffold(
        backgroundColor: Colors.cyan[100],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: kReleaseMode
                  ? [
                      const Text(
                          'Something went wrong, please try again later.',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ]
                  : [
                      const Text('Error Occured ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 18)),
                      const SizedBox(height: 14),
                      const Text('Error: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 14),
                      Text(errorDetails.exceptionAsString()),
                      const SizedBox(height: 14),
                      const Text('Stack Trace: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 14),
                      SizedBox(
                        height: 30.sizeHeight,
                        child: SingleChildScrollView(
                            child: Text(errorDetails.stack.toString())),
                      )
                    ],
            ),
          ),
        ));
  }
}
