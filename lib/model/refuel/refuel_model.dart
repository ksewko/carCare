class RefuelModel {
  // class properties
  int _id;
  String _type;
  String _date;
  String _meter;
  String _filled;
  String _price;
  String _isFull;

  // Constructor
  RefuelModel(this._type, this._date, this._meter, this._filled, this._price, this._isFull);
  RefuelModel.withId(this._id, this._type, this._date, this._meter, this._filled, this._price, this._isFull);

  // getters
  int get id => _id;
  String get type => _type;
  String get date => _date;
  String get meter => _meter;
  String get filled => _filled;
  String get price =>  _price;
  String get isFull => _isFull;

  // setters
  set type(String newType) {
    if (newType.length <= 255) {
      _type = newType;
    }
  }

  set date(String newDate) {
    if (newDate.length <= 255) {
      _date = newDate;
    }
  }

  set meter(String newMeter) {
    if (newMeter.length <= 255) {
      _meter = newMeter;
    }
  }

  set filled(String newFilled) {
    if (newFilled.length <= 255) {
      _filled = newFilled;
    }
  }

  set price(String newPrice) {
    if (newPrice.length <= 255) {
      _price = newPrice;
    }
  }

  set isFull(String newIsFull) {
    if (newIsFull.length <= 255) {
      _isFull = newIsFull;
    }
  }

  Map<String, dynamic> toMap() {
    var refuelMap = Map<String, dynamic>();
    refuelMap['type'] = _type;
    refuelMap['date'] = _date;
    refuelMap['meter'] = _meter;
    refuelMap['filled'] = _filled;
    refuelMap['price'] = _price;
    refuelMap['isFull'] = _isFull;
    if (_id != null) {
      refuelMap['id'] = _id;
    }
    return refuelMap;
  }
}
