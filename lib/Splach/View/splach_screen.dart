import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Onbording/View/onbording_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      // Navigate to the next screen after 10 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboringScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // First animation: ColorizeAnimatedTextKit
            ColorizeAnimatedTextKit(
              text: ['Weather'],
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
            SizedBox(height: 10),
            // Second animation: TyperAnimatedTextKit
            TyperAnimatedTextKit(
              text: ['App'],
              textStyle: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
