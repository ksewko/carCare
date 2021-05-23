import 'package:carcare/model/parking/db_parking_provider.dart';
import 'package:carcare/model/parking/widgets/parking_widget.dart';
import 'package:carcare/screens/parking_view/add_parking_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ParkingView extends StatelessWidget {
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
              Navigator.of(context).pushNamed(AddParking.routeName);
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
          future: Provider.of<DBParkingProvider>(context, listen: false)
              .fetchPlaces(),
          builder: (context, snapshot) =>
              (snapshot.connectionState == ConnectionState.waiting)
                  ? SpinKitFadingCircle(
                      color: mainColor,
                    )
                  : Consumer<DBParkingProvider>(
                      child: Center(
                        child: Text(
                          "Brak danych do wyświetlenia",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      builder: (context, parking, child) {
                        return (parking.parkings.isEmpty)
                            ? child
                            : ListView.builder(
                                padding: const EdgeInsets.all(16),
                                itemCount: parking.parkings.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final currentParking =
                                      parking.parkings[index];
                                  return ParkingWidget(
                                      currentParking: currentParking);
                                },
                              );
                      },
                    ),
        ),
      ),
    );
  }
}
