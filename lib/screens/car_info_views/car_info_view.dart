import 'package:flutter/material.dart';
import 'package:carcare/model/car_info/car_info_model.dart';
import 'package:carcare/model/car_info/db_car_info.dart';
import 'package:carcare/screens/car_info_views/add_car_info_view.dart';
import 'package:carcare/screens/car_info_views/edit_car_info_view.dart';
import 'package:provider/provider.dart';

class CarInfoMain extends StatefulWidget {
  @override
  _CarInfoMainState createState() => _CarInfoMainState();
}

class _CarInfoMainState extends State<CarInfoMain> {
  List<CarInfoModel> carinfo;
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.black;
  String bgImage = 'bg.png';

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBCarInfo>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Podstawowe Informacje'),
        backgroundColor: mainColor,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: FutureBuilder(
            future: getDB.getCarInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                carinfo = snapshot.data;
                return ListView.builder(
                  itemCount: carinfo.length,
                  itemBuilder: (context, index) {
                    if (carinfo.length == 1) {
                      return Column(
                        children: [
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: Colors.grey[300],
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Marka: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (carinfo[0].brand),
                                style: TextStyle(
                                  color: subColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: Colors.grey[300],
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Model: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (carinfo[0].model),
                                style: TextStyle(
                                  color: subColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: Colors.grey[300],
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Rok Produkcji: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (carinfo[0].year.toString()),
                                style: TextStyle(
                                  color: subColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: Colors.grey[300],
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Numer Rejestracyjny: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (carinfo[0].registration),
                                style: TextStyle(
                                  color: subColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: Colors.grey[300],
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Numer VIN: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (carinfo[0].vin),
                                style: TextStyle(
                                  color: subColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: Colors.grey[300],
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Pojemność silnika: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (carinfo[0].engineCapacity),
                                style: TextStyle(
                                  color: subColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: Colors.grey[300],
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Numer polisy: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (carinfo[0].policyNumber.toString()),
                                style: TextStyle(
                                  color: subColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit,
          color: subColor,
        ),
        onPressed: () {
          if (carinfo.length == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCarInfo()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditCarInfo(carinfo[0])),
            );
          }
        },
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
