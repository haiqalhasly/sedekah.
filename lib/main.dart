import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sedekah/auth/auth.dart';
import 'package:sedekah/firebase_options.dart';
import 'package:sedekah/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthPage(), routes: {
      '/homePage': (context) => Homepage(),
    });
  }
}
