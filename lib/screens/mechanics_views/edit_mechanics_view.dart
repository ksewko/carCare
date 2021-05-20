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
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  Color redColor = Colors.red[900];
  String bgImage = 'bg.png';
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
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(widget.mechanics.name),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit
              .cover, //zasłoni cały background, -> umiejscowienie image w bgc
        )),
        child: SafeArea(
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
                      style: TextStyle(
                        color: subColor,
                        fontSize: 16.0,
                      ),
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
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: subColor,
                        fontSize: 16.0,
                      ),
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
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: redColor,
                          child: Text(
                            'Zapisz',
                            style: TextStyle(
                              color: subColor,
                              fontSize: 20.0,
                            ),
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
                          color: redColor,
                          child: Text(
                            'Usuń',
                            style: TextStyle(
                              color: subColor,
                              fontSize: 20.0,
                            ),
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
                                            BorderSide(color: Colors.black),
                                        shape: StadiumBorder(),
                                        child: Text(
                                          'Tak',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
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
      ),
    );
  }
}
