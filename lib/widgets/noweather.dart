import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child:  Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            Text('there is no weather 😔 start searching now 🔍',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ],
        ),
      ),

    );

  }

}