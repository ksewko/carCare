class MechanicsModel {
  // class properties
  int _id;
  String _name;
  String _address;
  String _desc;
  int _phoneNumber;

  // Constructor
  MechanicsModel(this._name, this._address, this._phoneNumber, [this._desc]);
  MechanicsModel.withId(this._id, this._name, this._address, this._phoneNumber,
      [this._desc]);

  // getters
  int get id => _id;
  String get name => _name;
  String get address => _address;
  String get description => _desc;
  int get phoneNumber => _phoneNumber;

  // setters
  set name(String newName) {
    if (newName.length <= 255) {
      _name = newName;
    }
  }

  set address(String newAddress) {
    if (newAddress.length <= 255) {
      _address = newAddress;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _desc = newDescription;
    }
  }

  set phoneNumber(int newPhoneNumber) => _phoneNumber = newPhoneNumber;

  Map<String, dynamic> toMap() {
    var mechanicsMap = Map<String, dynamic>();
    mechanicsMap['name'] = _name;
    mechanicsMap['description'] = _desc;
    mechanicsMap['address'] = _address;
    mechanicsMap['phoneNumber'] = _phoneNumber;
    if (_id != null) {
      mechanicsMap['id'] = _id;
    }
    return mechanicsMap;
  }
}
