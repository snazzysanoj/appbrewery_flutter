import 'dart:math';

class BMICalc {
  double height;
  double weight;

  double _bmi;

  BMICalc({int height, int weight}) {
    this.height = height.toDouble();
    this.weight = weight.toDouble();
    _bmi = weight / pow(height / 100, 2);
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi < 25) {
      return 'Normal';
    } else {
      return 'Obese';
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return 'Eat more !!';
    } else if (_bmi < 25) {
      return 'Perfect Shape';
    } else {
      return 'Workout more !!';
    }
  }
}
