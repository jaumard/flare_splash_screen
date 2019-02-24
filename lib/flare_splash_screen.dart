library flare_splash_screen;

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final String name;
  final Widget next;
  final String animation;

  const SplashScreen(this.name, this.next, {
    this.animation,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      name,
      animation: animation ?? name,
      callback: (_) =>
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => next,
              transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          ),
    );
  }
}
