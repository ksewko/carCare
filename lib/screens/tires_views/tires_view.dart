import 'package:flutter/material.dart';
import 'package:carcare/model/tires/db_tires.dart';
import 'package:carcare/model/tires/tires_model.dart';
import 'package:carcare/screens/tires_views/add_tires_view.dart';
import 'package:carcare/screens/tires_views/edit_tires_view.dart';
import 'package:provider/provider.dart';

class TiresMain extends StatefulWidget {
  @override
  _TiresMainState createState() => _TiresMainState();
}

class _TiresMainState extends State<TiresMain> {
  List<TiresModel> tires;
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.black;
  String bgImage = 'bg.png';

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBTires>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Opony'),
        backgroundColor: mainColor,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit
                .cover, //zasłoni cały background, -> umiejscowienie image w bgc
          )),
          child: FutureBuilder(
            future: getDB.getTires(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                tires = snapshot.data;
                return ListView.builder(
                  itemCount: tires.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              height: 150.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/tires.png'),
                                fit: BoxFit
                                    .fill, //zasłoni cały background, -> umiejscowienie image w bgc
                              )),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.grey[300],
                          elevation: 6.0,
                          shape: StadiumBorder(),
                          child: ListTile(
                            leading: Icon(
                              Icons.radio_button_checked,
                              color: mainColor,
                            ),
                            title: Text(
                              tires[index].rims,
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              children: [
                                Text(
                                  (tires[index].tireSize),
                                  style: TextStyle(
                                    color: subColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  (tires[index].frontPressure),
                                  style: TextStyle(
                                    color: subColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  (tires[index].backPressure),
                                  style: TextStyle(
                                    color: subColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Text(
                              tires[index].isSummer,
                              style: TextStyle(
                                color: mainColor,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EditTires(tires[index])),
                              );
                            },
                          ),
                        ),
                      ],
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
            MaterialPageRoute(builder: (context) => AddTires()),
          );
        },
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
