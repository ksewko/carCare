import 'package:flutter/material.dart';

class CarView extends StatefulWidget {
  @override
  _CarViewState createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    String bgImage = 'night.png';
    Color bgColor = Colors.blue;

    //ceny paliw
    double benzyna = 4.67;
    double olej = 4.69;
    double gaz = 2.11;

    return Scaffold(
      //ustanienie paska na górze aplikacji w zależności od dnia i nocy
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Twoje auto'),
        backgroundColor: Colors.blue[900],
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
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: AssetImage('assets/lala.jpg'),
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
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Informacje',
                        style: TextStyle(
                          color: Colors.blue[900],
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
                            await Navigator.pushNamed(context, '/cars');
                      },
                      icon: Icon(
                        Icons.circle,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Opony',
                        style: TextStyle(
                          color: Colors.blue[900],
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
                            await Navigator.pushNamed(context, '/mechanics');
                      },
                      icon: Icon(
                        Icons.build,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Serwis',
                        style: TextStyle(
                          color: Colors.blue[900],
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
                            await Navigator.pushNamed(context, '/mechanics');
                      },
                      icon: Icon(
                        Icons.local_gas_station,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Tankowanie',
                        style: TextStyle(
                          color: Colors.blue[900],
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
                            await Navigator.pushNamed(context, '/mechanics');
                      },
                      icon: Icon(
                        Icons.whatshot,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Szkody',
                        style: TextStyle(
                          color: Colors.blue[900],
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
                            await Navigator.pushNamed(context, '/mechanics');
                      },
                      icon: Icon(
                        Icons.insert_chart,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Statystyki',
                        style: TextStyle(
                          color: Colors.blue[900],
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
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Zdjęcia',
                        style: TextStyle(
                          color: Colors.blue[900],
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
