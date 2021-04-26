import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        title: Text('Car Care'),
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
                    radius: 75.0,
                    backgroundImage: AssetImage('assets/lala.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                width: 350.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    Text(
                      'Ceny paliw:',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 15.0,
                          backgroundImage: AssetImage('assets/benzyna.jpg'),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          'Benzyna E95: ${benzyna} zł',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 15.0,
                          backgroundImage: AssetImage('assets/olej.jpg'),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          'Olej Napędowy: ${olej} zł',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 15.0,
                          backgroundImage: AssetImage('assets/gaz.jpg'),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          'LPG E95: ${gaz} zł',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
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
                            await Navigator.pushNamed(context, '/home');
                      },
                      icon: Icon(
                        Icons.push_pin,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Przypomnienia',
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
                            await Navigator.pushNamed(context, '/car');
                      },
                      icon: Icon(
                        Icons.car_repair,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Twoje auto',
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
                        Icons.settings,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Warsztaty',
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
                            await Navigator.pushNamed(context, '/help');
                      },
                      icon: Icon(
                        Icons.assistant,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Pomoc',
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
                        Icons.source,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'CEPIK',
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
