class SerwisModel {
  // class properties
  int _id;
  String _name;
  String _date;
  String _price;
  String _desc;

  // Constructor
  SerwisModel(this._name, this._date, this._price, [this._desc]);
  SerwisModel.withId(this._id, this._name, this._date, this._price,
      [this._desc]);

  // getters
  int get id => _id;
  String get name => _name;
  String get date => _date;
  String get price => _price;
  String get description => _desc;

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

  set price(String newPrice) {
    if (newPrice.length <= 255) {
      _date = newPrice;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _desc = newDescription;
    }
  }

  Map<String, dynamic> toMap() {
    var serwisMap = Map<String, dynamic>();
    serwisMap['name'] = _name;
    serwisMap['date'] = _date;
    serwisMap['price'] = _price;
    serwisMap['description'] = _desc;
    if (_id != null) {
      serwisMap['id'] = _id;
    }
    return serwisMap;
  }
}
