import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          body: SafeArea(
            child: Container(
        color: Colors.red,
        child:MyHomePage(),
      ),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numOfCards = 0;

  _incrementCardCount() {
    setState(() {
      numOfCards = ++numOfCards;
    });
  }

  _decrementCardCount() {
    setState(() {
      if (numOfCards == 0) {
        return;
      }
      numOfCards = --numOfCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCardCount,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: _decrementCardCount,
              icon: Icon(Icons.remove),
            )
          ],
          title: Center(child: Text("Hello World")),
        ),
        body: ListView(
          children: _getCards(numOfCards),
        ),
      ),
    );
  }

  List<Widget> _getCards(int numberOfCards) {
    List<Widget> widgetList = [];
    for (int i = 0; i <= numberOfCards - 1; i++) {
      String word = generateNoun().take(1).toList()[0].toString();
      var card = RandomWordCard(text: word);
      widgetList.add(card);
    }

    return widgetList;
  }
}

class RandomWordCard extends StatelessWidget {
  final String text;

  RandomWordCard({@required this.text, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue[100],
      child: Container(
        height: 200,
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: FlutterLogo(
                size: 100,
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Container(
                  child: Text(text),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
