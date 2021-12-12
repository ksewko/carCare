import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hexagon/hexagon.dart';

class CarView extends StatefulWidget {
  @override
  _CarViewState createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    String bgImage = 'bg_bee.png';
    Color mainColor = Colors.orange[700];
    Color subColor = Colors.yellow[200];
    Color secondSubColor = Colors.yellow[50];

    return Scaffold(
      //ustanienie paska na górze aplikacji w zależności od dnia i nocy
      appBar: AppBar(
        centerTitle: true,
        title: Text('Moja pasieka'),
        backgroundColor: mainColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit
                  .cover, //zasłoni cały background, -> umiejscowienie image w bgc
            )),
            child: Column(
              children: <Widget>[
                SizedBox(height: 25.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      height: 150.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit
                            .fill, //zasłoni cały background, -> umiejscowienie image w bgc
                      )),
                    ),
                  ),
                ),
                //Lista przycisków -> odniesień na inne screeny
                SizedBox(height: 25.0),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexagonWidget.flat(
                      width: 150.0,
                      color: subColor,
                      child: FlatButton(
                        height: 150.0,
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/hiveinfo');
                        },
                        child: Text(
                          'Informacje',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    HexagonWidget.flat(
                      width: 150.0,
                      color: secondSubColor,
                      child: FlatButton(
                        height: 150.0,
                        onPressed: () async {
                          dynamic result =
                             await Navigator.pushNamed(context, '/families');
                        },
                        child: Text(
                          'Rodziny',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexagonWidget.flat(
                      width: 150.0,
                      color: secondSubColor,
                      child: FlatButton(
                        height: 150.0,
                        onPressed: () async {
                          dynamic result =
                             await Navigator.pushNamed(context, '/honey');
                        },
                        child: Text(
                          'Miód',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    HexagonWidget.flat(
                      width: 150.0,
                      color: subColor,
                      child: FlatButton(
                        height: 150.0,
                        onPressed: () async {
                          dynamic result =
                             await Navigator.pushNamed(context, '/service');
                        },
                        child: Text(
                          'Przegląd',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexagonWidget.flat(
                      width: 150.0,
                      color: subColor,
                      child: FlatButton(
                        height: 150.0,
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/location');
                        },
                        child: Text(
                          'Lokalizacja\n Uli',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    HexagonWidget.flat(
                      width: 150.0,
                      color: secondSubColor,
                      child: FlatButton(
                        height: 150.0,
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/photos');
                        },
                        child: Text(
                          'Zdjęcia',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
