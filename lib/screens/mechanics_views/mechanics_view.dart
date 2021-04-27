import 'package:flutter/material.dart';
import 'package:carcare/model/mechanics/db_mechanics.dart';
import 'package:carcare/model/mechanics/mechanics_model.dart';
import 'package:carcare/screens/mechanics_views/add_mechanics_view.dart';
import 'package:carcare/screens/mechanics_views/edit_mechanics_view.dart';
import 'package:provider/provider.dart';

class MechanicsMain extends StatefulWidget {
  @override
  _MechanicsMainState createState() => _MechanicsMainState();
}

class _MechanicsMainState extends State<MechanicsMain> {
  List<MechanicsModel> mechanics;

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBMechanics>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista Warsztatów'),
        backgroundColor: Colors.blue[900],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blue[300],
          child: FutureBuilder(
            future: getDB.getMechanics(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                mechanics = snapshot.data;
                return ListView.builder(
                  itemCount: mechanics.length,
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
                          mechanics[index].name,
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          (mechanics[index].address),
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          (mechanics[index].phoneNumber.toString()),
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
                                    EditMechanics(mechanics[index])),
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
            MaterialPageRoute(builder: (context) => AddMechanics()),
          );
        },
      ),
    );
  }
}
