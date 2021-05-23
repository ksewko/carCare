import 'dart:io';

import 'package:carcare/model/places/place_location.dart';
import 'package:carcare/model/places/place_provider.dart';
import 'package:carcare/model/places/widgets/image_input.dart';
import 'package:carcare/model/places/widgets/location_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-place";
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  Color redColor = Colors.red[900];
  String bgImage = 'bg.png';

  final _titleController = TextEditingController();
  File _imagePicked;
  PlaceLocation _locationPicked;

  void _selectImage(File imagePicked) {
    _imagePicked = imagePicked;
  }

  void _selectLocation(double latitude, double longitude) {
    _locationPicked = PlaceLocation(latitude: latitude, longitude: longitude);
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _imagePicked == null ||
        _locationPicked == null) {
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                title: Text("Uwaga"),
                content: Text(
                    "Musisz dodać nazwę, zdjęcie i zaznaczyć lokalizację zaparkowanego auta!"),
                actions: [
                  CupertinoButton(
                    child: Text("Ok"),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ));
      return;
    }
    Provider.of<PlaceProvider>(context, listen: false)
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
        title: Text("Dodaj Parking"),
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
                          labelText: "Nazwa Miejsca postojowego",
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
                      ImageInput(onImageSaved: _selectImage),
                      SizedBox(height: 16),
                      LocationInput(_selectLocation),
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
