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
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nazwa Warsztatu',
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
                    FocusScope.of(context).requestFocus(addressNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać nazwę Warsztatu!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: addressNode,
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Adres Warsztatu',
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
                    FocusScope.of(context).requestFocus(descNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać adres Warsztatu!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: descNode,
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  controller: descController,
                  decoration: InputDecoration(
                    labelText: 'Opis',
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
                    FocusScope.of(context).requestFocus(phoneNumberNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: phoneNumberNode,
                  keyboardType: TextInputType.number,
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Numer telefonu',
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
                      val.isEmpty ? 'Musisz dodać numer telefonu!' : null,
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
