import 'package:flutter/material.dart';
import 'package:carcare/model/damages/damages_model.dart';
import 'package:carcare/model/damages/db_damages.dart';
import 'package:carcare/screens/damages_view/add_damages_view.dart';
import 'package:carcare/screens/damages_view/edit_damages_view.dart';
import 'package:provider/provider.dart';

class DamagesMain extends StatefulWidget {
  @override
  _DamagesMainState createState() => _DamagesMainState();
}

class _DamagesMainState extends State<DamagesMain> {
  List<DamagesModel> damages;
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.black;
  String bgImage = 'bg.png';

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBDamages>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista Szkód'),
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
          // color: Colors.blue[300],
          child: FutureBuilder(
            future: getDB.getDamages(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                damages = snapshot.data;
                return ListView.builder(
                  itemCount: damages.length,
                  itemBuilder: (context, index) {
                    return Card(
                      // color: Theme.of(context).primaryColorLight,
                      color: Colors.grey[300],
                      elevation: 6.0,
                      shape: StadiumBorder(),
                      child: ListTile(
                        leading: Icon(
                          Icons.whatshot,
                          color: mainColor,
                        ),
                        title: Text(
                          damages[index].name,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          (damages[index].place),
                          style: TextStyle(
                            color: subColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          (damages[index].date),
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
                                    EditDamages(damages[index])),
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
            MaterialPageRoute(builder: (context) => AddDamages()),
          );
        },
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
