import 'package:carcare/model/inspection/db_inspection.dart';
import 'package:carcare/model/inspection/inspection_model.dart';
import 'package:carcare/screens/inspection_views/add_inspection_view.dart';
import 'package:carcare/screens/inspection_views/edit_inspection_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InspectionMain extends StatefulWidget {
  @override
  _InspectionMainState createState() => _InspectionMainState();
}

class _InspectionMainState extends State<InspectionMain> {
  List<InspectionModel> inspection;
   String bgImage = 'bg_bee.png';
  Color mainColor = Colors.orange[700];
  Color subColor = Colors.yellow[200];
  Color secondSubColor = Colors.yellow[50];
  Color redColor = Colors.red[900];

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBInspection>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista Przeglądów'),
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
            future: getDB.getInspection(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                inspection = snapshot.data;
                return ListView.builder(
                  itemCount: inspection.length,
                  itemBuilder: (context, index) {
                    return Card(
                      // color: Theme.of(context).primaryColorLight,
                      color: Colors.grey[300],
                      elevation: 6.0,
                      shape: StadiumBorder(),
                      child: ListTile(
                        leading: Icon(
                          Icons.construction_rounded,
                          color: mainColor,
                        ),
                        title: Text(
                          inspection[index].name,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          (inspection[index].date),
                          style: TextStyle(
                            color: subColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditInspection(inspection[index])),
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
            MaterialPageRoute(builder: (context) => AddInspection()),
          );
        },
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
