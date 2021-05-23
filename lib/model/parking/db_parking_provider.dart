import 'dart:io';

import 'package:carcare/model/parking/db_parking_model.dart';
import 'package:carcare/model/parking/location_helper.dart';
import 'package:carcare/model/parking/parking_model.dart';
import 'package:carcare/model/parking/parking_loc.dart';
import 'package:flutter/material.dart';

class DBParkingProvider with ChangeNotifier {
  List<ParkingModel> _parkings = [];

  List<ParkingModel> get parkings => [..._parkings];

  ParkingModel findById(String id) {
    return _parkings.firstWhere((parking) => parking.id == id);
  }

  ParkingModel findByTitle(String title) {
    return _parkings.firstWhere((parking) => parking.title == title);
  }

  Future addNewPlace(String title, File image, ParkingLoc location) async {
    final String locationName = await LocationHelper.getLocationName(
        location.latitude, location.longitude);
    final ParkingLoc updateLocation = ParkingLoc(
        latitude: location.latitude,
        longitude: location.longitude,
        address: locationName);

    final newPlace = ParkingModel(
      id: DateTime.now().toString(),
      title: title,
      image: image,
      location: updateLocation,
    );
    _parkings.add(newPlace);

    notifyListeners();
    DBParkingModel.insert("PLACES", {
      "id": newPlace.id,
      "title": newPlace.title,
      "image": newPlace.image.path,
      "loc_latitude": newPlace.location.latitude,
      "loc_longitude": newPlace.location.longitude,
      "address": newPlace.location.address,
    });
  }

  Future deletePlace(String title) async {
    final parking = findByTitle(title);
    _parkings.remove(parking);

    notifyListeners();
    DBParkingModel.delete("PLACES", parking.id);
  }

  Future fetchPlaces() async {
    final List<Map<String, dynamic>> dataPlaces =
        await DBParkingModel.read("PLACES");

    _parkings = dataPlaces
        .map((parking) => ParkingModel(
              id: parking["id"],
              title: parking["title"],
              image: File(parking["image"]),
              location: ParkingLoc(
                latitude: parking["loc_latitude"],
                longitude: parking["loc_longitude"],
                address: parking["address"],
              ),
            ))
        .toList();
    notifyListeners();
  }
}
