import 'package:flutter/material.dart';
import 'package:carcare/model/mechanics/db_mechanics.dart';
import 'package:carcare/model/mechanics/mechanics_model.dart';

class EditMechanics extends StatefulWidget {
  final MechanicsModel mechanics;
  EditMechanics(this.mechanics);

  @override
  _EditMechanicsState createState() => _EditMechanicsState();
}

class _EditMechanicsState extends State<EditMechanics> {
  final DBMechanics getDB = DBMechanics();

  // capture input from TextField
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var descController = TextEditingController();
  var phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MechanicsModel mechanics = widget.mechanics;
    // filled values to Form input field
    nameController.text = widget.mechanics.name;
    addressController.text = widget.mechanics.address;
    descController.text = widget.mechanics.description;
    phoneNumberController.text = widget.mechanics.phoneNumber.toString();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.mechanics.name),
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
                    validator: (val) =>
                        val.isEmpty ? 'Musisz dodać nazwę Warsztatu!' : null,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
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
                    validator: (val) =>
                        val.isEmpty ? 'Musisz dodać adres Warsztatu!' : null,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
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
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
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
                    height: 30.0,
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
                            mechanics.name = nameController.text;
                            mechanics.address = addressController.text;
                            mechanics.description = descController.text ?? '';
                            mechanics.phoneNumber =
                                int.parse(phoneNumberController.text);

                            getDB.updateMechanics(mechanics);
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
                                    'Usuń Warsztat!',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text(
                                    'Czy chcesz usunąć warsztat \n${nameController.text} z listy?',
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
                                        await getDB
                                            .deleteMechanics(mechanics.id);
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
