import 'package:flutter/material.dart';
import 'package:carcare/model/refuel/db_refuel.dart';
import 'package:carcare/model/refuel/refuel_model.dart';
import 'package:provider/provider.dart';

class AddRefuel extends StatefulWidget {
  @override
  _AddRefuelState createState() => _AddRefuelState();
}

class _AddRefuelState extends State<AddRefuel> {
  final DBRefuel getDB = DBRefuel();
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  Color redColor = Colors.red[900];
  String bgImage = 'bg.png';

  final FocusNode typeNode = FocusNode();
  final FocusNode dateNode = FocusNode();
  final FocusNode meterNode = FocusNode();
  final FocusNode filledNode = FocusNode();
  final FocusNode priceNode = FocusNode();
  final FocusNode isFullNode = FocusNode();

  // capture input from TextField
  var typeController = TextEditingController();
  var dateController = TextEditingController();
  var meterController = TextEditingController();
  var filledController = TextEditingController();
  var priceController = TextEditingController();
  var isFullController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBRefuel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('Dodaj tankowanie'),
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
                  controller: typeController,
                  decoration: InputDecoration(
                    labelText: 'Rodzaj paliwa',
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
                      val.isEmpty ? 'Musisz dodać rodzaj paliwa!' : null,
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
                    labelText: 'Data tankowania',
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
                    FocusScope.of(context).requestFocus(meterNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać datę tankowania!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: meterNode,
                  controller: meterController,
                  decoration: InputDecoration(
                    labelText: 'Stan licznika',
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
                    FocusScope.of(context).requestFocus(filledNode);
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
                  focusNode: filledNode,
                  controller: filledController,
                  decoration: InputDecoration(
                    labelText: 'Ilość zatankowanego paliwa',
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
                      ? 'Musisz dodać ile litrów paliwa zatankowano!'
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
                    labelText: 'Cena za litr paliwa',
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
                    FocusScope.of(context).requestFocus(isFullNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Musisz dodać cenę za litr!' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                  focusNode: isFullNode,
                  controller: isFullController,
                  decoration: InputDecoration(
                    labelText: 'Czy zatankowano do pełna? Tak/Nie',
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
                      (!val.contains('Tak') && !val.contains('Nie'))
                          ? 'Musisz wpisać Tak lub Nie!'
                          : null,
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
                      RefuelModel newRefuel = RefuelModel(
                        typeController.text,
                        dateController.text,
                        meterController.text,
                        filledController.text,
                        priceController.text,
                        isFullController.text ?? '',
                      );

                      getDB.addRefuel(newRefuel).then((i) {
                        typeController.clear();
                        dateController.clear();
                        meterController.clear();
                        filledController.clear();
                        priceController.clear();
                        isFullController.clear();
                        newRefuel = null;
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
