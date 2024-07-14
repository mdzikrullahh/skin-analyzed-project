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

class blackheadProduct extends StatefulWidget {
  final String imageText;
  final String productCategory;
  final String imageUrl;
  const blackheadProduct(
      {Key? key,
      required this.imageText,
      required this.productCategory,
      required this.imageUrl})
      : super(key: key);

  @override
  State<blackheadProduct> createState() => _blackheadProductState();
}

class _blackheadProductState extends State<blackheadProduct> {
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
                          if (widget.productCategory == 'Retinoids') ...[
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
                                        'assets/images/BLACKWHITEHEAD/Retinoids.jpg',
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
                                                maxWidth: 170),
                                            child: Text(
                                              "The Ordinary Retinol 0.5% in Squalane 30ml",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                              softWrap: true,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 170),
                                            child: Text(
                                              "Improve skin texture and reduce blackheads with The Ordinary Retinol 0.5% in Squalane, a retinoid formula that promotes cell turnover and unclogs pores.",
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
                                                    "assets/images/BLACKWHITEHEAD/Retinoids.jpg";
                                                String productName =
                                                    "The Ordinary Retinol 0.5% in Squalane 30ml";
                                                String productDesc =
                                                    "Improve skin texture and reduce blackheads with The Ordinary Retinol 0.5% in Squalane, a retinoid formula that promotes cell turnover and unclogs pores.";
                                                String productUse =
                                                    "Apply a small amount to clean, dry skin in the evening. Start with 2-3 times per week and increase frequency as tolerated.";

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
                                        'assets/images/BLACKWHITEHEAD/Benzoyl_Peroxide.jpg',
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
                                                maxWidth: 170),
                                            child: Text(
                                              "Clean & Clear Persa-Gel",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                              softWrap: true,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 170),
                                            child: Text(
                                              "Fight blackheads and whiteheads with Clean & Clear Persa-Gel, a benzoyl peroxide treatment that effectively unclogs pores and reduces acne..",
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
                                                    "assets/images/BLACKWHITEHEAD/Benzoyl_Peroxide.jpg";
                                                String productName =
                                                    "Clean & Clear Persa-Gel";
                                                String productDesc =
                                                    "Fight blackheads and whiteheads with Clean & Clear Persa-Gel, a benzoyl peroxide treatment that effectively unclogs pores and reduces acne.";
                                                String productUse =
                                                    "Apply a thin layer to affected areas once or twice daily after cleansing. Start with lower concentrations if you have sensitive skin.";

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
                          //else if Blackheads & Whitehead
                          else if (widget.productCategory ==
                              'Salicylic Acid') ...[
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
                                        'assets/images/BLACKWHITEHEAD/Salicylic_Acid.jpg',
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
                                              "Paula's Choice Skin Perfecting 2% BHA Liquid Exfoliant",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                              softWrap: true,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 170),
                                            child: Text(
                                              "Exfoliate and clear pores with Paula's Choice 2% BHA Liquid Exfoliant, a salicylic acid treatment that effectively targets blackheads and whiteheads for smoother skin.",
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
                                                    "assets/images/BLACKWHITEHEAD/Salicylic_Acid.jpg";
                                                String productName =
                                                    "Paula's Choice Skin Perfecting 2% BHA Liquid Exfoliant";
                                                String productDesc =
                                                    "Exfoliate and clear pores with Paula's Choice 2% BHA Liquid Exfoliant, a salicylic acid treatment that effectively targets blackheads and whiteheads for smoother skin.";
                                                String productUse =
                                                    "Apply a small amount to a cotton pad and sweep over clean, dry skin. Start with once daily and gradually increase to twice daily if needed.";

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
                          //else if ⁠Tiny Bumps
                          else if (widget.productCategory == 'Charcoal') ...[
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
                                        'assets/images/BLACKWHITEHEAD/Charcoal.jpg',
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
                                              "Biore Charcoal Pore Cleanser",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 170),
                                            child: Text(
                                              "Deep cleanse your pores with Biore Charcoal Pore Cleanser, which uses natural charcoal to draw out impurities and combat blackheads.",
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
                                                    "assets/images/BLACKWHITEHEAD/Charcoal.jpg";
                                                String productName =
                                                    "Biore Charcoal Pore Cleanser";
                                                String productDesc =
                                                    "Deep cleanse your pores with Biore Charcoal Pore Cleanser, which uses natural charcoal to draw out impurities and combat blackheads.";
                                                String productUse =
                                                    "Massage onto damp skin, focusing on areas prone to blackheads. Rinse thoroughly with water.";

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
