import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:skin_analyzed_project/skin-result.dart';
import 'package:skin_analyzed_project/main.dart';

class ScanFace extends StatefulWidget {
  const ScanFace({super.key});

  @override
  State<ScanFace> createState() => _ScanFaceState();
}

class _ScanFaceState extends State<ScanFace> {
  File? _selectedImage;
  final String? username = globalUsername;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //LOGO
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 100,
                ),

                const SizedBox(
                  height: 20,
                ),

                //Text
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      // Welcome Text
                      Text(
                        'Welcome Back, ${username}!',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Upload your face image ',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 21,
                        ),
                      ),
                      Text(
                        'to get skin analysis',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 21,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                //Image
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 300,
                    height: 310,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 1, // Border width
                      ),
                      image: const DecorationImage(
                        image:
                            AssetImage('assets/images/face.png'), // Image asset
                        fit: BoxFit.cover, // Image fit
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 50,
                    right: 50,
                    bottom: 50,
                  ),
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        _pickImageFromGallery();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        'UPLOAD FACE SKIN',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                //button
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return; // Check if returnedImage is null

    File imageFile = File(returnedImage.path);

    // Show loading modal dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from being dismissed
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Upload the image to Firebase Storage
      String imagePath =
          'user_images/${DateTime.now().millisecondsSinceEpoch}.png';
      final ref = FirebaseStorage.instance.ref().child(imagePath);
      await ref.putFile(imageFile);

      // Get the URL of the uploaded image
      String imageUrl = await ref.getDownloadURL();

      // Dismiss the loading dialog
      Navigator.pop(context);

      // Set the image locally
      setState(() {
        _selectedImage = imageFile;
      });

      // Navigate and pass both the local image file and the URL
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              skinResult(selectedImage: _selectedImage!, imageUrl: imageUrl),
        ),
      );
    } catch (e) {
      // Dismiss the loading dialog in case of error
      Navigator.pop(context);
      print("Failed to upload image: $e");
    }
  }
}
