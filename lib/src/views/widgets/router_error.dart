import 'package:flutter/material.dart';

class RouterErrorPage extends StatelessWidget {
  final String message;
  const RouterErrorPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              const CircleAvatar(radius: 10, backgroundColor: Colors.red),
              const SizedBox(width: 25),
              Expanded(child: Text('Navigation error: $message')),
            ],
          ),
        ),
      ),
    );
  }
}
