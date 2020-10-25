import 'package:flutter/material.dart';
import 'package:quiz/pages/home/home.dart';

class ReuseltPage extends StatefulWidget {
  final int marks;

  const ReuseltPage({Key key, this.marks}) : super(key: key);

  @override
  _ReuseltPageState createState() => _ReuseltPageState(marks);
}

class _ReuseltPageState extends State<ReuseltPage> {
  final int marks;
  String message;
  String image;
  List<String> imageRruselt = [
    'images/success.png',
    'images/good.png',
    'images/bad.png',
  ];
  _ReuseltPageState(this.marks);
  @override
  void initState() {
    if (marks < 20) {
      image = imageRruselt[2];
      message = "You Should Try Hard..\n" + "You Scored $marks";
    } else if (marks < 35) {
      image = imageRruselt[1];
      message = "You Can Do Better..\n" + "You Scored $marks";
    } else {
      image = imageRruselt[0];
      message = "You Did Very Well..\n" + "You Scored $marks";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reuselt'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 7,
              child: Material(
                child: Container(
                  child: Column(
                    children: [
                      Material(
                        child: Container(
                          child: ClipPath(
                            child: Image(
                              image: AssetImage(image),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(message),
                      )
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineButton(
                    child: Text('continue'),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                    },
                    borderSide:
                        BorderSide(width: 1, color: Colors.indigoAccent),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
