import 'package:flutter/material.dart';
import 'package:calculator/calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        backgroundColor: const Color(0xFFF7F7F7),
        primaryColor: const Color(0xFF292D36),
        focusColor: const Color(0xFFF37979),
        primaryColorLight: const Color(0xFF2AFBD5),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        canvasColor: const Color(0xFFF9F9F9),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF22252D),
        backgroundColor: const Color(0xFF272B33),
        primaryColor: const Color(0xFFFFFFFF),
        focusColor: const Color(0xFFF37979),
        primaryColorLight: const Color(0xFF2AFBD5),
        canvasColor: const Color(0xFF292D36),
      ),
      home: const CalculatorScreen(),
    );
  }
}
