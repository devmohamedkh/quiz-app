import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/pages/result%20page/reuslt_page.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/python.json'),
        builder: (context, snapshot) {
          List mydata = jsonDecode(snapshot.data.toString());
          if (mydata == null) {
            return Scaffold(
                body: Center(
              child: Text('loding'),
            ));
          } else {
            return QuizPage(mydata: mydata);
          }
        });
  }
}

class QuizPage extends StatefulWidget {
  final mydata;
  QuizPage({Key key, this.mydata}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState(mydata);
}

class _QuizPageState extends State<QuizPage> {
  final mydata;

  _QuizPageState(this.mydata);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('quze'),
            content: Text('you cant go back now.. '),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          ),
        );
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][nexetQustione.toString()],
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Quando',
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      answerBTN('a'),
                      answerBTN('b'),
                      answerBTN('c'),
                      answerBTN('d'),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                      child: Text(
                    showTimer,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                )),
          ],
        ),
      ),
    );
  }

  Widget answerBTN(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: MaterialButton(
        onPressed: () {
          chakAnswer(k);
        },
        child: Text(
          mydata[1][nexetQustione.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Quando',
            fontSize: 16,
          ),
          maxLines: 1,
        ),
        color: btnColor[k],
        minWidth: 200,
        height: 45,
        splashColor: Colors.indigoAccent[700],
        highlightColor: Colors.indigo[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  ///  to chang color an answer
  Map<String, Color> btnColor = {
    'a': Colors.indigoAccent,
    'b': Colors.indigoAccent,
    'c': Colors.indigoAccent,
    'd': Colors.indigoAccent,
  };
  //
  @override
  void initState() {
    startTimer();
    super.initState();
  }

//       for chang color in answer
  Color colorToShow = Colors.indigoAccent;
  Color truAnswer = Colors.green;
  Color folsAnswer = Colors.red;
  int marks = 0;
  int nexetQustione = 1;
  int timer = 30;
  String showTimer = '30';
  bool canselTimer = false;

  /// Moving on to the next question
  nxetQustioneFN() {
    setState(() {
      canselTimer = false;

      timer = 30;

      if (nexetQustione < 5) {
        nexetQustione++;
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ReuseltPage(),
            ));
      }
      btnColor['a'] = Colors.indigoAccent;
      btnColor['b'] = Colors.indigoAccent;
      btnColor['c'] = Colors.indigoAccent;
      btnColor['d'] = Colors.indigoAccent;
    });
    startTimer();
  }

  // to chake the answer and change the color
  chakAnswer(String k) {
    if (mydata[2]['1'] == mydata[1]['1'][k]) {
      marks = marks + 5;
      colorToShow = truAnswer;
    } else {
      colorToShow = folsAnswer;
    }
    setState(() {
      btnColor[k] = colorToShow;
      canselTimer = true;
    });
    // to move aftuer 3 second
    Timer(Duration(seconds: 2), nxetQustioneFN);
  }

  /// to timer
  startTimer() async {
    const onsec = Duration(seconds: 1);
    Timer.periodic(onsec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nxetQustioneFN();
        } else if (canselTimer == true) {
          t.cancel();
        } else {
          timer--;
        }
        showTimer = timer.toString();
      });
    });
  }
}
