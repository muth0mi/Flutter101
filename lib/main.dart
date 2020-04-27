import 'package:flutter/material.dart';
import 'package:startupnamer/widgets/RandomWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme,
      darkTheme: _darkTheme,
      home: RandomWords(),
    );
  }
}

final _theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
);

final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
);
