import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  ProfilePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add arrow icon for navigation
          onPressed: () {
            Navigator.pop(context); // Navigate back when arrow is pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0), // Adjust top padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0), // Adjust the bottom padding
              child: Row(
                children: [
                  Container(
                    width: 40, // Adjust the width of the profile circle
                    height: 40, // Adjust the height of the profile circle
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey, // Change the color as needed
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10), // Add space between the "Welcome" text and the profile circle
                      Text(
                        'Welcome, ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4), // Add some space between the texts
                      Text(
                        username,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.edit, color: Colors.blue), // Change the icon color
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    tileColor: Colors.grey[200], // Set background color for the list item
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Add rounded corners to the list item
                    ),
                    leading: Icon(Icons.account_circle, color: Colors.green), // Change the icon color
                    title: Text(
                      'Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      // Handle account settings
                    },
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    leading: Icon(Icons.settings, color: Colors.orange),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      // Handle settings
                    },
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    leading: Icon(Icons.file_download, color: Colors.blue),
                    title: Text(
                      'Export Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      // Handle exporting data
                    },
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    tileColor: Colors.grey[200], // Set background color for the list item
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Add rounded corners to the list item
                    ),
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      // Handle logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
