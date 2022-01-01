import 'dart:io';

import 'package:carcare/model/location/db_location_provider.dart';
import 'package:carcare/model/location/location_loc.dart';
import 'package:carcare/model/widgets/picture_widget.dart';
import 'package:carcare/model/widgets/loc_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLocation extends StatefulWidget {
  static const routeName = "/add-location";
  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  Color redColor = Colors.red[900];
  String bgImage = 'bg_bee.png';
  Color mainColor = Colors.orange[700];
  Color subColor = Colors.yellow[200];
  Color secondSubColor = Colors.yellow[50];

  final _titleController = TextEditingController();
  File _imagePicked;
  LocationLoc _locationPicked;

  void _selectImage(File imagePicked) {
    _imagePicked = imagePicked;
  }

  void _selectLocation(double latitude, double longitude) {
    _locationPicked = LocationLoc(latitude: latitude, longitude: longitude);
  }

// onPressed: () {
//                             showDialog(
//                                 context: context,
//                                 barrierDismissible: true,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     title: Text(
//                                       'Usuń Warsztat!',
//                                       textAlign: TextAlign.center,
//                                     ),
//                                     content: Text(
//                                       'Czy chcesz usunąć warsztat \n${nameController.text} z listy?',
//                                       textAlign: TextAlign.center,
//                                     ),
//                                     backgroundColor: Colors.red,
//                                     elevation: 8.0,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                     ),
//                                     actions: <Widget>[
//                                       OutlineButton(
//                                         borderSide:
//                                             BorderSide(color: Colors.black),
//                                         shape: StadiumBorder(),
//                                         child: Text(
//                                           'Tak',
//                                           style: TextStyle(
//                                               fontSize: 18.0,
//                                               letterSpacing: 1.0,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black),
//                                         ),
//                                         onPressed: () async {
//                                           await getDB
//                                               .deleteMechanics(mechanics.id);
//                                           Navigator.pop(context);
//                                           Navigator.pop(context);
//                                         },
//                                       ),
//                                     ],
//                                   );
//                                 });
//                           },

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _imagePicked == null ||
        _locationPicked == null) {
      showCupertinoDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Uwaga!',
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Musisz wpisać nazwę, dodać zdjęcie i wybrać lokalizację!',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          actions: <Widget>[
            OutlineButton(
              borderSide: BorderSide(color: Colors.black),
              shape: StadiumBorder(),
              child: Text(
                'Ok',
                style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
      return;
    }
    Provider.of<DBLocationProvider>(context, listen: false)
        .addNewPlace(_titleController.text, _imagePicked, _locationPicked);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text("Dodaj Lokalizację"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit
              .cover, //zasłoni cały background, -> umiejscowienie image w bgc
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        style: TextStyle(
                          color: subColor,
                          fontSize: 16.0,
                        ),
                        controller: _titleController,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          labelText: "Nazwa Lokalizacji",
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
                        height: 16,
                      ),
                      PictureWidget(onImageSaved: _selectImage),
                      SizedBox(height: 16),
                      LocWidget(_selectLocation),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: _savePlace,
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: subColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Dodaj",
                      style: TextStyle(
                          color: subColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: redColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
