import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //isNotEmpty metoda na mapach wbudowana
    // data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    // print(data);

    //set backgroud
    // String bgImage =data ['isDaytime'] ? 'day.png' : 'night.png';
    // Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircleAvatar(
                    radius: 75.0,
                    backgroundImage: AssetImage('assets/lala.jpg'),
                  ),
                ),
              ),
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
                          'Benzyna E95: ${olej} zł',
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
                          backgroundImage: AssetImage('assets/gaz.jpg'),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          'Benzyna E95: ${gaz} zł',
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
              Row(children: []),
              FlatButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/mechanics');
                  // setState(() {
                  //   data = {
                  //     'time': result['time'],
                  //     'location': result['location'],
                  //     'isDaytime': result['isDaytime'],
                  //     'flag': result['flag'],
                  //   };
                  // });
                },
                icon: Icon(
                  Icons.push_pin,
                  color: Colors.grey[300],
                ),
                label: Text('Przypomnienia',
                    style: TextStyle(
                      color: Colors.grey[300],
                    )),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/mechanics');
                    },
                    icon: Icon(
                      Icons.car_repair,
                      color: Colors.grey[300],
                    ),
                    label: Text('Pojazdy',
                        style: TextStyle(
                          color: Colors.grey[300],
                        )),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/mechanics');
                    },
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey[300],
                    ),
                    label: Text('Warsztaty',
                        style: TextStyle(
                          color: Colors.grey[300],
                        )),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/mechanics');
                    },
                    icon: Icon(
                      Icons.assistant,
                      color: Colors.grey[300],
                    ),
                    label: Text('Assistance',
                        style: TextStyle(
                          color: Colors.grey[300],
                        )),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/mechanics');
                    },
                    icon: Icon(
                      Icons.source,
                      color: Colors.grey[300],
                    ),
                    label: Text('CEPIK',
                        style: TextStyle(
                          color: Colors.grey[300],
                        )),
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
