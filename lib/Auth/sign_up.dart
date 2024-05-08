import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cipherschools_assignment/Auth/login.dart';
import 'package:flutter/gestures.dart'; // Add this import for TapGestureRecognizer
import 'package:cipherschools_assignment/screen/home.dart';
import 'package:cipherschools_assignment/user_provider.dart'; // Import your UserProvider class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(SignUpScreen());
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Create FirebaseAuth instance
  bool agreedToTerms = false;
  bool isLoading = false; // Flag to track loading state
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Function to handle the sign-up logic
  Future<void> signUp(UserProvider userProvider) async {
    setState(() {
      isLoading = true; // Set loading state to true
    });

    try {
      // Perform sign-up logic here
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      // Update user data in UserProvider
      userProvider.updateUserData(nameController.text, emailController.text);

      // After successful sign-up, navigate to the home page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Replace HomePage() with your desired page
      );
    } catch (e) {
      print("Failed to sign up: $e");
    } finally {
      setState(() {
        isLoading = false; // Set loading state to false
      });
    }
  }

  // Function to navigate to the login screen
  void navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()), // Replace LoginScreen() with your login screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true, // Set to true to resize the body when the keyboard appears
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sign Up'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the previous screen
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      agreedToTerms = !agreedToTerms;
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: agreedToTerms,
                        onChanged: (value) {
                          setState(() {
                            agreedToTerms = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'By signing up you have agreed to Terms of Service and Privacy Policy',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: isLoading ? null : () {
                    signUp(Provider.of<UserProvider>(context, listen: false)); // Call signUp function with UserProvider instance
                  }, // Disable button when loading
                  child: isLoading
                      ? CircularProgressIndicator() // Show loading indicator when loading
                      : Text('Sign Up'),
                ),
                SizedBox(height: 30.0),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = navigateToLogin,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
