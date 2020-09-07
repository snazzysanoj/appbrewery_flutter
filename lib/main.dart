import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0D0E1D),
        accentColor: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF0D0E1D),
      ),
      home: InputPage(),
    );
  }
}
