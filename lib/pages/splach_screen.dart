import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      // Navigate to the next screen after 5 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboringScreen()),
      );
    });
  }

  @override
  Widget build
      (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             // First animation: TextLiquidFill
            // TextLiquidFill(
            //   text: 'Weather',
            //   waveColor: Colors.blueAccent,
            //   boxBackgroundColor: Colors.black,
            //   textStyle: TextStyle(
            //     fontSize: 80.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            //   boxHeight: 300.0,
            // ),
            SizedBox(height: 20),
            // Second animation: ColorizeAnimatedTextKit
            ColorizeAnimatedTextKit(
              text: ['Weather app'],
              textStyle: TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
              colors: [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
              ],
              textAlign: TextAlign.start,

            ),

          ],

        ),

      ),
    );
  }
}
