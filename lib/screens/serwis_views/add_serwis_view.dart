import 'package:flutter/material.dart';
import 'package:movierental/model/serwis/db_serwis.dart';
import 'package:movierental/model/serwis/serwis_model.dart';
import 'package:provider/provider.dart';

class AddSerwis extends StatefulWidget {
  @override
  _AddSerwisState createState() => _AddSerwisState();
}

class _AddSerwisState extends State<AddSerwis> {
  final DBSerwis getDB = DBSerwis();

  final FocusNode nameNode = FocusNode();
  final FocusNode dateNode = FocusNode();
  final FocusNode priceNode = FocusNode();
  final FocusNode descNode = FocusNode();

  // capture input from TextField
  var nameController = TextEditingController();
  var dateController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBSerwis>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dodaj nowy Serwis'),
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
                    labelText: 'Nazwa Serwisu',
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
                    FocusScope.of(context).requestFocus(dateNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać nazwę serwisu!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: dateNode,
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
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(priceNode);
                  },
                  validator: (val) => val.isEmpty
                      ? 'Musisz dodać datę wykonania serwisu!'
                      : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: priceNode,
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
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(descNode);
                  },
                  validator: (val) => val.isEmpty
                      ? 'Musisz dodać koszt wykonania serwisu!'
                      : null,
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
                      SerwisModel newSerwis = SerwisModel(
                          nameController.text,
                          dateController.text,
                          priceController.text ?? '',
                          descController.text ?? "");

                      getDB.addSerwis(newSerwis).then((i) {
                        nameController.clear();
                        dateController.clear();
                        priceController.clear();
                        descController.clear();
                        newSerwis = null;
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
