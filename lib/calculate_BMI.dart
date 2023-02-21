import 'dart:math';

class CalculateBMI{
  CalculateBMI(this.weight, this.height, this._bmi);


  final int weight;
  final int height;

  double _bmi ;

  String calculateBMI(){

    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){

    if(_bmi >= 25 ){
      return 'Overweight';
    }
    else if (_bmi > 18.5){
      return 'Normal';
    }
    return 'Underweight';
  }

  String getInterPretation(){

    if(_bmi >= 25 ){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }
    else if (_bmi > 18.5){
      return 'You have a normal body weight. Good Job';
    }
    return 'You have a lower than normal body weight. Eat a bit more.';
  }
}