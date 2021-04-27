import 'package:flutter/material.dart';
import 'package:carcare/model/damages/damages_model.dart';
import 'package:carcare/model/damages/db_damages.dart';

class EditDamages extends StatefulWidget {
  final DamagesModel damages;
  EditDamages(this.damages);

  @override
  _EditDamagesState createState() => _EditDamagesState();
}

class _EditDamagesState extends State<EditDamages> {
  final DBDamages getDB = DBDamages();

  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  String bgImage = 'bg.png';

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
    DamagesModel damages = widget.damages;
    // filled values to Form input field
    nameController.text = widget.damages.name;
    dateController.text = widget.damages.date;
    placeController.text = widget.damages.place;
    isGuiltyController.text = widget.damages.isGuilty;
    insuranceController.text = widget.damages.insurance;
    descController.text = widget.damages.desc;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(widget.damages.name),
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
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Nazwa szkody',
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
                          val.isEmpty ? 'Musisz dodać nazwę szkody!' : null,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        labelText: 'Data zajścia szkody',
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
                          ? 'Musisz dodać datę zajścia szkody!'
                          : null,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: placeController,
                      decoration: InputDecoration(
                        labelText: 'Miejsce zajścia szkody',
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
                          ? 'Musisz dodać miejsce zajścia szkody!'
                          : null,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: isGuiltyController,
                      decoration: InputDecoration(
                        labelText: 'Czy byłeś sprawcą szkody? Tak/Nie',
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
                      validator: (val) => (!val.contains('Tak') &&
                              !val.contains('Nie'))
                          ? 'Musisz wskazać czy byłeś sprawcą, wpisz Tak lub Nie'
                          : null,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: insuranceController,
                      decoration: InputDecoration(
                        labelText: 'Ubezpieczenie sprawcy',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.red[900],
                          child: Text(
                            'Edytuj',
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: StadiumBorder(),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              damages.name = nameController.text;
                              damages.date = dateController.text;
                              damages.place = placeController.text;
                              damages.isGuilty = isGuiltyController.text;
                              damages.insurance =
                                  insuranceController.text ?? '';
                              damages.desc = descController.text ?? '';

                              getDB.updateDamages(damages);
                              Navigator.pop(context);
                            }
                          },
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        RaisedButton(
                          color: Colors.red[900],
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
                                      'Usuń Szkodę!',
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Text(
                                      'Czy chcesz usunąć szkodę \n${nameController.text} z listy?',
                                      textAlign: TextAlign.center,
                                    ),
                                    backgroundColor: Colors.red,
                                    elevation: 8.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    actions: <Widget>[
                                      OutlineButton(
                                        borderSide: BorderSide(color: subColor),
                                        shape: StadiumBorder(),
                                        child: Text(
                                          'Tak',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () async {
                                          await getDB.deleteDamages(damages.id);
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
