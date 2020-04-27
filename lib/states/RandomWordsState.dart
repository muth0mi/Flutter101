import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import '../main.dart';

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}
