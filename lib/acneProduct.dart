import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:skin_analyzed_project/select-formula.dart';
import 'package:skin_analyzed_project/toast.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:skin_analyzed_project/home.dart';
import 'package:skin_analyzed_project/profile.dart';
import 'package:skin_analyzed_project/scan.dart';
import 'package:skin_analyzed_project/main.dart';
import 'package:skin_analyzed_project/Widgets/widget_tree.dart';
import 'package:skin_analyzed_project/service/database.dart';

class acneProduct extends StatefulWidget {
  final String imageText;
  final String productCategory;
  final String imageUrl;
  const acneProduct(
      {Key? key,
      required this.imageText,
      required this.productCategory,
      required this.imageUrl})
      : super(key: key);

  @override
  State<acneProduct> createState() => _acneProductState();
}

class _acneProductState extends State<acneProduct> {
  final String? id = globalUserId;

  @override
  Widget build(BuildContext context) {
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
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                    onPressed: () => Navigator.of(context)
                        .pop(), // This will pop the current page off the navigation stack
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 20,
                ),
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
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product',
                            style: GoogleFonts.poppins(
                              // fontWeight: FontWeight.w800,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            'Recommendations',
                            style: GoogleFonts.poppins(
                              // fontWeight: FontWeight.w800,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "for ${widget.productCategory}", // Display the result
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 40),
                          //if acne
                          if (widget.productCategory ==
                              'Topical Retinoids') ...[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                right: 15,
                                bottom: 5,
                              ),
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/ACNE/4.jpg',
                                        width: 100,
                                        height: 150,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                  maxWidth: 170),
                                              child: Text(
                                                "Differin Gel (Adapalene)",
                                                style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.5,
                                                ),
                                                softWrap: true,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 170),
                                            child: Text(
                                              "Transform your skin with Differin Gel, a potent topical retinoid (Adapalene) that speeds up cell turnover, unclogs pores, and diminishes acne, giving you a smoother, more radiant complexion.",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                              softWrap: true,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          SizedBox(
                                            height: 30,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                String productImage =
                                                    "assets/images/ACNE/4.jpg";
                                                String productName =
                                                    "Differin Gel (Adapalene)";
                                                String productDesc =
                                                    "Transform your skin with Differin Gel, a potent topical retinoid (Adapalene) that speeds up cell turnover, unclogs pores, and diminishes acne, giving you a smoother, more radiant complexion.";
                                                String productUse =
                                                    "Apply a pea-sized amount to the affected areas at night after cleansing. Start with a lower frequency to minimize irritation, then gradually increase to daily use";
                                                _saveRecord(
                                                    productImage,
                                                    widget.productCategory,
                                                    productName,
                                                    productDesc,
                                                    widget.imageText,
                                                    productUse);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                ),
                                              ),
                                              child: Text(
                                                'SAVE RECOMMENDATION',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]
                          //else if milia
                          else if (widget.productCategory ==
                              'Topical Antibiotics') ...[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                right: 15,
                                bottom: 5,
                              ),
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/ACNE/3.jpg',
                                        width: 100,
                                        height: 150,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 180),
                                            child: Text(
                                              "Clindamycin Phosphate Gel",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11.5,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 170),
                                            child: Text(
                                              "Fight acne-causing bacteria with Clindamycin Phosphate Gel, a topical antibiotic that helps reduce redness and swelling, promoting clearer, healthier skin.",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                              softWrap: true,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            height: 30,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                String productImage =
                                                    "assets/images/ACNE/3.jpg";
                                                String productName =
                                                    "Clindamycin Phosphate Gel";
                                                String productDesc =
                                                    "Fight acne-causing bacteria with Clindamycin Phosphate Gel, a topical antibiotic that helps reduce redness and swelling, promoting clearer, healthier skin.";
                                                String productUse =
                                                    "Apply a thin layer to clean, dry skin once or twice daily as directed by your healthcare provider.";
                                                _saveRecord(
                                                    productImage,
                                                    widget.productCategory,
                                                    productName,
                                                    productDesc,
                                                    widget.imageText,
                                                    productUse);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                ),
                                              ),
                                              child: Text(
                                                'SAVE RECOMMENDATION',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // ]
                            // else if (widget.productCategory ==
                            //     'Hormonal Therapies') ...[
                            //   Padding(
                            //     padding: const EdgeInsets.only(
                            //       top: 10,
                            //       right: 15,
                            //       bottom: 5,
                            //     ),
                            //     child: Card(
                            //       child: Container(
                            //         padding: const EdgeInsets.all(10.0),
                            //         width: double.infinity,
                            //         child: Row(
                            //           children: [
                            //             Image.asset(
                            //               'assets/images/ACNE/2.jpg',
                            //               width: 100,
                            //               height: 150,
                            //             ),
                            //             const SizedBox(width: 10),
                            //             Column(
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               children: [
                            //                 Text(
                            //                   "Clindamycin Phosphate Gel",
                            //                   style: GoogleFonts.poppins(
                            //                     color: Colors.black,
                            //                     fontWeight: FontWeight.bold,
                            //                     fontSize: 13,
                            //                   ),
                            //                 ),
                            //                 const SizedBox(height: 5),
                            //                 Container(
                            //                   constraints: const BoxConstraints(
                            //                       maxWidth: 200),
                            //                   child: Text(
                            //                     "Helps reduce acne by targeting and eliminating acne-causing bacteria on the skin.",
                            //                     style: GoogleFonts.poppins(
                            //                       color: Colors.black,
                            //                       fontSize: 10,
                            //                     ),
                            //                     softWrap: true,
                            //                   ),
                            //                 ),
                            //                 const SizedBox(height: 10),
                            //                 SizedBox(
                            //                   height: 30,
                            //                   child: ElevatedButton(
                            //                     onPressed: () {
                            //                       String productImage =
                            //                           "assets/images/ACNE/2.jpg";
                            //                       String productName =
                            //                           "Clindamycin Phosphate Gel";
                            //                       String productDesc =
                            //                           "Helps reduce acne by targeting and eliminating acne-causing bacteria on the skin.";
                            //                       String productUse =
                            //                           "Apply a thin layer to clean, dry skin once or twice daily as directed by your healthcare provider.";
                            //                       _saveRecord(
                            //                           productImage,
                            //                           widget.productCategory,
                            //                           productName,
                            //                           productDesc,
                            //                           widget.imageText);
                            //                     },
                            //                     style: ElevatedButton.styleFrom(
                            //                       backgroundColor: Colors.black,
                            //                       shape:
                            //                           const RoundedRectangleBorder(
                            //                         borderRadius:
                            //                             BorderRadius.zero,
                            //                       ),
                            //                     ),
                            //                     child: Text(
                            //                       'SAVE RECOMMENDATION',
                            //                       style: GoogleFonts.poppins(
                            //                         fontSize: 10,
                            //                         fontWeight: FontWeight.w500,
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                          ] else if (widget.productCategory ==
                              'Benzoyl Peroxide') ...[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                right: 15,
                                bottom: 5,
                              ),
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/ACNE/1.jpg',
                                        width: 95,
                                        height: 150,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 180),
                                            child: Text(
                                              "La Roche - Posay Effaclar Duo",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11.5,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 175),
                                            child: Text(
                                              "A powerful benzoyl peroxide treatment that targets acne at its source, reduces inflammation, and prevents future breakouts.",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                              softWrap: true,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            height: 30,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                String productImage =
                                                    "assets/images/ACNE/1.jpg";
                                                String productName =
                                                    "Clindamycin Phosphate Gel";
                                                String productDesc =
                                                    "A powerful benzoyl peroxide treatment that targets acne at its source, reduces inflammation, and prevents future breakouts.";
                                                String productUse =
                                                    "Apply a thin layer to the affected areas after cleansing, typically once or twice daily. Start with a lower concentration to assess tolerance, as it can be drying or irritating.";
                                                _saveRecord(
                                                    productImage,
                                                    widget.productCategory,
                                                    productName,
                                                    productDesc,
                                                    widget.imageText,
                                                    productUse);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                ),
                                              ),
                                              child: Text(
                                                'SAVE RECOMMENDATION',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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

  void _saveRecord(
    String productImage,
    String productCategory,
    String productName,
    String productDesc,
    String skinDisease,
    String productUse,
  ) async {
    //skin - product
    String _productImage = productImage;
    String _productCategory = productCategory;
    String _productName = productName;
    String _productDesc = productDesc;
    String _skinDisease = skinDisease;
    String _productUse = productUse;

    //id
    String? userID = globalUserId;

    //date
    DateTime now = DateTime.now();

    Map<String, dynamic> skinHistoryMap = {
      'userID': userID,
      'productImage': _productImage,
      'productCategory': _productCategory,
      'productName': _productName,
      'productDesc': _productDesc,
      'skinDisease': _skinDisease,
      'productUse': _productUse,
      'skinDiseaseImg': widget.imageUrl,
      'dateSkinAnalyzed': "${now.day}/${now.month}/${now.year}",
    };
    try {
      await DatabaseMethods()
          .addSkinHistory(skinHistoryMap, userID = userID ?? 'Null');
      showToast(message: "Skin Disease and selected Product has been saved");
      print('Record saved successfully');
    } catch (e) {
      print('Error saving record: $e');
    }
  }
}
