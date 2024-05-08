import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _name = '';
  String _email = '';

  // Getter for name
  String get name => _name;

  // Getter for email
  String get email => _email;

  // Method to update user data
  void updateUserData(String name, String email) {
    _name = name;
    _email = email;
    notifyListeners(); // Notify listeners that data has changed
  }
}
