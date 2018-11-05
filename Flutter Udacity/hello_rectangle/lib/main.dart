import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Widget Test",
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.list), onPressed: _changeContent)
          ],
          title: Text("Widgets"),
        ),
        body: ContainerTestWidget(),
      ),
    );
  }

  void _changeContent() {
    ContainerTestWidgetState obj = new ContainerTestWidgetState();
    obj.textToShow = "SECOND TEXT";
  }
}

class ContainerTestWidget extends StatefulWidget {
  @override
  ContainerTestWidgetState createState() => new ContainerTestWidgetState();
}

class ContainerTestWidgetState extends State<ContainerTestWidget> {
  var textToShow = "FIRST SDFDFKJDFKDJ";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Text('Deliver features faster', textAlign: TextAlign.left),

          ),
          Expanded(
            child: Text('Craft beautiful UIs', textAlign: TextAlign.right),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain, // otherwise the logo will be tiny
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
//      alignment: Alignment.centerRight,
    );
  }
}
