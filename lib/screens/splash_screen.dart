import 'package:flutter/material.dart';
import 'package:carcare/screens/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        // MaterialPageRoute(builder: (context) => HomePage()),
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 24.0),
                ),
                FlutterLogo(
                  size: 300.0,
                ),
                Text(
                  'Movie Rental App',
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
