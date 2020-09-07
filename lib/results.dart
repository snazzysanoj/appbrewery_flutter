import 'package:flutter/material.dart';
import 'const.dart';
import 'widgets.dart';
import 'bmi.dart';

class ResultsPage extends StatelessWidget {
  
  final int height,weight;

  ResultsPage({this.height,this.weight});

  @override
  Widget build(BuildContext context) {
    BMICalc calc = new BMICalc(height: height,weight: weight);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'YOUR BMI',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: CardWidget(
              color: activeCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    calc.getResult(),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    calc.getBMI().toString(),
                    style: largeTextStyle,
                  ),
                  Text(
                    calc.getInterpretation(),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              text: 'RE-CALCULATE',
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
