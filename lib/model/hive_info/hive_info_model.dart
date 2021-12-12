class HiveInfoModel {
  // moduł informacje:
  int _id;
  String _brand;
  String _model;
  int _year;
  String _registration;
  String _vin;
  String _engineCapacity;
  int _policyNumber;

  // Constructor
  HiveInfoModel(this._brand, this._model, this._year, this._registration,
      this._vin, this._engineCapacity, this._policyNumber);
  HiveInfoModel.withId(this._id, this._brand, this._model, this._year,
      this._registration, this._vin, this._engineCapacity, this._policyNumber);

  // getters
  int get id => _id;
  String get brand => _brand;
  String get model => _model;
  int get year => _year;
  String get registration => _registration;
  String get vin => _vin;
  String get engineCapacity => _engineCapacity;
  int get policyNumber => _policyNumber;

  // setters
  set brand(String newBrand) {
    if (newBrand.length <= 255) {
      _brand = newBrand;
    }
  }

  set model(String newModel) {
    if (newModel.length <= 255) {
      _model = newModel;
    }
  }

  set year(int newYear) => _year = newYear;

  set registration(String newRegistration) {
    if (newRegistration.length <= 255) {
      _registration = newRegistration;
    }
  }

  set vin(String newVin) {
    if (newVin.length <= 255) {
      _registration = newVin;
    }
  }

  set engineCapacity(String newEngineCapacity) {
    if (newEngineCapacity.length <= 255) {
      _engineCapacity = newEngineCapacity;
    }
  }

  set policyNumber(int newPolicyNumber) => _policyNumber = newPolicyNumber;

  Map<String, dynamic> toMap() {
    var carInfoMap = Map<String, dynamic>();
    carInfoMap['brand'] = _brand;
    carInfoMap['model'] = _model;
    carInfoMap['year'] = _year;
    carInfoMap['registration'] = _registration;
    carInfoMap['vin'] = _vin;
    carInfoMap['engineCapacity'] = _engineCapacity;
    carInfoMap['policyNumber'] = _policyNumber;
    if (_id != null) {
      carInfoMap['id'] = _id;
    }
    return carInfoMap;
  }
}
