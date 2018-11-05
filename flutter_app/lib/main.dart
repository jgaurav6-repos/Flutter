import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(NameGeneratorApp());

class NameGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Startup Name Generator",
        theme: new ThemeData(primaryColor: Colors.white),
        home: Scaffold(
          // appBar: toolbar(),
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
  final List _suggestedWords = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final _textStyle = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    WordPair wordPair = WordPair.random();
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
          ),
        ],
      ),
      body: _generateSuggestedWords(),
    );
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
    final bool alreadySaved = _saved.contains(wordPair);

    return ListTile(
      title: Text(wordPair.asPascalCase, style: _textStyle),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(new MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _textStyle,
          ),
        );
      });
      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return new Scaffold(
        appBar: AppBar(
          title: Text("Saved Suggestions"),
        ),
        body: new ListView(
          children: divided,
        ),
      );
    }));
  }
}
