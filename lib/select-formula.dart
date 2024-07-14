import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:skin_analyzed_project/acneProduct.dart';
import 'package:skin_analyzed_project/blackheadProduct.dart';
import 'package:skin_analyzed_project/miliaProduct.dart';
import 'package:skin_analyzed_project/main.dart';
import 'package:skin_analyzed_project/Widgets/widget_tree.dart';

class selectFormulaPage extends StatefulWidget {
  final String? imageText;
  final String imageUrl;
  const selectFormulaPage(
      {Key? key, required this.imageText, required this.imageUrl})
      : super(key: key);
  @override
  State<selectFormulaPage> createState() => _selectFormulaPageState();
}

class _selectFormulaPageState extends State<selectFormulaPage> {
  String? productName;
  @override
  Widget build(BuildContext context) {
    String imageTextFinal = widget.imageText ?? 'Null';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 35,
                        ),
                        onPressed: () => Navigator.of(context)
                            .pop(), // This will pop the current page off the navigation stack
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.home,
                            size: 35,
                          ),
                          onPressed: () {
                            showDialogBackHome();
                          }),
                    ],
                  ),
                ),
              ),
              Padding(
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
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Formula',
                            style: GoogleFonts.poppins(
                              // fontWeight: FontWeight.w800,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            'Recommendation',
                            style: GoogleFonts.poppins(
                              // fontWeight: FontWeight.w800,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "which recommendation do you prefer?", // Display the result
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Result:", // Add a non-null assertion operator (!) to assert that _result is not null
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${widget.imageText}", // Add a non-null assertion operator (!) to assert that _result is not null
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),

                          //if acne
                          if (widget.imageText == 'Acne') ...[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _acne("Benzoyl Peroxide", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Salicylic Acid',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _acne("Topical Retinoids", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Topical Retinoids',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _acne(
                                        "Topical Antibiotics", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Topical Antibiotics',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     top: 10,
                            //     left: 20,
                            //     right: 20,
                            //   ),
                            //   child: SizedBox(
                            //     width: 300,
                            //     child: ElevatedButton(
                            //       onPressed: () {
                            //         _acne("Hormonal Therapies", imageTextFinal);
                            //       },
                            //       style: ElevatedButton.styleFrom(
                            //         backgroundColor: Colors.black,
                            //         shape: const RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.zero,
                            //         ),
                            //       ),
                            //       child: Text(
                            //         'Hormonal Therapies',
                            //         style: GoogleFonts.poppins(
                            //           fontWeight: FontWeight.w500,
                            //           color: Colors.white,
                            //           fontSize: 18,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ]
                          //else if milia
                          else if (widget.imageText == 'Milia') ...[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _milia("Glycolic Acid", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Glycolic Acid',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _milia("Lactic Acid", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Lactic Acid',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _milia("Salicylic Acid", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Salicylic Acid',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _milia("Retinol", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Retinol',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                          //else if Blackheads & Whitehead
                          else if (widget.imageText ==
                              'Blackhead & Whitehead') ...[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _blackhead("Retinoids", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Retinoids',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _blackhead(
                                        "Salicylic Acid", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Salicylic Acid',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _blackhead(
                                        "Benzoyl Peroxide", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Benzoyl Peroxide',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _blackhead("Charcoal", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Charcoal',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                          //else if ⁠Tiny Bumps
                          else if (widget.imageText == 'Tiny Bumps') ...[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Tea Tree Oil',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    '⁠Glycolic Acid',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Hyaluronic Acid',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                          //else if Spots Pigmentation
                          else if (widget.imageText ==
                              'Spots Pigmentation') ...[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _blackhead(
                                        "Benzoyl Peroxide", imageTextFinal);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Vitamin C',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Alpha Arbutin',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 20,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: Text(
                                    'Retinoids',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
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

  void showDialogBackHome() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Return to Home'),
          content: Text(
              'Returning to the home page will clear your current skin analysis. Please make sure to save your recommended products first!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Back'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WidgetTree(
                      username: globalUsername ?? '',
                      id: globalUserId ?? '',
                    ),
                  ),
                );
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _acne(String productName, String imageText) async {
    String? _productName = productName;
    String? _imageText = imageText;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return acneProduct(
            imageText: _imageText,
            productCategory: _productName,
            imageUrl: widget.imageUrl,
          );
        },
      ),
    );
  }

  void _milia(String productName, String imageText) async {
    String? _productName = productName;
    String? _imageText = imageText;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return miliaProduct(
            imageText: _imageText,
            productCategory: _productName,
            imageUrl: widget.imageUrl,
          );
        },
      ),
    );
  }

  void _blackhead(String productName, String imageText) async {
    String? _productName = productName;
    String? _imageText = imageText;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return blackheadProduct(
            imageText: _imageText,
            productCategory: _productName,
            imageUrl: widget.imageUrl,
          );
        },
      ),
    );
  }
}
