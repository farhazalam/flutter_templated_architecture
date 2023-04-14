import 'package:flutter/material.dart';

import '../app.dart';

class Alerts {
  static showSuccessSnackbar(String title) {
    ScaffoldMessenger.of(navigator.currentContext!).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20,
              width: 2,
              color: Colors.green,
            ),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      ),
    );
  }

  static showErrorSnackbar(String title) {
    ScaffoldMessenger.of(navigator.currentContext!).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20,
              width: 2,
              color: Colors.red,
            ),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      ),
    );
  }

  static showInfoSnackbar(String title) {
    ScaffoldMessenger.of(navigator.currentContext!).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20,
              width: 2,
              color: Colors.blue,
            ),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      ),
    );
  }
}
