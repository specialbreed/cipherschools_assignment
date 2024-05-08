import 'package:flutter/material.dart';
import 'package:cipherschools_assignment/Auth/sign_up.dart';

class GettingStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Background color
        child: Stack(
          children: [
            // Image Logo at the Top Left
            Positioned(
              top: 20, // Adjusted top position
              left: 20,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Image.asset(
                  'assets/images/log.png', // Replace with your image asset path
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            // Text at the Bottom Left
            Positioned(
              bottom: 40, // Moved text further up
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8), // Move text up a little bit
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4), // Add space between the texts
                  Text(
                    'CIPHERX',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20), // Add space between the texts and arrow
                  Text(
                    'The best way to track your expenses',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Arrow at the same position as CIPHERX but on the right side
            Positioned(
              bottom: 95, // Moved arrow up
              right: 20, // Adjusted right position
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()), // Navigate to your next page
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white38,
                  ),
                  padding: EdgeInsets.all(15), // Adjusted padding
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 70,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GettingStarted(),
  ));
}
