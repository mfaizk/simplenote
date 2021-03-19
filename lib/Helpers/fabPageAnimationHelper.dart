import 'package:flutter/material.dart';

class FabPageAnimationHelper<T> extends PageRouteBuilder<T> {
  final Widget page;

  FabPageAnimationHelper({@required this.page})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
          },
        );
}
