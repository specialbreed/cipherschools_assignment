import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bottom_navigation.dart'; // Import your BottomNavigation widget
import 'income_page.dart';
import 'expense_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMonth = 'January'; // Track the selected month

  @override
  Widget build(BuildContext context) {
    // Retrieve the current user from FirebaseAuth
    User? currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40.0), // Add some space at the top
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  radius: 30,
                ),
                Expanded(
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedMonth, // Set the selected month
                      items: <String>[
                        'January', 'February', 'March', 'April', 'May', 'June',
                        'July', 'August', 'September', 'October', 'November', 'December'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMonth = newValue!; // Update the selected month
                        });
                      },
                    ),
                  ),
                ),
                IconButton(
                  color: Colors.blue,
                  icon: Icon(Icons.notifications),
                  iconSize: 40.0, // Increase the size of the notification icon
                  onPressed: () {
                    // Handle notification icon press
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0), // Add some space between the header and the banners
          Center(
            child: Column(
              children: [
                Text(
                  'Account Balance',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to income page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IncomeScreen()));
                  },
                  child: Text(
                    '\$50000',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0), // Add some space between the balance and banners
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align text with other elements
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to income page
                      Navigator.push(context, MaterialPageRoute(builder: (context) => IncomeScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green, // Income banner color
                        borderRadius: BorderRadius.circular(20.0), // Curved edges
                      ),
                      padding: EdgeInsets.all(12.0), // Adjust padding
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/in.png', // Image file path
                            width: 48.0, // Adjust image size
                            height: 48.0,
                            color: null, // Icon color
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Income',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0, // Increase font size
                                ),
                              ),
                              SizedBox(height: 6.0), // Adjust space
                              Text(
                                '\$2000', // Income amount
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0, // Increase font size
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0), // Add some space between the banners
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to expenses page
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ExpensesPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red, // Expenses banner color
                        borderRadius: BorderRadius.circular(20.0), // Curved edges
                      ),
                      padding: EdgeInsets.all(12.0), // Adjust padding
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/out.png', // Image file path
                            width: 48.0, // Adjust image size
                            height: 48.0,
                            color: null, // Icon color
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Expenses',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0, // Increase font size
                                ),
                              ),
                              SizedBox(height: 6.0), // Adjust space
                              Text(
                                '\$1000', // Expenses amount
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0, // Increase font size
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0), // Add some space between the banners and the text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  'Week',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  'Month',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  'Year',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0), // Add some space between the text and the recent transactions
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle See All click
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Add the rest of your widgets here
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentUserUsername: currentUser?.displayName ?? currentUser?.email ?? '', // Use display name if available, otherwise use email
      ),
    );
  }
}




