import 'package:flutter/material.dart';
import 'package:movierental/model/serwis/db_serwis.dart';
import 'package:movierental/model/serwis/serwis_model.dart';
import 'package:movierental/screens/serwis_views/add_serwis_view.dart';
import 'package:movierental/screens/serwis_views/edit_serwis_view.dart';
import 'package:provider/provider.dart';

class SerwisMain extends StatefulWidget {
  @override
  _SerwisMainState createState() => _SerwisMainState();
}

class _SerwisMainState extends State<SerwisMain> {
  List<SerwisModel> serwis;

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBSerwis>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista Serwisów'),
        backgroundColor: Colors.blue[900],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blue[300],
          child: FutureBuilder(
            future: getDB.getSerwis(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                serwis = snapshot.data;
                return ListView.builder(
                  itemCount: serwis.length,
                  itemBuilder: (context, index) {
                    return Card(
                      // color: Theme.of(context).primaryColorLight,
                      color: Colors.grey[300],
                      elevation: 6.0,
                      shape: StadiumBorder(),
                      child: ListTile(
                        leading: Icon(
                          Icons.construction_rounded,
                          color: Colors.blue[900],
                        ),
                        title: Text(
                          serwis[index].name,
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          (serwis[index].date),
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          (serwis[index].price),
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
                                    EditSerwis(serwis[index])),
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
            MaterialPageRoute(builder: (context) => AddSerwis()),
          );
        },
      ),
    );
  }
}
