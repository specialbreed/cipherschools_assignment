import 'dart:async';
import 'package:flutter/material.dart';
import 'gettingstarted.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => GettingStarted()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Add MaterialApp here
      home: Scaffold(
        backgroundColor: Colors.blue.shade800,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.3),
                ),
                child: Image.asset( // Use Image.asset for local images
                  'assets/images/log.png', // Replace 'assets/your_image.png' with your image path
                  width: 100, // Adjust width as needed
                  height: 100, // Adjust height as needed
                  fit: BoxFit.contain, // Adjust image fit
                ),
              ),
              SizedBox(height: 20),
              Text(
                'CIPHERX',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}
