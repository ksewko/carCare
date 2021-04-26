import 'package:flutter/material.dart';

class HelpView extends StatefulWidget {
  @override
  _HelpViewState createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    String bgImage = 'night.png';
    Color bgColor = Colors.blue;
    Color cellFirst = Colors.grey[50];
    Color cellSecond = Colors.grey[300];

    return Scaffold(
      //ustanienie paska na górze aplikacji w zależności od dnia i nocy
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pomoc'),
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
                    backgroundImage: AssetImage('assets/help.jpg'),
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
                            await Navigator.pushNamed(context, '/assistance');
                      },
                      icon: Icon(
                        Icons.local_phone_outlined,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Assistance',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 18.0,
                        ),
                      ),
                      color: cellFirst,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Expanded(
                    child: FlatButton.icon(
                      height: 50.0,
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/form');
                      },
                      icon: Icon(
                        Icons.description_outlined,
                        color: Colors.blue[900],
                      ),
                      label: Text(
                        'Formularz',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 18.0,
                        ),
                      ),
                      color: cellSecond,
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
