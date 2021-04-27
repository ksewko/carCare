import 'package:flutter/material.dart';
import 'package:carcare/model/damages/damages_model.dart';
import 'package:carcare/model/damages/db_damages.dart';
import 'package:provider/provider.dart';

class AddDamages extends StatefulWidget {
  @override
  _AddDamagesState createState() => _AddDamagesState();
}

class _AddDamagesState extends State<AddDamages> {
  final DBDamages getDB = DBDamages();

  final FocusNode nameNode = FocusNode();
  final FocusNode dateNode = FocusNode();
  final FocusNode placeNode = FocusNode();
  final FocusNode isGuiltyNode = FocusNode();
  final FocusNode insuranceNode = FocusNode();
  final FocusNode descNode = FocusNode();

  // capture input from TextField
  var nameController = TextEditingController();
  var dateController = TextEditingController();
  var placeController = TextEditingController();
  var isGuiltyController = TextEditingController();
  var insuranceController = TextEditingController();
  var descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBDamages>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dodaj nową szkodę'),
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
                    labelText: 'Nazwa szkody',
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
                      val.isEmpty ? 'Musisz dodać nazwę szkody!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: dateNode,
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'Data zajścia szkody',
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
                    FocusScope.of(context).requestFocus(placeNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać datę zajścia szkody!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: placeNode,
                  controller: placeController,
                  decoration: InputDecoration(
                    labelText: 'Miejsce zajścia szkody',
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
                    FocusScope.of(context).requestFocus(isGuiltyNode);
                  },
                  validator: (val) => val.isEmpty
                      ? 'Musisz dodać miejsce zajścia szkody!'
                      : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: isGuiltyNode,
                  controller: isGuiltyController,
                  decoration: InputDecoration(
                    labelText: 'Czy byłeś sprawcą szkody? Tak/Nie',
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
                    FocusScope.of(context).requestFocus(insuranceNode);
                  },
                  validator: (val) => (!val.contains('Tak') &&
                          !val.contains('Nie'))
                      ? 'Musisz wskazać czy byłeś sprawcą, wpisz Tak lub Nie'
                      : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: insuranceNode,
                  controller: insuranceController,
                  decoration: InputDecoration(
                    labelText: 'Ubezpieczyciel sprawcy',
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
                      DamagesModel newDamages = DamagesModel(
                          nameController.text,
                          dateController.text,
                          placeController.text,
                          isGuiltyController.text,
                          insuranceController.text ?? '',
                          descController.text ?? "");

                      getDB.addDamages(newDamages).then((i) {
                        nameController.clear();
                        dateController.clear();
                        placeController.clear();
                        isGuiltyController.clear();
                        insuranceController.clear();
                        descController.clear();
                        newDamages = null;
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
