# flare_splash_screen

Facilitator for having a Splash screen with a Flare animation

## Usage

```dart
SplashScreen(
  'animation.flr', 
  HomeScreen(),
  animation: 'circle',
);
```

First param: path/name of the flare animation

Second param: next screen to show once animation is finished

`animation`: animation name to run, default same as first param

Be careful, flare animation should not be looped or the next screen will never be shown. 
 