import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange
//          primaryColor: Color(0xFFFEAF83),
//          primaryColorDark: Color(0xFFF67E3B),

        ),
        title: "Ananda Timer",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Ananda Timer"),
          ),
          body: TimerPage(),
        ));
  }
}

class TimerPage extends StatefulWidget {
  @override
  TimerPageState createState() => new TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  var _textStyleTimeLeftTextView =
      TextStyle(fontSize: 18.0, color: Color(0xFFFF803A));
  var _textStyleTimeLeftValue =
      TextStyle(fontSize: 18.0, color: Color(0xFF000000));
  var _countDownTextValue =
      TextStyle(fontSize: 150.0, color: Color(0xFF717171));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_row1(), _row2(), _row3()],
      ),
    );
  }

  Widget _row1() {
    return Container(
        padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
        height: 100.0,
        child: Row(
          children: <Widget>[
            Text(
              "Time left: ",
              style: _textStyleTimeLeftTextView,
            ),
            Text(
              "100 secs",
              style: _textStyleTimeLeftValue,
            ),
            Expanded(
              child: Align(
                alignment: Alignment(1.0, 0.0),
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  child: CircularGradientButton(
                    child: Icon(
                      Icons.pause,
                      size: 25.0,
                    ),
                    callback: () {},
                    gradient: Gradients.hotLinear,
                  ),
                ),
              ),
              flex: 1,
            )
          ],
        ));
  }

  Widget _row2() {
    return Center(
        child: Text(
      "10",
      style: _countDownTextValue,
    ));
  }

  Widget _row3() {
    return Expanded(
      child: MakeList(),
    );
  }
}

class MakeList extends StatefulWidget {
  @override
  MakeListState createState() => new MakeListState();
}

class MakeListState extends State<MakeList> {
  var _rowHeight = 75.0;
  var _textStyle = TextStyle(fontSize: 20.0, color: Color(0xFF000000));
  var _indexStyle = TextStyle(fontSize: 20.0, color: Color(0xFFFEAF83));

  var activities = [
    "Prepare",
    "Workout",
    "Rest",
    "Cycles",
    "Rest",
    "Prepare",
    "FUCK",
    "THIS",
    "SHIT"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
//      padding: EdgeInsets.all(8.0),
      itemBuilder: (context, i) {
        if (i >= activities.length) {
          return null;
        }

        return _singleRow(activities[i], i);
      },
    );
  }

  Widget _singleRow(String activity, int index) {
    return Material(
        child: Container(
      height: _rowHeight,
      child: InkWell(
        highlightColor: Color(0xFFFEF0E8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      ((index + 1).toString() + "."),
                      style: _indexStyle,
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
                    child: Text(
                      activity,
                      style: _textStyle,
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment(0.7, 0.0),
                    child: Text(
                      "10",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        onTap: () {
          setState(() {
//            Scaffold.of(context).showSnackBar(new SnackBar(
//              content: new Text("SHOWED"),
//            ));
          });
        },
      ),
//          color: bgColor,
    ));
  }
}
