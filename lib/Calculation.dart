import 'dart:math';

class Calculation {
  Calculation({
    required this.kWeight,
    required this.kHeight,
  });

  final int kWeight;
  final int kHeight;
  double? _bmi;

  String calculateBMI() {
    _bmi = kWeight / pow(kHeight / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String result() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String interpretation() {
    if (_bmi! >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi! >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
