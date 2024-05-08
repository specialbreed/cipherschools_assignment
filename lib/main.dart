import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:hive/hive.dart'; // Import Hive package
import 'package:path_provider/path_provider.dart' as path_provider; // Import path_provider for getting the app directory
import 'screen/UI.dart';
import 'package:cipherschools_assignment/firebase_options.dart';
import 'package:cipherschools_assignment/user_provider.dart'; // Import your UserProvider class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Hive
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(), // Create an instance of UserProvider
      child: MaterialApp(
          home: SplashScreen()
      ), // Wrap your MaterialApp with the provider
    ),
  );
}
