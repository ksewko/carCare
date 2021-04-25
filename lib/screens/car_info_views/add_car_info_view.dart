import 'package:flutter/material.dart';
import 'package:movierental/model/car/car_info_model.dart';
import 'package:movierental/model/car/db_car_info.dart';
import 'package:provider/provider.dart';

class AddCarInfo extends StatefulWidget {
  @override
  _AddCarInfoState createState() => _AddCarInfoState();
}

class _AddCarInfoState extends State<AddCarInfo> {
  final DBCarInfo getDB = DBCarInfo();

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
        title: Text('Dodaj nowy Pojazd'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  controller: brandController,
                  decoration: InputDecoration(
                    labelText: 'Model',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
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
                  focusNode: modelNode,
                  controller: modelController,
                  decoration: InputDecoration(
                    labelText: 'Model',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
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
                  focusNode: yearNode,
                  keyboardType: TextInputType.number,
                  controller: yearController,
                  decoration: InputDecoration(
                    labelText: 'Rok Produkcji',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
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
                  focusNode: registrationNode,
                  controller: registrationController,
                  decoration: InputDecoration(
                    labelText: 'Numer rejestracyjny',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
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
                  focusNode: engineCapacityNode,
                  controller: engineCapacityController,
                  decoration: InputDecoration(
                    labelText: 'Pojemność silnika',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
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
                  focusNode: policyNumberNode,
                  keyboardType: TextInputType.number,
                  controller: policyNumberController,
                  decoration: InputDecoration(
                    labelText: 'Numer Polisy',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
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
                  color: Colors.blue,
                  child: Text(
                    'Dodaj',
                    style: TextStyle(color: Colors.white),
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
