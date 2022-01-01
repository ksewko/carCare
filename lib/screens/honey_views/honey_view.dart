import 'package:carcare/model/honey/db_honey.dart';
import 'package:carcare/model/honey/honey_model.dart';
import 'package:carcare/screens/honey_views/add_honey_view.dart';
import 'package:carcare/screens/honey_views/edit_honey_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HoneyMain extends StatefulWidget {
  @override
  _HoneyMainState createState() => _HoneyMainState();
}

class _HoneyMainState extends State<HoneyMain> {
  List<HoneyModel> honey;
  String bgImage = 'bg_bee.png';
  Color mainColor = Colors.orange[700];
  Color subColor = Colors.yellow[200];
  Color secondSubColor = Colors.yellow[50];
  Color redColor = Colors.red[900];

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBHoney>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ostatnie zbiory'),
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
            future: getDB.getHoney(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                honey = snapshot.data;
                return ListView.builder(
                  itemCount: honey.length,
                  itemBuilder: (context, index) {
                    return Card(
                      // color: Theme.of(context).primaryColorLight,
                      color: subColor,
                      elevation: 6.0,
                      shape: StadiumBorder(),
                      child: ListTile(
                        leading: Icon(
                          Icons.brightness_5,
                          color: mainColor,
                        ),
                        title: Text(
                          honey[index].type,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          (honey[index].date),
                          style: TextStyle(
                            color: redColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          (honey[index].price),
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18.0,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditHoney(honey[index])),
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
            MaterialPageRoute(builder: (context) => AddHoney()),
          );
        },
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
