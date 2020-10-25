import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/custom_card.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'quize',
          style: TextStyle(fontFamily: 'Quando'),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          CostomCard(
            image: 'images/bad.png',
            title: 'bad',
          ),
          CostomCard(
            image: 'images/cpp.png',
            title: 'cpp',
          ),
          CostomCard(
            image: 'images/good.png',
            title: 'good',
          ),
          CostomCard(
            image: 'images/js.png',
            title: 'js',
          ),
          CostomCard(
            image: 'images/linux.png',
            title: 'linux',
          ),
        ],
      ),
    );
  }
}
