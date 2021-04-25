import 'package:flutter/material.dart';
import 'package:movierental/model/serwis/db_serwis.dart';
import 'package:movierental/model/serwis/serwis_model.dart';

class EditSerwis extends StatefulWidget {
  final SerwisModel serwis;
  EditSerwis(this.serwis);

  @override
  _EditSerwisState createState() => _EditSerwisState();
}

class _EditSerwisState extends State<EditSerwis> {
  final DBSerwis getDB = DBSerwis();

  // capture input from TextField
  var nameController = TextEditingController();
  var dateController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SerwisModel serwis = widget.serwis;
    // filled values to Form input field
    nameController.text = widget.serwis.name;
    dateController.text = widget.serwis.date;
    priceController.text = widget.serwis.price;
    descController.text = widget.serwis.description;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Serwis'),
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
                      labelText: 'Nazwa serwisu',
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
                        val.isEmpty ? 'Musisz dodać nazwę serwisu!' : null,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      labelText: 'Data serwisu',
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
                    validator: (val) => val.isEmpty
                        ? 'Musisz dodać datę wykonania serwisu!'
                        : null,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: priceController,
                    decoration: InputDecoration(
                      labelText: 'Koszt',
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
                    validator: (val) => val.isEmpty
                        ? 'Musisz dodać koszt wykonania serwisu!'
                        : null,
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
                            serwis.name = nameController.text;
                            serwis.date = dateController.text;
                            serwis.price = priceController.text;
                            serwis.description = descController.text ?? '';

                            getDB.updateSerwis(serwis);
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
                                    'Usuń Serwis!',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text(
                                    'Czy chcesz usunąć serwis ${serwis.name}?',
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
                                        await getDB.deleteSerwis(serwis.id);
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
