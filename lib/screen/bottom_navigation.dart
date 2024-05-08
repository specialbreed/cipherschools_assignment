import 'package:cipherschools_assignment/bottom/profile.dart';
import 'package:flutter/material.dart';
import 'add_expense_screen.dart';

class BottomNavigation extends StatelessWidget {
  final String currentUserUsername; // Add a field to store the current user's username

  // Constructor to receive the current user's username
  const BottomNavigation({required this.currentUserUsername});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Transactions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Budget',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.blue, // Color for selected items
      unselectedItemColor: Colors.grey, // Color for unselected items
      selectedLabelStyle: TextStyle(color: Colors.blue), // Text style for selected item
      unselectedLabelStyle: TextStyle(color: Colors.grey), // Text style for unselected item
      onTap: (int index) {
        if (index == 2) { // Check if the "Add" icon is clicked
          // Navigate to add expense screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpenseScreen()),
          );
        } else if (index == 4) { // Check if the "Profile" icon is clicked
          // Navigate to profile screen and pass the current user's username
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage(username: currentUserUsername)),
          );
        }
      },
    );
  }
}
