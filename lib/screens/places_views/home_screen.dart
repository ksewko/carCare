import 'package:carcare/model/places/place_provider.dart';
import 'package:carcare/model/places/widgets/place_item.dart';
import 'package:carcare/screens/places_views/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Colors.grey[900];
    Color subColor = Colors.black;
    String bgImage = 'bg.png';

    return Scaffold(
      appBar: AppBar(
        title: Text("Gdzie zaparkowałeś?"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
        backgroundColor: mainColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit
              .cover, //zasłoni cały background, -> umiejscowienie image w bgc
        )),
        child: FutureBuilder(
          future:
              Provider.of<PlaceProvider>(context, listen: false).fetchPlaces(),
          builder: (context, snapshot) =>
              (snapshot.connectionState == ConnectionState.waiting)
                  ? SpinKitFadingCircle(
                      color: mainColor,
                    )
                  : Consumer<PlaceProvider>(
                      child: Center(
                        child: Text(
                          "Brak danych do wyświetlenia",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      builder: (context, place, child) {
                        return (place.places.isEmpty)
                            ? child
                            : ListView.builder(
                                padding: const EdgeInsets.all(16),
                                itemCount: place.places.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final currentPlace = place.places[index];
                                  return PlaceItem(currentPlace: currentPlace);
                                },
                              );
                      },
                    ),
        ),
      ),
    );
  }
}
