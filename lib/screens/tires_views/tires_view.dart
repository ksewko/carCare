import 'package:flutter/material.dart';
import 'package:movierental/model/tires/db_tires.dart';
import 'package:movierental/model/tires/tires_model.dart';
import 'package:movierental/screens/tires_views/add_tires_view.dart';
import 'package:movierental/screens/tires_views/edit_tires_view.dart';
import 'package:provider/provider.dart';

class TiresMain extends StatefulWidget {
  @override
  _TiresMainState createState() => _TiresMainState();
}

class _TiresMainState extends State<TiresMain> {
  List<TiresModel> tires;

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBTires>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Opony'),
        backgroundColor: Colors.blue[900],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blue[300],
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
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('assets/tires.jpg'),
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
                              color: Colors.blue[900],
                            ),
                            title: Text(
                              tires[index].rims,
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              children: [
                                Text(
                                  (tires[index].tireSize),
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  (tires[index].frontPressure),
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  (tires[index].backPressure),
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Text(
                              tires[index].isSummer,
                              style: TextStyle(
                                color: Colors.blue[900],
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
      ),
    );
  }
}
