import 'package:flutter/material.dart';
import 'package:quiz/pages/quiz%20screen/quiz_screen.dart';

class CostomCard extends StatelessWidget {
  const CostomCard({
    Key key,
    this.image,
    this.title,
  }) : super(key: key);
  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => QuizScreen(),
              ));
        },
        child: Material(
          color: Colors.indigo,
          elevation: 5,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipOval(
                    child: Image.asset(
                      image,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
