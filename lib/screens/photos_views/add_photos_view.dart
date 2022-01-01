import 'dart:io';

import 'package:carcare/model/widgets/picture_widget.dart';
import 'package:carcare/model/photos/db_photos_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPhotos extends StatefulWidget {
  static const routeName = "/add-photos";
  @override
  _AddPhotosState createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  Color redColor = Colors.red[900];
 String bgImage = 'bg_bee.png';
    Color mainColor = Colors.orange[700];
    Color subColor = Colors.yellow[200];
    Color secondSubColor = Colors.yellow[50];

  File _imagePicked;

  void _selectImage(File imagePicked) {
    _imagePicked = imagePicked;
  }

  void _savePlace() {
    if (_imagePicked == null) {
      showCupertinoDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Uwaga!',
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Musisz dodać zdjęcie!',
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
    Provider.of<DBPhotosProvider>(context, listen: false)
        .addNewPhoto(_imagePicked);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text("Dodaj Zdjęcie"),
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
                      PictureWidget(onImageSaved: _selectImage),
                      SizedBox(height: 16),
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
