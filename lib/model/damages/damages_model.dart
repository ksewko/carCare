class DamagesModel {
  // class properties
  int _id;
  String _name;
  String _date;
  String _place;
  String _isGuilty;
  String _insurance;
  String _desc;

  // Constructor
  DamagesModel(
      this._name, this._date, this._place, this._isGuilty, this._insurance,
      [this._desc]);
  DamagesModel.withId(this._id, this._name, this._date, this._place,
      this._isGuilty, this._insurance,
      [this._desc]);

  // getters
  int get id => _id;
  String get name => _name;
  String get date => _date;
  String get place => _place;
  String get isGuilty => _isGuilty;
  String get insurance => _insurance;
  String get desc => _desc;

  // setters
  set name(String newName) {
    if (newName.length <= 255) {
      _name = newName;
    }
  }

  set date(String newDate) {
    if (newDate.length <= 255) {
      _date = newDate;
    }
  }

  set place(String newPlace) {
    if (newPlace.length <= 255) {
      _place = newPlace;
    }
  }

  set isGuilty(String newIsGuilty) {
    if (newIsGuilty.length <= 255) {
      _isGuilty = newIsGuilty;
    }
  }

  set insurance(String newInsurance) {
    if (newInsurance.length <= 255) {
      _insurance = newInsurance;
    }
  }

  set desc(String newDesc) {
    if (newDesc.length <= 255) {
      _desc = newDesc;
    }
  }

  Map<String, dynamic> toMap() {
    var damagesMap = Map<String, dynamic>();
    damagesMap['name'] = _name;
    damagesMap['date'] = _date;
    damagesMap['place'] = _place;
    damagesMap['isGuilty'] = _isGuilty;
    damagesMap['insurance'] = _insurance;
    damagesMap['desc'] = _desc;
    if (_id != null) {
      damagesMap['id'] = _id;
    }
    return damagesMap;
  }
}
