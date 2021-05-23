import 'package:carcare/model/parking/location_helper.dart';
import 'package:carcare/model/parking/parking_loc.dart';
import 'package:carcare/screens/parking_view/map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location/location.dart';
import 'package:latlong/latlong.dart';

class LocWidget extends StatefulWidget {
  final Function onMapSelected;
  LocWidget(this.onMapSelected);

  @override
  _LocWidgetState createState() => _LocWidgetState();
}

class _LocWidgetState extends State<LocWidget> {
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  Color redColor = Colors.red[900];
  String bgImage = 'bg.png';

  String _previewImageUrl;
  bool _isLoadImage = false;
  bool _isNavigateToMap = false;

  Future _getCurrentLocation() async {
    setState(() {
      _isLoadImage = true;
      _previewImageUrl = "";
    });
    final LocationData locationData = await Location().getLocation();
    setState(() {
      _isLoadImage = false;
      _previewImageUrl = LocationHelper.generatePreviewImage(
          latitude: locationData.latitude, longitude: locationData.longitude);
    });
    widget.onMapSelected(locationData.latitude, locationData.longitude);
  }

  Future _selectOnMap() async {
    setState(() {
      _isNavigateToMap = true;
    });
    final LocationData locationData = await Location().getLocation();
    final LatLng selectMap = await Navigator.of(context).push(MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => MapView(
        location: ParkingLoc(
            latitude: locationData.latitude, longitude: locationData.longitude),
        isSelecting: true,
      ),
    ));
    if (selectMap == null) {
      return;
    }
    setState(() {
      _isNavigateToMap = false;
      _previewImageUrl = LocationHelper.generatePreviewImage(
        latitude: selectMap.latitude,
        longitude: selectMap.longitude,
      );
    });
    widget.onMapSelected(selectMap.latitude, selectMap.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: subColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: (_previewImageUrl == null)
              ? Text(
                  "Nie wybrano lokalizacji",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: subColor,
                    fontSize: 16.0,
                  ),
                )
              : (_isLoadImage)
                  ? SpinKitFadingCircle(
                      color: mainColor,
                    )
                  : Image.network(
                      _previewImageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              icon: Icon(Icons.location_on, color: subColor),
              label: Text(
                "Aktualna lokalizacja",
                style: TextStyle(
                  color: subColor,
                  fontSize: 14.0,
                ),
              ),
              onPressed: _getCurrentLocation,
            ),
            (_isNavigateToMap)
                ? SpinKitFadingCircle(
                    color: mainColor,
                  )
                : TextButton.icon(
                    icon: Icon(Icons.map, color: subColor),
                    label: Text(
                      "Zaznacz na mapie",
                      style: TextStyle(
                        color: subColor,
                        fontSize: 14.0,
                      ),
                    ),
                    onPressed: _selectOnMap,
                  ),
          ],
        ),
      ],
    );
  }
}
