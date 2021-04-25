
// class RefuelModel {
// //moduł opony
//   int _id;
//   String _rims; // rodzaj felg
//   String _tireSize; //rozmiar opon
//   String _frontPressure; //ciśnienie w przedniej osi
//   String _backPressure; // ciśnienie w tylnej osi
//   String _isSummer; //true- jeśli opony letnie false -jeśli opony zimowe

//   // Constructor
//   TiresModel(this._rims, this._tireSize, this._frontPressure,
//       this._backPressure, this._isSummer);
//   TiresModel.withId(this._id, this._rims, this._tireSize, this._frontPressure,
//       this._backPressure, this._isSummer);

//   // getters
//   int get id => _id;
//   String get rims => _rims;
//   String get tireSize => _tireSize;
//   String get frontPressure => _frontPressure;
//   String get backPressure => _backPressure;
//   String get isSummer => _isSummer;

//   // setters
//   set rims(String newRims) {
//     if (newRims.length <= 255) {
//       _rims = newRims;
//     }
//   }

//   set tireSize(String newTireSize) {
//     if (newTireSize.length <= 255) {
//       _tireSize = newTireSize;
//     }
//   }

//   set frontPressure(String newFrontPressure) {
//     if (newFrontPressure.length <= 255) {
//       _frontPressure = newFrontPressure;
//     }
//   }

//   set backPressure(String newBackPressure) {
//     if (newBackPressure.length <= 255) {
//       _backPressure = newBackPressure;
//     }
//   }

//   set isSummer(String newIsSummer) => _isSummer = newIsSummer;

//   Map<String, dynamic> toMap() {
//     var tiresMap = Map<String, dynamic>();
//     tiresMap['rims'] = _rims;
//     tiresMap['tireSize'] = _tireSize;
//     tiresMap['frontPressure'] = _frontPressure;
//     tiresMap['backPressure'] = _backPressure;
//     tiresMap['isSummer'] = _isSummer;
//     if (_id != null) {
//       tiresMap['id'] = _id;
//     }
//     return tiresMap;
//   }
// }
