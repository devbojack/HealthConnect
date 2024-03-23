import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyBackground extends StatelessWidget {
  const MyBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Theme.of(context).colorScheme.brightness,
          systemNavigationBarIconBrightness: Theme.of(context).colorScheme.brightness,
        ),
        child: child,
      ),
    );
  }
}