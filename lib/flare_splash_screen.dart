library flare_splash_screen;

import 'package:flare_loading/flare_loading.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final String name;
  final WidgetBuilder next;
  final Function(dynamic data) onSuccess;
  final Function(dynamic error, dynamic stacktrace) onError;
  final double width;
  final double height;
  final Color backgroundColor;
  final Alignment alignment;
  final Future<void> Function() until;
  final String loopAnimation;
  final String endAnimation;
  final String startAnimation;
  final RouteTransitionsBuilder transitionsBuilder;
  final bool isLoading;
  final BoxFit fit;

  factory SplashScreen.callback({
    @required String name,
    @required Function(dynamic data) onSuccess,
    @required Function(dynamic error, dynamic stacktrace) onError,
    Key key,
    Future Function() until,
    bool isLoading,
    BoxFit fit = BoxFit.contain,
    Color backgroundColor,
    String loopAnimation,
    Alignment alignment = Alignment.center,
    double width,
    double height,
    String endAnimation,
    RouteTransitionsBuilder transitionsBuilder,
    String startAnimation,
  }) {
    return SplashScreen(
      name,
      null,
      until: until,
      fit: fit,
      backgroundColor: backgroundColor,
      loopAnimation: loopAnimation,
      startAnimation: startAnimation,
      isLoading: isLoading,
      endAnimation: endAnimation,
      width: width,
      height: height,
      transitionsBuilder: transitionsBuilder,
      onSuccess: onSuccess,
      onError: onError,
      alignment: alignment,
    );
  }

  factory SplashScreen.navigate({
    @required String name,
    @required WidgetBuilder next,
    Key key,
    bool isLoading,
    Color backgroundColor,
    Future Function() until,
    String loopAnimation,
    Alignment alignment = Alignment.center,
    BoxFit fit = BoxFit.contain,
    double width,
    double height,
    String endAnimation,
    RouteTransitionsBuilder transitionsBuilder,
    String startAnimation,
  }) {
    return SplashScreen(
      name,
      next,
      fit: fit,
      until: until,
      backgroundColor: backgroundColor,
      isLoading: isLoading,
      loopAnimation: loopAnimation,
      startAnimation: startAnimation,
      endAnimation: endAnimation,
      width: width,
      height: height,
      transitionsBuilder: transitionsBuilder,
      onSuccess: (_) {},
      onError: (_, __) {},
      alignment: alignment,
    );
  }

  const SplashScreen(
    this.name,
    this.next, {
    this.loopAnimation,
    Key key,
    this.isLoading,
    this.backgroundColor,
    this.until,
    this.alignment = Alignment.center,
    this.width,
    this.height,
    this.transitionsBuilder,
    this.endAnimation,
    this.startAnimation,
    this.onSuccess,
    this.onError,
    this.fit,
  })  : assert(!(isLoading != null && until != null),
            'isLoading and until are exclusive, pick one ;)'),
        assert(!(isLoading == null && until == null),
            'isLoading and until are null, pick one ;)'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: FlareLoading(
        endAnimation: endAnimation,
        startAnimation: startAnimation,
        loopAnimation: loopAnimation,
        width: width,
        height: height,
        fit: fit,
        onSuccess: (data) {
          _goToNext(context, data);
        },
        onError: (err, stack) {
          onError(err, stack);
        },
        name: name,
        alignment: alignment,
        until: until,
        isLoading: isLoading,
      ),
    );
  }

  _goToNext(BuildContext context, data) {
    if (next == null) {
      onSuccess(data);
    } else {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, _, __) => next(context),
          transitionsBuilder: transitionsBuilder == null
              ? (_, Animation<double> animation, __, Widget child) {
                  return FadeTransition(opacity: animation, child: child);
                }
              : transitionsBuilder,
        ),
      );
    }
  }
}
