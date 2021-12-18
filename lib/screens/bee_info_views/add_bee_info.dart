import 'package:carcare/model/bee_info/bee_info_model.dart';
import 'package:carcare/model/bee_info/db_bee_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBeeInfo extends StatefulWidget {
  @override
  _AddBeeInfoState createState() => _AddBeeInfoState();
}

class _AddBeeInfoState extends State<AddBeeInfo> {
  final DBBeeInfo getDB = DBBeeInfo();

    String bgImage = 'bg_bee.png';
    Color mainColor = Colors.orange[700];
    Color subColor = Colors.yellow[200];
    Color secondSubColor = Colors.yellow[50];

  final FocusNode nameNode = FocusNode();
  final FocusNode hivesNumberNode = FocusNode();
  final FocusNode yearNode = FocusNode();
  final FocusNode beekeeperNode = FocusNode();
  final FocusNode beekeeperNumberNode = FocusNode();
  final FocusNode characterNode = FocusNode();
  final FocusNode districtNode = FocusNode();

  // capture input from TextField
  var nameController = TextEditingController();
  var hivesNumberController = TextEditingController();
  var yearController = TextEditingController();
  var beekeeperController = TextEditingController();
  var beekeeperNumberController = TextEditingController();
  var characterController = TextEditingController();
  var districtController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBBeeInfo>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: Text('Rejestr centralny pasieki'),
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
                    labelText: 'Nazwa',
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
                    FocusScope.of(context).requestFocus(hivesNumberNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać nazwę pasieki!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: hivesNumberNode,
                  controller: hivesNumberController,
                  decoration: InputDecoration(
                    labelText: 'Liczba uli',
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
                    FocusScope.of(context).requestFocus(yearNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać liczbę uli w pasiece!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: yearNode,
                  keyboardType: TextInputType.number,
                  controller: yearController,
                  decoration: InputDecoration(
                    labelText: 'Rok Powstania pasieki',
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
                    FocusScope.of(context).requestFocus(beekeeperNode);
                  },
                  validator: (val) => val.isEmpty
                      ? 'Musisz dodać rok powstania pasieki!'
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
                  focusNode: beekeeperNode,
                  controller: beekeeperController,
                  decoration: InputDecoration(
                    labelText: 'Nazwisko pszczelarza',
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
                    FocusScope.of(context).requestFocus(beekeeperNumberNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać nazwisko pszczelarza!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: beekeeperNumberNode,
                  controller: beekeeperNumberController,
                  decoration: InputDecoration(
                    labelText: 'Numer rejestracyjny pszczelarza',
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
                    FocusScope.of(context).requestFocus(characterNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać numer rejestracyjny pszczelarza!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: characterNode,
                  controller: characterController,
                  decoration: InputDecoration(
                    labelText: 'Charakter hodowli pszczół',
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
                    FocusScope.of(context).requestFocus(districtNode);
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
                  focusNode: districtNode,
                  controller: districtController,
                  decoration: InputDecoration(
                    labelText: 'Nazwa obrębu ewidencyjnego',
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
                  color: secondSubColor,
                  child: Text(
                    'Dodaj',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 20.0,
                    ),
                  ),
                  shape: StadiumBorder(),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      BeeInfoModel newBeeInfo = BeeInfoModel(
                          nameController.text,
                          int.parse(hivesNumberController.text),
                          int.parse(yearController.text),
                          beekeeperController.text,
                          int.parse(beekeeperNumberController.text),
                          characterController.text ?? '',
                          districtController.text ?? '');

                      getDB.addBeeInfo(newBeeInfo).then((i) {
                        nameController.clear();
                        hivesNumberController.clear();
                        yearController.clear();
                        beekeeperController.clear();
                        beekeeperNumberController.clear();
                        characterController.clear();
                        districtController.clear();
                        newBeeInfo = null;
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
