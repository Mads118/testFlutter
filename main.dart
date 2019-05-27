import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(
    title: 'Første Projekt i Flutter',
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('First Page'),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              'assets/images/wmvmmdxqszrdpiwgkoun.jpg',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.orange,
              child: Text('Open Second Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Word List',
      theme: ThemeData(fontFamily: 'Baloo Bhai'),
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder:  (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Words List'),
      ),
      body: _buildSuggestions(),
    );
  }

}


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
