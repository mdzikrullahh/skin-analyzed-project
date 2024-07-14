import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:random_string/random_string.dart';
import 'package:skin_analyzed_project/home.dart';
import 'package:skin_analyzed_project/login.dart';
import 'package:skin_analyzed_project/service/database.dart';
import 'package:skin_analyzed_project/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:skin_analyzed_project/toast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  //text controller
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Initialize Firebase in the initState method
    Firebase.initializeApp();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _birthController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 180,
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an Account?',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        ' Log in Here',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                //Username input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' USERNAME',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start, // Align text to the left
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              child: TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '',
                                  fillColor:
                                      const Color.fromRGBO(237, 228, 216, 1),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                //email input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' EMAIL',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start, // Align text to the left
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '',
                                  fillColor:
                                      const Color.fromRGBO(237, 228, 216, 1),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                //password input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' PASSWORD',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start, // Align text to the left
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              child: TextField(
                                obscureText: true,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  // hintText: 'Password',
                                  fillColor:
                                      const Color.fromRGBO(237, 228, 216, 1),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 30),

                //Birth of Date input
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Text(
                //         ' DATE OF BIRTH',
                //         style: TextStyle(
                //           color: Colors.black87,
                //           fontSize: 14,
                //         ),
                //         textAlign: TextAlign.start, // Align text to the left
                //       ),
                //       const SizedBox(height: 5),
                //       SizedBox(
                //         width: 300,
                //         child: Column(
                //           children: [
                //             TextField(
                //               controller: _birthController,
                //               decoration: InputDecoration(
                //                 border: InputBorder.none,
                //                 hintText: '',
                //                 fillColor:
                //                     const Color.fromRGBO(237, 228, 216, 1),
                //                 filled: true,
                //                 enabledBorder: OutlineInputBorder(
                //                   borderSide:
                //                       const BorderSide(color: Colors.grey),
                //                   borderRadius: BorderRadius.circular(12),
                //                 ),
                //                 focusedBorder: OutlineInputBorder(
                //                   borderSide: const BorderSide(
                //                       color: Colors.deepPurple),
                //                   borderRadius: BorderRadius.circular(12),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                const SizedBox(height: 30),
                //sign - in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: _signUp,
                    // onTap: () async {
                    //   String id = randomAlphaNumeric(10);

                    //   Map<String, dynamic> userInfoMap = {
                    //     "Username": _usernameController.text,
                    //     "Email": _emailController.text,
                    //     "Password": _passwordController.text,
                    //     "BirthOfDate": _birthController.text,
                    //   };
                    //   await DatabaseMethods()
                    //       .addUserDetails(userInfoMap, id)
                    //       .then((value) {
                    //     Fluttertoast.showToast(
                    //         msg: "Your Account Have Been Craeted!",
                    //         toastLength: Toast.LENGTH_SHORT,
                    //         gravity: ToastGravity.BOTTOM,
                    //         timeInSecForIosWeb: 1,
                    //         backgroundColor: Colors.black,
                    //         textColor: Colors.white,
                    //         fontSize: 16.0);
                    //   });
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (BuildContext context) {
                    //         return const LoginPage();
                    //       },
                    //     ),
                    //   );
                    // },
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String birthdate = "01/01/01";

    // Sign up the user with email and password
    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      // Show success message
      showToast(message: "User is successfully created");

      // Retrieve the UID of the authenticated user
      String uid = user.uid;

      // Construct the user information map
      Map<String, dynamic> userInfoMap = {
        "Username": username,
        "Email": email,
        "birthdate": birthdate,
      };

      // Add the user details to the UserSkinAi collection using the UID as the document ID
      await DatabaseMethods().addUserDetails(userInfoMap, uid);

      // Navigate to the login page
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const LoginPage();
          },
        ),
      );
    } else {
      // Show error message
      showToast(message: "Some error happened");
    }
  }
}
