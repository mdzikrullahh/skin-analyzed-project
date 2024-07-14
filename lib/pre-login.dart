// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:skin_analyzed_project/Pages/Home.dart';
// import 'package:firebase_core/firebase_core.dart';

// class Prelogin extends StatefulWidget {
//   const Prelogin({Key? key}) : super(key: key);

//   @override
//   _PreloginState createState() => _PreloginState();
// }

// class _PreloginState extends State<Prelogin> {
//   @override
//   void initState() {
//     super.initState();
//     // Initialize Firebase in the initState method
//     Firebase.initializeApp();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             // If the user is logged in, navigate to Home screen
//             return Home();
//           } else {
//             // If the user is not logged in, navigate to Login screen
//             return LoginPage();
//           }
//         },
//       ),
//     );
//   }
// }
