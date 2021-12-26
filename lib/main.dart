import './widgets/bmi_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMi Calculator',
      home: const MyApp(),
      theme: ThemeData(
        textTheme: const TextTheme().copyWith(
          bodyText2: const TextStyle(color: Colors.white),
          bodyText1: const TextStyle(color: Colors.black),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF12153B),
          centerTitle: true,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF282C4F),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        backgroundColor: Color(0xFF101336),
        body: BmiCalculator());
  }
}
