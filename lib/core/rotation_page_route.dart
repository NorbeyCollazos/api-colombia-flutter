import 'package:flutter/material.dart';

class RotationPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  RotationPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return RotationTransition(
              turns: animation,
              child: child,
            );
          },
        );
}