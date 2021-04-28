import 'package:flutter/material.dart';
import 'package:carcare/model/refuel/db_refuel.dart';
import 'package:carcare/model/refuel/refuel_model.dart';

class EditRefuel extends StatefulWidget {
  final RefuelModel refuel;
  EditRefuel(this.refuel);

  @override
  _EditRefuelState createState() => _EditRefuelState();
}

class _EditRefuelState extends State<EditRefuel> {
  final DBRefuel getDB = DBRefuel();
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  String bgImage = 'bg.png';

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
    RefuelModel refuel = widget.refuel;
    // filled values to Form input field
    typeController.text = widget.refuel.type;
    dateController.text = widget.refuel.date;
    meterController.text = widget.refuel.meter;
    filledController.text = widget.refuel.filled;
    priceController.text = widget.refuel.price;
    isFullController.text = widget.refuel.isFull;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(widget.refuel.type),
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
                      validator: (val) =>
                          val.isEmpty ? 'Musisz dodać stan licznika!' : null,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: subColor,
                        fontSize: 16.0,
                      ),
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
                      validator: (val) => val.isEmpty
                          ? 'Musisz dodać ile litrow zatankowano!'
                          : null,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: subColor,
                        fontSize: 16.0,
                      ),
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
                      validator: (val) => val.isEmpty
                          ? 'Musisz dodać cenę za litr paliwa!'
                          : null,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: subColor,
                        fontSize: 16.0,
                      ),
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
                              ? 'Musisz wpisać słowo Tak lub Nie'
                              : null,
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
                            style: TextStyle(
                              color: subColor,
                              fontSize: 20.0,
                            ),
                          ),
                          shape: StadiumBorder(),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              refuel.type = typeController.text;
                              refuel.date = dateController.text;
                              refuel.meter = meterController.text;
                              refuel.filled = filledController.text;
                              refuel.price = priceController.text;
                              refuel.isFull = isFullController.text;

                              getDB.updateRefuel(refuel);
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
                                      'Usuń Tankowanie!',
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Text(
                                      'Czy chcesz usunąć tankowanie z listy?',
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
                                          await getDB.deleteRefuel(refuel.id);
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
