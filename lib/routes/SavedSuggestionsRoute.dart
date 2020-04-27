import 'package:flutter/material.dart';

class SavedSuggestionsRoute {
  var list = List<Widget>();

  SavedSuggestionsRoute(List<Widget> divided) {
    list = divided;
  }

  MaterialPageRoute build() {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('Saved Suggestions')),
            body: ListView(children: list));
      },
    );
  }
}
