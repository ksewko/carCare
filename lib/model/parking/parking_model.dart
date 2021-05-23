import 'dart:io';

import 'package:carcare/model/parking/parking_loc.dart';
import 'package:flutter/material.dart';

class ParkingModel {
  final String id;
  final String title;
  final File image;
  final ParkingLoc location;

  ParkingModel({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.location,
  });
}
