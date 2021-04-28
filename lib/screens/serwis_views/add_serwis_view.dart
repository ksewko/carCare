import 'package:flutter/material.dart';
import 'package:carcare/model/serwis/db_serwis.dart';
import 'package:carcare/model/serwis/serwis_model.dart';
import 'package:provider/provider.dart';

class AddSerwis extends StatefulWidget {
  @override
  _AddSerwisState createState() => _AddSerwisState();
}

class _AddSerwisState extends State<AddSerwis> {
  final DBSerwis getDB = DBSerwis();
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  String bgImage = 'bg.png';

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
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('Dodaj nowy Serwis'),
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
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nazwa Serwisu',
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
                    FocusScope.of(context).requestFocus(dateNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać nazwę serwisu!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: dateNode,
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'Data serwisu',
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
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: priceNode,
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'Koszt',
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
                  validator: (val) => val.isEmpty
                      ? 'Musisz dodać koszt wykonania serwisu!'
                      : null,
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
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.red[900],
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
