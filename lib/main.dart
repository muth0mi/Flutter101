import 'package:flutter/material.dart';
import 'package:startupnamer/widgets/RandomWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: RandomWords(),
      );

}