library flare_splash_screen;

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final String name;
  final Widget next;
  final double width;
  final double height;
  final Alignment alignment;
  final Future<void> Function() until;
  final String animation;
  final String endAnimation;
  final RoutePageBuilder transitionsBuilder;

  const SplashScreen(
    this.name,
    this.next, {
    this.animation,
    Key key,
    this.until,
    this.alignment = Alignment.center,
    this.width = double.infinity,
    this.height = double.infinity,
    this.transitionsBuilder,
    this.endAnimation,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _currentAnimation;

  @override
  void initState() {
    _currentAnimation = widget.animation ?? widget.name;
    _processCallback();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: widget.alignment,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: FlareActor(
            widget.name,
            animation: _currentAnimation,
            callback: (_) => _goToNext(),
          ),
        ),
      ),
    );
  }

  Future _processCallback() async {
    if(widget.until != null) {
      await widget.until();
      setState(() {
        _currentAnimation = widget.endAnimation;
      });
    }
  }

  _goToNext() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => widget.next,
        transitionsBuilder: widget.transitionsBuilder == null
            ? (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(opacity: animation, child: child);
              }
            : widget.transitionsBuilder,
      ),
    );
  }
}
