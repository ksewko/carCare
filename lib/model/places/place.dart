import 'dart:io';

import 'package:carcare/model/places/place_location.dart';
import 'package:flutter/material.dart';

class Place {
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;

  Place({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.location,
  });
}
