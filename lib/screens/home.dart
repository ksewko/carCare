import 'package:carcare/model/weather/weather_data_api.dart';
import 'package:carcare/model/weather/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hexagon/hexagon.dart';

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
    Color subColor2 = Colors.yellow[50];
    Color subColor3 = Colors.yellow[100];

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
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                  controller: _cityTextController,
                                  decoration: InputDecoration(
                                      labelText: 'Miasto',
                                      labelStyle: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
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
                  children: <Widget>[
                    HexagonWidget.flat(
                      width: 150.0,
                      color: subColor,
                      child: FlatButton(
                        height: 150.0,
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/notes');
                        },
                        child: Text(
                          'Notatki',
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
                      color: subColor2,
                      child: FlatButton(
                        height: 150.0,
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/hive');
                        },
                        child: Text(
                          'Moja pasieka',
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
                      color: subColor3,
                      child: FlatButton(
                        height: 150.0,
                        onPressed: () async {
                          final url =
                              'https://www.pasieka24.pl/index.php/pl-pl/pasieka-czasopismo-dla-pszczelarzy/101-pasieka-1-2004/1195-pszczelarstwo-w-unii-europejskiej';
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceSafariVC: false,
                            );
                          }
                        },
                        child: Text(
                          'Normy Unijne',
                          textAlign: TextAlign.center,
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

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
