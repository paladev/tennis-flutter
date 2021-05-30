import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./lib/images/Image.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
