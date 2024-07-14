import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:skin_analyzed_project/select-formula.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:skin_analyzed_project/home.dart';
import 'package:skin_analyzed_project/profile.dart';
import 'package:skin_analyzed_project/scan.dart';
import 'package:skin_analyzed_project/main.dart';
import 'package:skin_analyzed_project/Widgets/widget_tree.dart';

class skinResult extends StatefulWidget {
  final File selectedImage;
  final String imageUrl;
  skinResult({Key? key, required this.selectedImage, required this.imageUrl})
      : super(key: key);

  @override
  State<skinResult> createState() => _skinResultState();
}

class _skinResultState extends State<skinResult> {
  bool _loading = true;
  late File _image;
  List? _result; // Added to store the result of the analysis
  final String? username = globalUsername;
  final String? id = globalUserId;

  String? _resultText;

  @override
  void initState() {
    super.initState();

    _image = widget.selectedImage;
    print("Selected image: $_image");
    _loading = true;
    loadModel().then((value) {
      setState(() {
        _loading = false;
        classifyImage(
            _image); // Classify the image as soon as the model is loaded
      });
    });
  }

  loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/ai/model_unquant.tflite",
        labels: "assets/ai/labels.txt",
      );
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  pickImage() async {
    classifyImage(_image);
  }

  classifyImage(File image) async {
    print("Classifying image: $image");
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2, // Adjust this according to your number of labels
      threshold: 0.1, // Lower threshold
      imageMean: 127.5,
      imageStd: 127.5,
    );
    // Assuming the result is in the first element of the output list
    if (output != null && output.isNotEmpty) {
      setState(() {
        _result = output;
        _resultText = output![0]['label'].split(' ').sublist(1).join(' ');
      });
    } else {
      setState(() {
        _result = ["No result"]; // Display a default message if no result
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // int _selectedIndex = 4;
    final List<Widget> _pages = [
      Home(
        username: username ?? '', // Provide a default value if username is null
        id: id ?? '', // Provide a default value if id is null
      ),
      ScanFace(),
      Profile(),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 40),
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
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Skin Analysis',
                        style: GoogleFonts.poppins(
                          // fontWeight: FontWeight.w800,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        "what skin do you have?", // Display the result
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                //Image
                // Show the image container if loading is false
                if (!_loading)
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 25, left: 10),
                        child: Container(
                          width: 300,
                          height: 310,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 1, // Border width
                            ),
                            image: DecorationImage(
                              image: FileImage(
                                  _image), // Use FileImage to load image
                              fit: BoxFit.cover, // Image fit
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      if (_result?.isNotEmpty ?? false)
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .start, // Align contents to the start (left) of the row
                          children: [
                            if (_result?.isNotEmpty ?? false)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 18, top: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Result:", // Add a non-null assertion operator (!) to assert that _result is not null
                                      style: GoogleFonts.poppins(
                                          fontSize: 23,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign
                                          .left, // Align text to the left
                                    ),
                                    Text(
                                      "${_result![0]['label'].split(' ').sublist(1).join(' ')}", // Add a non-null assertion operator (!) to assert that _result is not null
                                      style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        color: Colors.red,
                                      ),
                                      textAlign: TextAlign
                                          .left, // Align text to the left
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        )
                      else
                        const Text(
                          "No results found.",
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                    ],
                  ),
                // Show loading indicator if loading is true
                if (_loading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 25,
                    left: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(
                                  context); // Navigate back to the previous screen
                            },
                            icon: Icon(Icons.arrow_circle_left_rounded),
                          ),
                          Text('Back',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Next',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                              )),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => selectFormulaPage(
                                      imageText: _resultText,
                                      imageUrl: widget.imageUrl),
                                ),
                              );
                            },
                            icon: Icon(Icons.arrow_circle_right_rounded),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: NavigationBar(
      //   backgroundColor: Colors.black,
      //   destinations: const [
      //     NavigationDestination(icon: Icon(Icons.home), label: ''),
      //     NavigationDestination(icon: Icon(Icons.camera_enhance), label: ''),
      //     NavigationDestination(
      //         icon: Icon(Icons.account_circle_rounded), label: ''),
      //   ],
      //   selectedIndex: _selectedIndex,
      //   onDestinationSelected: (int value) {
      //     setState(() {
      //       currentPage = value;
      //     });
      //   },
      // ),
    );
  }
}
