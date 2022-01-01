import 'package:carcare/model/bee_info/bee_info_model.dart';
import 'package:carcare/model/bee_info/db_bee_info.dart';
import 'package:carcare/screens/bee_info_views/add_bee_info.dart';
import 'package:carcare/screens/bee_info_views/edit_bee_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeeInfoMain extends StatefulWidget {
  @override
  _BeeInfoMainState createState() => _BeeInfoMainState();
}

class _BeeInfoMainState extends State<BeeInfoMain> {
  List<BeeInfoModel> beeInfo;
  String bgImage = 'bg_bee.png';
  Color mainColor = Colors.orange[700];
  Color subColor = Colors.yellow[200];
  Color secondSubColor = Colors.yellow[50];

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBBeeInfo>(context);

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
            future: getDB.getBeeInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                beeInfo = snapshot.data;
                return ListView.builder(
                  itemCount: beeInfo.length,
                  itemBuilder: (context, index) {
                    if (beeInfo.length == 1) {
                      return Column(
                        children: [
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: secondSubColor,
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Nazwa: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (beeInfo[0].name),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: secondSubColor,
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Liczba uli: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (beeInfo[0].hivesNumber.toString()),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color:secondSubColor,
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Rok powstania: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (beeInfo[0].year.toString()),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: secondSubColor,
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Nzwisko pszczelarza: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (beeInfo[0].beekeeper),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: secondSubColor,
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Numer rejestracyjny pszczelarza: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (beeInfo[0].beekeeperNumber.toString()),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: secondSubColor,
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Charakter hodowli pszczół: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (beeInfo[0].character),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            // color: Theme.of(context).primaryColorLight,
                            color: secondSubColor,
                            elevation: 6.0,
                            shape: StadiumBorder(),
                            child: ListTile(
                              leading: Icon(
                                Icons.label_important,
                                color: mainColor,
                              ),
                              title: Text(
                                'Nazwa obrębu ewidencyjnego: ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (beeInfo[0].district),
                                style: TextStyle(
                                  color: Colors.black,
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
          if (beeInfo.length == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddBeeInfo()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditBeeInfo(beeInfo[0])),
            );
          }
        },
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
