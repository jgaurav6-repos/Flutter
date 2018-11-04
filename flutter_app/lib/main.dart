import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(NameGeneratorApp());

class NameGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Startup Name Generator",
        home: Scaffold(
          appBar: toolbar(),
          body: NameGenerator(),
        ));
  }

  Widget toolbar() {
    return AppBar(title: Text("NAME GENERATOR"));
  }
}

class NameGenerator extends StatefulWidget {
  NameGeneratorState createState() => NameGeneratorState();
}

class NameGeneratorState extends State<NameGenerator> {
  List _suggestedWords = <WordPair>[];
  final _textStyle = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    WordPair wordPair = WordPair.random();
    // TODO: implement build
    return _generateSuggestedWords();
  }

  Widget _generateSuggestedWords() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }

        final index = i ~/ 2;

        if (index >= _suggestedWords.length) {
          _suggestedWords.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestedWords[index]);
        // return
      },
    );
  }

  Widget _buildRow(WordPair wordPair) {
    return ListTile(
      title: Text(wordPair.asPascalCase, style: _textStyle),
    );
  }
}
