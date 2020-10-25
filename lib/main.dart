import 'package:flutter/material.dart';
import 'pages/splash  screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quize',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
