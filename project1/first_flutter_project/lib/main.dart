import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Hello Flutter App",
    home: new Material(
        color: Colors.orange,
        child: Center(
          child: Text(
            "Hello LOLLLLL!",
            textDirection: TextDirection.ltr,
          ),
        )),
  ));
}
