# flare_splash_screen

[![pub package](https://img.shields.io/pub/v/flare_splash_screen.svg)](https://pub.dartlang.org/packages/flare_splash_screen)

Facilitator for having a Splash screen with a Flare animation until some work has been done for the initialization of the app

## Usage

### Navigation

The splash screen will show the animation and push the new route you gave once it's finish, by default it does a fade animation but you can customize it by using `transitionsBuilder`

```dart
SplashScreen.navigate(
    name: 'intro.flr',
    next: (_) => MyHomePage(title: 'Flutter Demo Home Page'),
    until: () => Future.delayed(Duration(seconds: 5)),
    startAnimation: '1',
),
```

### Callback

The splash screen will show the animation and call the `onFinished` callback when it's finish.

```dart
SplashScreen.callback(
    name: 'intro.flr',    
    onFinished: () {
      Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (_,__,___) => MyHomePage(title: 'Flutter Demo Home Page')));
    },
    loopAnimation: '1',
    until: () => Future.delayed(Duration(seconds: 1)),
    endAnimation: '1',
),
```

### API 

`name` : path/name of the flare animation

`next` : screen to show once animation is finished as widget builder

`loopAnimation`: animation name to run, default same as first param

`startAnimation`: animation name to run once before going into loop

`endAnimation`: animation name to run once `until` is complete

`until`: callback that return a future to process your initialization

`isLoading`: alternative to `until` if you want to manage loading state with a boolean

`height`: force the height of the flare animation, by default it take the all place available

`width`: force the width of the flare animation, by default it take the all place available

`alignment`: alignment of the flare animation, center by default

`transitionsBuilder` transition to apply when showing `next`

### Available animation mode

### Only one animation 
Basically you have one animation to show and then just need to stay at last frame. In order to do that only specify the `startAnimation` 

### Start and loop animation 
Your animation have an intro and a loop state, in order to do that only specify the `startAnimation` and `loopAnimation`

### End and loop animation 
Your animation have a finish and a loop state, in order to do that only specify the `endAnimation` and `loopAnimation`

### Start and end animation 
Your animation have an intro and a finish that should stay on the last frame, in order to do that only `startAnimation` and `endAnimation`

### Start, end and loop animation 
Your animation have an intro, a finish and a loop state, in order to do that specify the `startAnimation`, `endAnimation` and `loopAnimation`
