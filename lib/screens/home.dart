import 'package:carcare/model/weather/weather_data_api.dart';
import 'package:carcare/model/weather/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  final _cityTextController = TextEditingController();
  final _dataService = DataAPI();

  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    String bgImage = 'bg_bee.png';
    Color bgColor = Colors.blue;
    Color mainColor = Colors.orange[700];
    Color subColor = Colors.yellow[200];

    return Scaffold(
      //ustanienie paska na górze aplikacji w zależności od dnia i nocy
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Car Care'),
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
                Container(
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_response != null)
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(_response.iconUrl),
                              Text(
                                '${((_response.tempInfo.temperature - 32) / 1.8).toStringAsFixed(1)}°C',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  'Wilgotność ${_response.tempInfo.humidity}%',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              child: TextField(
                                  style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 20.0,
                                  ),
                                  controller: _cityTextController,
                                  decoration: InputDecoration(
                                      labelText: 'Miasto',
                                      labelStyle: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[400],
                                      )),
                                  textAlign: TextAlign.center),
                            ),
                            FlatButton(
                              onPressed: _search,
                              child: Text(
                                'Szukaj',
                                style: TextStyle(color: mainColor),
                              ),
                              color: subColor,
                              shape: StadiumBorder(),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                              await Navigator.pushNamed(context, '/reminders');
                        },
                        icon: Icon(
                          Icons.sticky_note_2,
                          color: mainColor,
                        ),
                        label: Text(
                          'Notatki',
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
                              await Navigator.pushNamed(context, '/car');
                        },
                        icon: Icon(
                          Icons.house_siding,
                          color: mainColor,
                        ),
                        label: Text(
                          'Moja pasieka',
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
                              await Navigator.pushNamed(context, '/mechanics');
                        },
                        icon: Icon(
                          Icons.euro,
                          color: mainColor,
                        ),
                        label: Text(
                          'Normy Unijne',
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
                              await Navigator.pushNamed(context, '/help');
                        },
                        icon: Icon(
                          Icons.assistant,
                          color: mainColor,
                        ),
                        label: Text(
                          'Pomoc',
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
                              await Navigator.pushNamed(context, '/parking');
                        },
                        icon: Icon(
                          Icons.location_on,
                          color: mainColor,
                        ),
                        label: Text(
                          'Lokalizacja Uli',
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
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
