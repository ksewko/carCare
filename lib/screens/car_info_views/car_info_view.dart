import 'package:flutter/material.dart';
import 'package:movierental/model/car/car_info_model.dart';
import 'package:movierental/model/car/db_car_info.dart';
import 'package:movierental/screens/car_info_views/add_car_info_view.dart';
import 'package:movierental/screens/car_info_views/edit_car_info_view.dart';
import 'package:provider/provider.dart';

class CarInfoMain extends StatefulWidget {
  @override
  _CarInfoMainState createState() => _CarInfoMainState();
}

class _CarInfoMainState extends State<CarInfoMain> {
  List<CarInfoModel> carinfo;

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBCarInfo>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Informacje'),
        backgroundColor: Colors.blue[900],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blue[300],
          child: FutureBuilder(
            future: getDB.getCarInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                carinfo = snapshot.data;
                return ListView.builder(
                  itemCount: carinfo.length,
                  itemBuilder: (context, index) {
                    return Card(
                      // color: Theme.of(context).primaryColorLight,
                      color: Colors.grey[300],
                      elevation: 6.0,
                      shape: StadiumBorder(),
                      child: ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.blue[900],
                        ),
                        title: Text(
                          carinfo[index].brand,
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          (carinfo[index].model),
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          (carinfo[index].year.toString()),
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 18.0,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditCarInfo(carinfo[index])),
                          );
                        },
                      ),
                    );
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
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCarInfo()),
          );
        },
      ),
    );
  }
}
