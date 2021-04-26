import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    String bgImage = 'night.png';
    Color bgColor = Colors.blue;

    return Scaffold(
      //ustanienie paska na górze aplikacji w zależności od dnia i nocy
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Oświadczenie'),
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
              //Lista przycisków -> odniesień na inne screeny
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Ja …. , niżej podpisany, zamieszkały w …., pod adresem …., legitymujący się prawem jazdy kat. …. o numerze …., a także dowodem osobistym, wydanym przez …., o numerze …., oświadczam co następuje. W dniu …., około godz. …., w miejscowości …., kierując samochodem marki …., o numerze rejestracyjnym …., którego posiadaczem jest …. (ubezpieczony w zakresie obowiązkowego ubezpieczenia OC posiadaczy pojazdów mechanicznych w …., nr polisy …., ważnej od …. do ….) spowodowałem wypadek komunikacyjny. W wypadku tym uszkodzeniu uległ pojazd marki …., nr rejestracyjny …., którym kierował …. . Uszkodzony pojazd stanowi własność …. .\nData i czytelny podpis: …. \nNumer kontaktowy: ….',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      color: Colors.grey[50],
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
