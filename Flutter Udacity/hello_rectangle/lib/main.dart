import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'dart:async';
import 'dart:collection';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        title: "Ananda Timer",
        home: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              new IconButton(
                  icon: const Icon(Icons.list), onPressed: _pressedMenu)
            ],
            title: Text("Ananda Timer"),
          ),
          body: TimerPage(),
        ));
  }

  void _pressedMenu() {
    print("TESTED");
  }
}

class TimerPage extends StatefulWidget {
  @override
  TimerPageState createState() => new TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  // Get the total count down value here
  var totalTime = 100;

  //This variable is updated on each tick of the timer by -1
  var timeLeft = 100;

  StreamSubscription periodicSub;

  var currentIcon = 0;
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
        children: <Widget>[_row1(context), _row2(), _row3()],
      ),
    );
  }

  Widget _row1(BuildContext context2) {
    return Container(
        padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
        height: 100.0,
        child: Row(
          children: <Widget>[
            Text(
              "Total time:",
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
                      currentIcon == 0 ? Icons.play_arrow : Icons.pause,
                      size: 25.0,
                    ),
                    callback: () {
                      this.setState(() {
                        if (currentIcon == 0) {
                          currentIcon = 1;
                          periodicSub = new Stream.periodic(
                                  const Duration(seconds: 1), (v) => v)
                              .take(totalTime)
                              .listen(
                                (count) => this.setState(() {
                                      timeLeft--;
                                      for(int i=0; i<MakeListState.test.length; i++){
                                        if(MakeListState.test[i].values.first > 0){
                                          MakeListState.test[i] = {MakeListState.test[i].keys.first : MakeListState.test[i].values.first-1};
                                          return;
                                        }
                                      }
                                    }),
                              );
                        } else {
                          currentIcon = 0;
                          periodicSub.cancel();
                        }
                      });
                    },
                    gradient: Gradients.hotLinear,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget _row2() {
    return Center(
        child: Text(
      timeLeft.toString(),
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
  static MakeListState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<MakeListState>());

  @override
  MakeListState createState() => new MakeListState();
}

class MakeListState extends State<MakeList> {
  void testHere(BuildContext context) {
    print(context);
  }

  var _rowHeight = 75.0;
  var _textStyle = TextStyle(fontSize: 20.0, color: Color(0xFF000000));
  var _indexStyle = TextStyle(fontSize: 20.0, color: Color(0xFFFEAF83));

  static var test = [
    {"Workout": 5},
    {"Rest": 15},
    {"Cycles": 15},
    {"Rest": 15},
    {"Prepare": 5},
    {"FUCK": 25},
    {"THIS": 35},
    {"SHIT": 15},
  ];

  var activities = [
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
        if (i >= activities.length * 2) {
          return null;
        }
        if (i.isOdd) {
//          print(test[(i/2).round()].val.first);
          return Divider();
        }

        return _singleRow(test[(i / 2).round()].keys.first, (i / 2).round(),
            test[(i / 2).round()].values.first);
      },
    );
  }

  Widget _singleRow(String activity, int index, durationOfActivity) {
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
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
                      child: Text(
                        activity,
                        style: _textStyle,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: Text(
                    durationOfActivity.toString(),
                    style: TextStyle(fontSize: 22.0),
                  ),
                )
              ],
            ),
          ],
        ),
        onTap: () {
          setState(() {});
        },
      ),
//          color: bgColor,
    ));
  }
}
