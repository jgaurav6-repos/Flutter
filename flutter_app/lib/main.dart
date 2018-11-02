import 'package:flutter/material.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: "Test App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleStatefulApp(),
    ));
  }
}

class SampleStatefulApp extends StatefulWidget {
  SampleStatefulApp({Key key}) : super(key: key);

  @override
  _SampleStatefulAppState createState() => _SampleStatefulAppState();
}

class _SampleStatefulAppState extends State<SampleStatefulApp> {
  String stringToUpdate = "Initial String";

  void _updateString() {
    setState(() {
//    stringToUpdate = (stringToUpdate == "Initial String" ? "Second String" : "Initial String");
      if (stringToUpdate == "Initial String") {
        stringToUpdate = "Next Value";
      } else {
        stringToUpdate = "Initial String";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar Text"),
      ),
      body: Center(
        child: Text(stringToUpdate),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateString,
        tooltip: "change text",
        child: Icon(Icons.update),
      ),
    );
  }
}
