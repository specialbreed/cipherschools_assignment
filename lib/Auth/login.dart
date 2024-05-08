import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cipherschools_assignment/screen/home.dart'; // Import your home screen here
import 'package:provider/provider.dart';
import 'package:cipherschools_assignment/user_provider.dart'; // Import your UserProvider class

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Create FirebaseAuth instance
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false; // Flag to track loading state

  // Function to handle login logic
  Future<void> signIn(UserProvider userProvider) async {
    setState(() {
      isLoading = true; // Set loading state to true
    });

    try {
      // Perform login logic here
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      // After successful login, update user data in UserProvider
      userProvider.updateUserData(_auth.currentUser!.displayName ?? '', emailController.text);

      // Navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Replace HomePage() with your desired page
      );
    } catch (e) {
      print("Failed to sign in: $e");
    } finally {
      setState(() {
        isLoading = false; // Set loading state to false
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: isLoading ? null : () {
                signIn(Provider.of<UserProvider>(context, listen: false)); // Call signIn function with UserProvider instance
              }, // Disable button when loading
              child: isLoading
                  ? CircularProgressIndicator() // Show loading indicator when loading
                  : Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
