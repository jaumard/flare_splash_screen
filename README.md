# flare_splash_screen

Facilitator for having a Splash screen with a Flare animation until some work has been done for the initialization of the app

## Usage

```dart
SplashScreen(
  'animation.flr', 
  HomeScreen(),
  animation: 'circle',
);
```

First param: path/name of the flare animation

Second param: `next` screen to show once animation is finished

`animation`: animation name to run, default same as first param

`until`: callback that return a future to process your initialization

`endAnimation`: animation name to run once `until` is complete

`height`: force the height of the flare animation, by default it take the all place available

`width`: force the width of the flare animation, by default it take the all place available

`alignment`: alignment of the flare animation, center by default

`transitionsBuilder` transition to apply when showing `next`

Be careful, flare animation should:
 
- not be looped for `animation` if you don't set `until`/`endAnimation`
- be looped for `animation` if you set `until`/`endAnimation` 
- not be looped at all for `endAnimation` 

If you don't follow that the next screen will never be shown.