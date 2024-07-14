import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skin_analyzed_project/service/database.dart';
import 'package:skin_analyzed_project/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:skin_analyzed_project/main.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();

  DatabaseMethods databaseMethods = DatabaseMethods();
  FirebaseAuthService authService = FirebaseAuthService();
  String userId = globalUserId ?? "Null";

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    DocumentSnapshot userSnapshot = await databaseMethods.getUserInfo(userId);
    if (userSnapshot.exists) {
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
      _usernameController.text = userData['Username'] ?? '';
      _emailController.text = userData['Email'] ?? '';
      _birthController.text = userData['birthdate'] ?? '';
    }
  }

  Future<void> updateUserProfile() async {
    if (_formKey.currentState!.validate()) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user is currently signed in.')),
        );
        return;
      }

      try {
        // Reauthenticate the user
        await authService.reauthenticateUser(
            user.email!, _passwordController.text);

        // Update email if it has changed
        if (_emailController.text != user.email) {
          await authService.verifyBeforeUpdateEmail(_emailController.text);
        }

        // Update password if it is not empty
        if (_passwordController.text.isNotEmpty) {
          await authService.updatePassword(_passwordController.text);
        }

        // Update Firestore data
        Map<String, dynamic> userInfoMap = {
          "Username": _usernameController.text,
          "Email": _emailController.text,
          "birthdate": _birthController.text,
        };

        await databaseMethods.updateUserDetails(userInfoMap, userId);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully!')),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating profile: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      buildTextField('USERNAME', _usernameController),
                      const SizedBox(height: 20),
                      buildTextField('EMAIL', _emailController),
                      const SizedBox(height: 20),
                      buildTextField('PASSWORD', _passwordController,
                          obscureText: true),
                      const SizedBox(height: 20),
                      buildTextField('DATE OF BIRTH', _birthController),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: updateUserProfile,
                        child: Container(
                          width: 250,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'UPDATE',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' $labelText',
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: Container(
              height: 46,
              child: TextFormField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: const Color.fromRGBO(237, 228, 216, 1),
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
