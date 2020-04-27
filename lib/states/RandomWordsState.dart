import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startupnamer/routes/SavedSuggestionsRoute.dart';
import 'package:startupnamer/widgets/RandomWords.dart';

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appbar(), body: _buildSuggestions());
  }

  AppBar _appbar() {
    return AppBar(title: Text('Startup Name Generator'), actions: <Widget>[
      IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
    ]);
  }

  void _pushSaved() {
    final Iterable<ListTile> tiles = _saved.map((WordPair pair) =>
        ListTile(title: Text(pair.asPascalCase, style: _biggerFont)));

    final List<Widget> divided =
    ListTile.divideTiles(context: context, tiles: tiles).toList();

    final savedSuggestionsRoute = SavedSuggestionsRoute(divided).page;

    Navigator.of(context).push(savedSuggestionsRoute);
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair); // Add this line.

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved)
            _saved.remove(pair);
          else
            _saved.add(pair);
        });
      },
    );
  }
}
