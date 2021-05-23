import 'package:carcare/model/parking/parking_model.dart';
import 'package:carcare/model/parking/db_parking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParkingWidget extends StatefulWidget {
  ParkingWidget({
    @required this.currentParking,
  });

  final ParkingModel currentParking;

  @override
  _ParkingWidgetState createState() => _ParkingWidgetState();
}

class _ParkingWidgetState extends State<ParkingWidget> {
  final _titleController = TextEditingController();
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  Color redColor = Colors.red[900];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.file(
                widget.currentParking.image,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Text(
                widget.currentParking.title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_pin,
                    color: redColor,
                    size: 30.0,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.currentParking.location.address,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: mainColor),
                    ),
                  ),
                  IconButton(
                    color: redColor,
                    icon: Icon(Icons.delete, color: redColor),
                    iconSize: 30.0,
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Usuń Parking!',
                                textAlign: TextAlign.center,
                              ),
                              content: Text(
                                'Czy chcesz usunąć parking \n${widget.currentParking.title} z listy?',
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
                                    'Tak',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  onPressed: () async {
                                    await Provider.of<DBParkingProvider>(
                                            context,
                                            listen: false)
                                        .deletePlace(
                                            widget.currentParking.title);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
