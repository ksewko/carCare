import 'package:flutter/material.dart';

class ParkingLoc {
  final double latitude;
  final double longitude;
  final String address;

  const ParkingLoc({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });
}
