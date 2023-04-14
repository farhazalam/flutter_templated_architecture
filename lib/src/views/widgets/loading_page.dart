import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Widget? child;
  final bool? isLoading;

  const LoadingWidget(
      {Key? key, @required this.child, @required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? Container(),
        if (isLoading ?? false)
          Container(
            color: Colors.black.withOpacity(0.2),
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          ),
      ],
    );
  }
}
