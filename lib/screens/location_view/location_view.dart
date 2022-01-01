import 'package:carcare/model/location/db_location_provider.dart';
import 'package:carcare/model/widgets/location_widget.dart';
import 'package:carcare/screens/location_view/add_location_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String bgImage = 'bg_bee.png';
    Color mainColor = Colors.orange[700];
    Color subColor = Colors.yellow[200];
    Color secondSubColor = Colors.yellow[50];

    return Scaffold(
      appBar: AppBar(
        title: Text("Gdzie stawiasz ule?"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddLocation.routeName);
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
          future: Provider.of<DBLocationProvider>(context, listen: false)
              .fetchPlaces(),
          builder: (context, snapshot) =>
              (snapshot.connectionState == ConnectionState.waiting)
                  ? SpinKitFadingCircle(
                      color: mainColor,
                    )
                  : Consumer<DBLocationProvider>(
                      child: Center(
                        child: Text(
                          "Brak danych do wyświetlenia",
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      builder: (context, location, child) {
                        return (location.locations.isEmpty)
                            ? child
                            : ListView.builder(
                                padding: const EdgeInsets.all(16),
                                itemCount: location.locations.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final currentLocation =
                                      location.locations[index];
                                  return LocationWidget(
                                      currentLocation: currentLocation);
                                },
                              );
                      },
                    ),
        ),
      ),
    );
  }
}
