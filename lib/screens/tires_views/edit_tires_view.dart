import 'package:flutter/material.dart';
import 'package:movierental/model/tires/db_tires.dart';
import 'package:movierental/model/tires/tires_model.dart';
import 'package:form_validators/form_validators.dart';

class EditTires extends StatefulWidget {
  final TiresModel tires;
  EditTires(this.tires);

  @override
  _EditTiresState createState() => _EditTiresState();
}

class _EditTiresState extends State<EditTires> {
  final DBTires getDB = DBTires();

  // capture input from TextField
  var rimsController = TextEditingController();
  var tireSizeController = TextEditingController();
  var frontPressureController = TextEditingController();
  var backPressureController = TextEditingController();
  var isSummerController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TiresModel tires = widget.tires;
    // filled values to Form input field
    rimsController.text = widget.tires.rims;
    tireSizeController.text = widget.tires.tireSize;
    frontPressureController.text = widget.tires.frontPressure;
    backPressureController.text = widget.tires.backPressure;
    isSummerController.text = widget.tires.isSummer;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Opony ${tires.isSummer}'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: rimsController,
                    decoration: InputDecoration(
                      labelText: 'Felgi',
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
                    validator: (val) =>
                        val.isEmpty ? 'Musisz dodać felgi!' : null,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: tireSizeController,
                    decoration: InputDecoration(
                      labelText: 'Rozmiar opon',
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
                    validator: (val) =>
                        val.isEmpty ? 'Musisz dodać rozmiar opon!' : null,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: frontPressureController,
                    decoration: InputDecoration(
                      labelText: 'Ciśnienie w przedniej osi',
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
                  TextFormField(
                    controller: backPressureController,
                    decoration: InputDecoration(
                      labelText: 'Ciśnienie w tylnej osi',
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
                  // dodać przełącznik na zimowe i letnie
                  TextFormField(
                    controller: isSummerController,
                    decoration: InputDecoration(
                      labelText: 'Letnie/Zimowe',
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
                    validator: (val) =>
                        (!val.contains('Zimowe') && !val.contains('Letnie'))
                            ? 'Musisz wpisać słowo Letnie lub Zimowe'
                            : null,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'Edytuj',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: StadiumBorder(),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            tires.rims = rimsController.text;
                            tires.tireSize = tireSizeController.text;
                            tires.frontPressure =
                                frontPressureController.text ?? '';
                            tires.frontPressure =
                                backPressureController.text ?? '';

                            getDB.updateTires(tires);
                            Navigator.pop(context);
                          }
                        },
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      RaisedButton(
                        color: Colors.red,
                        child: Text(
                          'Usuń',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: StadiumBorder(),
                        onPressed: () {
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'Usuń Opony!',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text(
                                    'Czy chcesz usunąć opony z listy?',
                                    textAlign: TextAlign.center,
                                  ),
                                  backgroundColor: Colors.red,
                                  elevation: 8.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  actions: <Widget>[
                                    OutlineButton(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      shape: StadiumBorder(),
                                      child: Text(
                                        'Tak',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () async {
                                        await getDB.deleteTires(tires.id);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
