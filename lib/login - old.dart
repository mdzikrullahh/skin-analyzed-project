// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:skin_analyzed_project/Widgets/widget_tree.dart';
// import 'package:skin_analyzed_project/home.dart';
// import 'package:skin_analyzed_project/service/database.dart';
// import 'package:skin_analyzed_project/register.dart';
// import 'package:skin_analyzed_project/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
// import 'package:skin_analyzed_project/toast.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final FirebaseAuthService _auth = FirebaseAuthService();
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   //text controller
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Initialize Firebase in the initState method
//     Firebase.initializeApp();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Color.fromRGBO(255, 246, 233, 1),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/images/logo.png',
//                   width: 200,
//                   height: 180,
//                 ),
//                 const Text(
//                   'Login',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 //not a member? register now
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Don\'t have an Account?',
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const RegisterPage()),
//                         );
//                       },
//                       child: const Text(
//                         ' Register Here',
//                         style: TextStyle(
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 30),

//                 //email input
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         ' EMAIL',
//                         style: TextStyle(
//                           color: Colors.black87,
//                           fontSize: 14,
//                         ),
//                         textAlign: TextAlign.start, // Align text to the left
//                       ),
//                       const SizedBox(height: 5),
//                       SizedBox(
//                         width: 300,
//                         child: Column(
//                           children: [
//                             TextField(
//                               controller: _emailController,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: '',
//                                 fillColor:
//                                     const Color.fromRGBO(237, 228, 216, 1),
//                                 filled: true,
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       const BorderSide(color: Colors.grey),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Colors.deepPurple),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 //password input
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         ' PASSWORD',
//                         style: TextStyle(
//                           color: Colors.black87,
//                           fontSize: 14,
//                         ),
//                         textAlign: TextAlign.start, // Align text to the left
//                       ),
//                       const SizedBox(height: 5),
//                       SizedBox(
//                         width: 300,
//                         child: Column(
//                           children: [
//                             TextField(
//                               obscureText: true,
//                               controller: _passwordController,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 // hintText: 'Password',
//                                 fillColor:
//                                     const Color.fromRGBO(237, 228, 216, 1),
//                                 filled: true,
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       const BorderSide(color: Colors.grey),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Colors.deepPurple),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 30),
//                 //sign - in button
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: GestureDetector(
//                     onTap: _signIn,
//                     // onTap: () async {
//                     //   Navigator.of(context).push(
//                     //     MaterialPageRoute(
//                     //       builder: (BuildContext context) {
//                     //         return const WidgetTree();
//                     //       },
//                     //     ),
//                     //   );
//                     // },
//                     child: Container(
//                       width: 300,
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'LOGIN',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _signIn() async {
//     String email = _emailController.text;
//     String password = _passwordController.text;
//     String username = "";
//     String id = "";

//     User? user = await _auth.signInWithEmailAndPassword(email, password);

//     if (user != null) {
//       showToast(message: "User is successfully signed in");

//       // Retrieve the user details from Firestore
//       Map<String, dynamic>? userDetails =
//           await DatabaseMethods().getUserDetailsById(user.uid);

//       String? username = userDetails != null ? userDetails['Username'] : null;

//       // Pass the username and ID as arguments when navigating
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (BuildContext context) {
//             // Pass the username and ID to the LoginPage
//             return WidgetTree(
//               username: username ?? '', // Use displayName if available
//               id: user.uid,
//             );
//           },
//         ),
//       );
//     } else {
//       showToast(message: "Some error occurred");
//     }
//   }
// }
