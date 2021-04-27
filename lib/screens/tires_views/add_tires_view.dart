import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:carcare/model/tires/db_tires.dart';
import 'package:carcare/model/tires/tires_model.dart';
import 'package:provider/provider.dart';

class AddTires extends StatefulWidget {
  @override
  _AddTiresState createState() => _AddTiresState();
}

class _AddTiresState extends State<AddTires> {
  final DBTires getDB = DBTires();
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  String bgImage = 'bg.png';

  final FocusNode rimsNode = FocusNode();
  final FocusNode tireSizeNode = FocusNode();
  final FocusNode frontPressureNode = FocusNode();
  final FocusNode backPressureNode = FocusNode();
  final FocusNode isSummerNode = FocusNode();

  // capture input from TextField
  var rimsController = TextEditingController();
  var tireSizeController = TextEditingController();
  var frontPressureController = TextEditingController();
  var backPressureController = TextEditingController();
  var isSummerController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBTires>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('Dodaj nowe opony'),
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
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  controller: rimsController,
                  decoration: InputDecoration(
                    labelText: 'Felgi',
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
                    FocusScope.of(context).requestFocus(tireSizeNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać felgi!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: tireSizeNode,
                  controller: tireSizeController,
                  decoration: InputDecoration(
                    labelText: 'Rozmiar opon',
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
                    FocusScope.of(context).requestFocus(frontPressureNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać rozmiar opon!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: frontPressureNode,
                  controller: frontPressureController,
                  decoration: InputDecoration(
                    labelText: 'Ciśnienie w przedniej osi',
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
                    FocusScope.of(context).requestFocus(backPressureNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: backPressureNode,
                  controller: backPressureController,
                  decoration: InputDecoration(
                    labelText: 'Ciśnienie w tylnej osi',
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
                    FocusScope.of(context).requestFocus(isSummerNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: isSummerNode,
                  controller: isSummerController,
                  decoration: InputDecoration(
                    labelText: 'Letnie/Zimowe',
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
                  validator: (val) =>
                      (!val.contains('Zimowe') && !val.contains('Letnie'))
                          ? 'Musisz wpisać słowo Letnie lub Zimowe'
                          : null,
                ),
                RaisedButton(
                  color: Colors.red[900],
                  child: Text(
                    'Dodaj',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: StadiumBorder(),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      TiresModel newTires = TiresModel(
                          rimsController.text,
                          tireSizeController.text,
                          frontPressureController.text ?? '',
                          backPressureController.text ?? '',
                          isSummerController.text);

                      getDB.addTires(newTires).then((i) {
                        rimsController.clear();
                        tireSizeController.clear();
                        frontPressureController.clear();
                        backPressureController.clear();
                        isSummerController.clear();
                        newTires = null;
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
