import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skin_analyzed_project/pre-login.dart';
import 'package:skin_analyzed_project/login.dart';

String? globalUserId;
String? globalUsername;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
