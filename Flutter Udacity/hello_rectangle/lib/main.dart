import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Ananda",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Ananda"),
          ),
          body: SingleRow(),
        ));
  }
}

class SingleRow extends StatelessWidget {
  var _rowHeight = 80.0;
  var _circularRadius = 10.0;
  var _sidePaddings = 8.0;
  var _textStyle = TextStyle(fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    var currentColor = Colors.redAccent;

    return Material(
        child: Container(
          height: _rowHeight,
      padding: EdgeInsets.all(8.0),
      child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(_circularRadius)),
          splashColor: Colors.green,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(_sidePaddings),
                  child: Icon(
                    Icons.star,
                    color: currentColor,
                    size: 30.0,
                  )
//            child: Icon(Icons.star, color: Colors.red[500]),
                  ),
              Text(
                "FIRST ROW",
                style: _textStyle,
              )
            ],
          )),
      color: Colors.amber,
    ));
  }
}
