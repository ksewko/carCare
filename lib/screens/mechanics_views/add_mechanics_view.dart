import 'package:flutter/material.dart';
import 'package:carcare/model/mechanics/db_mechanics.dart';
import 'package:carcare/model/mechanics/mechanics_model.dart';
import 'package:provider/provider.dart';

class AddMechanics extends StatefulWidget {
  @override
  _AddMechanicsState createState() => _AddMechanicsState();
}

class _AddMechanicsState extends State<AddMechanics> {
  final DBMechanics getDB = DBMechanics();

  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  Color redColor = Colors.red[900];
  String bgImage = 'bg.png';

  final FocusNode nameNode = FocusNode();
  final FocusNode addressNode = FocusNode();
  final FocusNode descNode = FocusNode();
  final FocusNode phoneNumberNode = FocusNode();

  // capture input from TextField
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var descController = TextEditingController();
  var phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBMechanics>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('Dodaj nowy Warsztat'),
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
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nazwa Warsztatu',
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
                    FocusScope.of(context).requestFocus(addressNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać nazwę Warsztatu!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: addressNode,
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Adres Warsztatu',
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
                    FocusScope.of(context).requestFocus(descNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać adres Warsztatu!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: descNode,
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  controller: descController,
                  decoration: InputDecoration(
                    labelText: 'Opis',
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
                    FocusScope.of(context).requestFocus(phoneNumberNode);
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
                  focusNode: phoneNumberNode,
                  keyboardType: TextInputType.number,
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Numer telefonu',
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
                      val.isEmpty ? 'Musisz dodać numer telefonu!' : null,
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
                      MechanicsModel newMechanics = MechanicsModel(
                          nameController.text,
                          addressController.text,
                          int.parse(phoneNumberController.text),
                          descController.text ?? "");

                      getDB.addMechanics(newMechanics).then((i) {
                        nameController.clear();
                        addressController.clear();
                        phoneNumberController.clear();
                        descController.clear();
                        newMechanics = null;
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
