class ComplexityData {
  ///This class is created to declare the parameters needed to appropriately create a complexity data.
  var _characteristic;
  var _value;

  ComplexityData(this._characteristic, this._value);

  @override
  String toString() {
    ///converts the values of complexity data to strings
    return '$_characteristic,  $_value';
  }

  get value => _value;

  ///needed later for presentation as feedback (used in the feedback class)

  get characteristic => _characteristic;

  ///needed later for presentation as feedback (used in the feedback class)
}
