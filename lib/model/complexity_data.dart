
class ComplexityData{

  var _questionTitle;
  var _questionAnswer;

  ComplexityData(this._questionTitle, this._questionAnswer);

  @override
  String toString() {
    return '$_questionTitle,  $_questionAnswer';
  }

  get questionAnswer => _questionAnswer;

  get questionTitle => _questionTitle;

}