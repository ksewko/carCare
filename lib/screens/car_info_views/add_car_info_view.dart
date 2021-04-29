import 'package:flutter/material.dart';
import 'package:carcare/model/car_info/car_info_model.dart';
import 'package:carcare/model/car_info/db_car_info.dart';
import 'package:provider/provider.dart';

class AddCarInfo extends StatefulWidget {
  @override
  _AddCarInfoState createState() => _AddCarInfoState();
}

class _AddCarInfoState extends State<AddCarInfo> {
  final DBCarInfo getDB = DBCarInfo();

  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  Color redColor = Colors.red[900];
  String bgImage = 'bg.png';

  final FocusNode brandNode = FocusNode();
  final FocusNode modelNode = FocusNode();
  final FocusNode yearNode = FocusNode();
  final FocusNode registrationNode = FocusNode();
  final FocusNode engineCapacityNode = FocusNode();
  final FocusNode policyNumberNode = FocusNode();

  // capture input from TextField
  var brandController = TextEditingController();
  var modelController = TextEditingController();
  var yearController = TextEditingController();
  var registrationController = TextEditingController();
  var engineCapacityController = TextEditingController();
  var policyNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBCarInfo>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: Text('Dodaj nowy Pojazd'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit
                .cover, //zasłoni cały background, -> umiejscowienie image w bgc
          )),
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  controller: brandController,
                  decoration: InputDecoration(
                    labelText: 'Marka',
                    labelStyle: TextStyle(color: subColor),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(modelNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać markę pojazdu!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: modelNode,
                  controller: modelController,
                  decoration: InputDecoration(
                    labelText: 'Model',
                    labelStyle: TextStyle(color: subColor),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(yearNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać model pojazdu!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: yearNode,
                  keyboardType: TextInputType.number,
                  controller: yearController,
                  decoration: InputDecoration(
                    labelText: 'Rok Produkcji',
                    labelStyle: TextStyle(color: subColor),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(registrationNode);
                  },
                  validator: (val) => val.isEmpty
                      ? 'Musisz dodać rok produkcji pojazdu!'
                      : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: registrationNode,
                  controller: registrationController,
                  decoration: InputDecoration(
                    labelText: 'Numer rejestracyjny',
                    labelStyle: TextStyle(color: subColor),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(engineCapacityNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać numer rejestracyjny!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: engineCapacityNode,
                  controller: engineCapacityController,
                  decoration: InputDecoration(
                    labelText: 'Pojemność silnika',
                    labelStyle: TextStyle(color: subColor),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(policyNumberNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: policyNumberNode,
                  keyboardType: TextInputType.number,
                  controller: policyNumberController,
                  decoration: InputDecoration(
                    labelText: 'Numer Polisy',
                    labelStyle: TextStyle(color: subColor),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: subColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: redColor,
                  child: Text(
                    'Dodaj',
                    style: TextStyle(
                      color: subColor,
                      fontSize: 20.0,
                    ),
                  ),
                  shape: StadiumBorder(),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      CarInfoModel newCarInfo = CarInfoModel(
                          brandController.text,
                          modelController.text,
                          int.parse(yearController.text),
                          registrationController.text,
                          engineCapacityController.text ?? '',
                          int.parse(policyNumberController.text) ?? '');

                      getDB.addCarInfo(newCarInfo).then((i) {
                        brandController.clear();
                        modelController.clear();
                        yearController.clear();
                        registrationController.clear();
                        engineCapacityController.clear();
                        policyNumberController.clear();
                        newCarInfo = null;
                      });
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
