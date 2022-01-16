import 'package:flutter/material.dart';
import 'package:carcare/screens/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  String bgImage = 'bg.png';
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit
                .cover, //zasłoni cały background, -> umiejscowienie image w bgc
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 24.0),
                ),
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                  )),
                ),
                Text(
                  'Bee Happy',
                  style: TextStyle(fontSize: 24.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
