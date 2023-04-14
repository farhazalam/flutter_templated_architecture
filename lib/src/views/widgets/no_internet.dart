import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/route_constants.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'Some image',
              alignment: Alignment.center,
              height: 90,
            ),
            const SizedBox(height: 30),
            const Text('Whoops!',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Slow or no internet connection',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey)),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                context.go(Routes.noInternet);
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20)),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary)),
              child: const Text(
                'Retry',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      )),
    );
  }
}
