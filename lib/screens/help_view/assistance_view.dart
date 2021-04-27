import 'package:flutter/material.dart';

class AssistanceView extends StatefulWidget {
  @override
  _AssistanceViewState createState() => _AssistanceViewState();
}

class _AssistanceViewState extends State<AssistanceView> {
  Map data = {};
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  String bgImage = 'bg.png';

  @override
  Widget build(BuildContext context) {
    String bgImage = 'bg.png';

    Color cellFirst = Colors.grey[50];
    Color cellSecond = Colors.grey[300];

    return Scaffold(
      //ustanienie paska na górze aplikacji w zależności od dnia i nocy
      appBar: AppBar(
        centerTitle: true,
        title: Text('Assistance'),
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
              //Lista przycisków -> odniesień na inne screeny
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_phone,
                            color: mainColor,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            'ALLIANZ',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            '224224224',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      color: cellSecond,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_phone,
                            color: mainColor,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            'AVIVA',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            '225632828',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      color: cellFirst,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_phone,
                            color: mainColor,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            'AXA DIRECT',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            '225999522',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      color: cellSecond,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_phone,
                            color: mainColor,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            'GENERALI',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            '913913913',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      color: cellFirst,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_phone,
                            color: mainColor,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            'LINK4',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            '224444444',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      color: cellSecond,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_phone,
                            color: mainColor,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            'PROAMA',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            '815815815',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      color: cellFirst,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_phone,
                            color: mainColor,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            'PZU',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            '225665555',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      color: cellSecond,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_phone,
                            color: mainColor,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            'TUZ',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            '223276060',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      color: cellFirst,
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
