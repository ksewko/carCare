import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CarView extends StatefulWidget {
  @override
  _CarViewState createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    String bgImage = 'bg.png';
    Color mainColor = Colors.grey[900];

    //ceny paliw
    double benzyna = 4.67;
    double olej = 4.69;
    double gaz = 2.11;

    return Scaffold(
      //ustanienie paska na górze aplikacji w zależności od dnia i nocy
      appBar: AppBar(
        centerTitle: true,
        title: Text('Moje auto'),
        backgroundColor: mainColor,
        elevation: 0.0,
      ),
      body: SafeArea(
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
                children: [
                  Expanded(
                    child: FlatButton.icon(
                      height: 50.0,
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/carinfo');
                      },
                      icon: Icon(
                        Icons.info,
                        color: mainColor,
                      ),
                      label: Text(
                        'Informacje',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.grey[300],
                    ),
                  ),
                  Expanded(
                    child: FlatButton.icon(
                      height: 50.0,
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/tires');
                      },
                      icon: Icon(
                        Icons.circle,
                        color: mainColor,
                      ),
                      label: Text(
                        'Opony',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.grey[50],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: FlatButton.icon(
                      height: 50.0,
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/service');
                      },
                      icon: Icon(
                        Icons.build,
                        color: mainColor,
                      ),
                      label: Text(
                        'Serwis',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.grey[50],
                    ),
                  ),
                  Expanded(
                    child: FlatButton.icon(
                      height: 50.0,
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/refuel');
                      },
                      icon: Icon(
                        Icons.local_gas_station,
                        color: mainColor,
                      ),
                      label: Text(
                        'Tankowanie',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: FlatButton.icon(
                      height: 50.0,
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/damages');
                      },
                      icon: Icon(
                        Icons.whatshot,
                        color: mainColor,
                      ),
                      label: Text(
                        'Szkody',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.grey[300],
                    ),
                  ),
                  Expanded(
                    child: FlatButton.icon(
                      height: 50.0,
                      onPressed: () async {
                        final url = 'https://historiapojazdu.gov.pl/';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      },
                      icon: Icon(
                        Icons.insert_chart,
                        color: mainColor,
                      ),
                      label: Text(
                        'CEPIK',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.grey[50],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: FlatButton.icon(
                      height: 50.0,
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/mechanics');
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        color: mainColor,
                      ),
                      label: Text(
                        'Zdjęcia',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
