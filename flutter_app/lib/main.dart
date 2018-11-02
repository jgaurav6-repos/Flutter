import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      home: AppPage(),
    );
  }
}

class AppPage extends StatefulWidget{
  AppPage({Key key}) : super(key : key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage>{

  String textToShow = "I like Flutter";

  void updateText() {
    setState(() {
      if(textToShow == "Hello World"){
        textToShow = "I like Flutter";
      }
      else
      textToShow = "Hello World";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
    body: Center(child: Text(textToShow)),
    floatingActionButton: FloatingActionButton(
        onPressed: updateText,
        tooltip: "Update Text",
        child: Icon(Icons.update),
    ),
    );
  }


}