import 'package:carcare/model/places/place.dart';
import 'package:carcare/model/places/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceItem extends StatefulWidget {
  PlaceItem({
    @required this.currentPlace,
  });

  final Place currentPlace;

  @override
  _PlaceItemState createState() => _PlaceItemState();
}

class _PlaceItemState extends State<PlaceItem> {
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
                widget.currentPlace.image,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Text(
                widget.currentPlace.title,
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
                      widget.currentPlace.location.address,
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
                                'Czy chcesz usunąć parking \n${widget.currentPlace.title} z listy?',
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
                                    await Provider.of<PlaceProvider>(context,
                                            listen: false)
                                        .deletePlace(widget.currentPlace.title);
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
