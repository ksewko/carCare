import 'package:flutter/material.dart';
import 'package:carcare/model/refuel/db_refuel.dart';
import 'package:carcare/model/refuel/refuel_model.dart';
import 'package:carcare/screens/refuel_views/add_refuel_view.dart';
import 'package:carcare/screens/refuel_views/edit_refuel_view.dart';
import 'package:provider/provider.dart';

class RefuelMain extends StatefulWidget {
  @override
  _RefuelMainState createState() => _RefuelMainState();
}

class _RefuelMainState extends State<RefuelMain> {
  List<RefuelModel> refuel;
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.black;
  String bgImage = 'bg.png';

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBRefuel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ostatnie tankowania'),
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
            future: getDB.getRefuel(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                refuel = snapshot.data;
                return ListView.builder(
                  itemCount: refuel.length,
                  itemBuilder: (context, index) {
                    return Card(
                      // color: Theme.of(context).primaryColorLight,
                      color: Colors.grey[300],
                      elevation: 6.0,
                      shape: StadiumBorder(),
                      child: ListTile(
                        leading: Icon(
                          Icons.local_gas_station,
                          color: mainColor,
                        ),
                        title: Text(
                          refuel[index].type,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          (refuel[index].date),
                          style: TextStyle(
                            color: subColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          (refuel[index].price),
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18.0,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditRefuel(refuel[index])),
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
            MaterialPageRoute(builder: (context) => AddRefuel()),
          );
        },
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
