import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedSuggestionsRoute {
  var list = List<Widget>();

  SavedSuggestionsRoute(BuildContext context, Set<WordPair> savedItems) {
    final tiles = createTiles(savedItems);
    list = createSuggestionList(context, tiles);
  }

  createTiles(Set<WordPair> savedItems) {
    final font = const TextStyle(fontSize: 18.0);

    return savedItems.map((WordPair pair) {
      return ListTile(title: Text(pair.asPascalCase, style: font));
    });
  }

  createSuggestionList(BuildContext context, Iterable<ListTile> tiles) {
    return ListTile.divideTiles(context: context, tiles: tiles).toList();
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
