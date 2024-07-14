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

class miliaProduct extends StatefulWidget {
  final String imageText;
  final String productCategory;
  final String imageUrl;
  const miliaProduct(
      {Key? key,
      required this.imageText,
      required this.productCategory,
      required this.imageUrl})
      : super(key: key);

  @override
  State<miliaProduct> createState() => _miliaProductState();
}

class _miliaProductState extends State<miliaProduct> {
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
                          if (widget.productCategory == 'Glycolic Acid') ...[
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
                                        'assets/images/MILIA/1_Glycolic_Acid.jpg',
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Loreal Paris Glycolic Bright Dark Circle Eye Serum",
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Refresh and exfoliate your skin with Mario Badescu Glycolic Acid Toner, a gentle solution that helps minimize milia and improve overall skin clarity.",
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
                                                    "assets/images/MILIA/1_Glycolic_Acid.jpg";
                                                String productName =
                                                    "Loreal Paris Glycolic Bright Dark Circle Eye Serum";
                                                String productDesc =
                                                    "Refresh and exfoliate your skin with Mario Badescu Glycolic Acid Toner, a gentle solution that helps minimize milia and improve overall skin clarity.";
                                                String productUse =
                                                    "Apply a small amount to the under-eye area and gently pat until absorbed. Use nightly or as directed";
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
                                        'assets/images/MILIA/2_Glycolic_Acid.jpg',
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Mario Badescu Glycolic Acid Toner",
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Illuminate and smooth the under-eye area with L'Oreal Paris Glycolic Bright Serum, featuring glycolic acid to help reduce milia and brighten dark circles.",
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
                                                    "assets/images/MILIA/2_Glycolic_Acid.jpg";
                                                String productName =
                                                    "Mario Badescu Glycolic Acid Toner";
                                                String productDesc =
                                                    "Illuminate and smooth the under-eye area with L'Oreal Paris Glycolic Bright Serum, featuring glycolic acid to help reduce milia and brighten dark circles.";
                                                String productUse =
                                                    "Apply to clean skin using a cotton ball or pad, avoiding the eye area. Use 2-3 times per week initially, increasing frequency as tolerated.";
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
                          else if (widget.productCategory == 'Lactic Acid') ...[
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
                                        'assets/images/MILIA/1_Lactic_Acid.jpg',
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Sunday Riley Good Genes All-In-One Lactic Acid Treatment",
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Reveal smoother, brighter skin with Sunday Riley Good Genes, an all-in-one lactic acid treatment that gently exfoliates to help reduce the appearance of milia and improve skin texture.",
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
                                                    "assets/images/MILIA/1_Lactic_Acid.jpg";
                                                String productName =
                                                    "Sunday Riley Good Genes All-In-One Lactic Acid Treatment";
                                                String productDesc =
                                                    "Reveal smoother, brighter skin with Sunday Riley Good Genes, an all-in-one lactic acid treatment that gently exfoliates to help reduce the appearance of milia and improve skin texture.";
                                                String productUse =
                                                    "Apply a small amount to clean, dry skin. Use it in the evening and start with 1-2 times per week. Gradually increase frequency as tolerated, up to every other night or nightly.";
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
                                        'assets/images/MILIA/2_Lactic_Acid.jpg',
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "The Ordinary Products",
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Achieve clear, radiant skin with The Ordinary's lactic acid products, designed to gently exfoliate and minimize the appearance of milia for a refined complexion.",
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
                                                    "assets/images/MILIA/2_Lactic_Acid.jpg";
                                                String productName =
                                                    "The Ordinary Products";
                                                String productDesc =
                                                    "Achieve clear, radiant skin with The Ordinary's lactic acid products, designed to gently exfoliate and minimize the appearance of milia for a refined complexion.";
                                                String productUse =
                                                    "Follow the specific product instructions. Generally, apply to clean skin in the evening. Start with lower concentrations if you have sensitive skin and increase frequency as tolerated.";
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
                                        'assets/images/MILIA/1_Salicylic_Acid.jpg',
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "IT Cosmetics Bye Bye Breakout 2% Salicylic Acid Acne Treatment Serum",
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Combat milia and breakouts with IT Cosmetics Bye Bye Breakout Serum, a 2% salicylic acid treatment that unclogs pores and promotes clearer, smoother skin.",
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
                                                    "assets/images/MILIA/1_Salicylic_Acid.jpg";
                                                String productName =
                                                    "IT Cosmetics Bye Bye Breakout 2% Salicylic Acid Acne Treatment Serum";
                                                String productDesc =
                                                    "Combat milia and breakouts with IT Cosmetics Bye Bye Breakout Serum, a 2% salicylic acid treatment that unclogs pores and promotes clearer, smoother skin.";
                                                String productUse =
                                                    "Apply a thin layer to clean, dry skin once or twice daily, focusing on areas prone to milia. Follow with moisturizer.";
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
                                        'assets/images/MILIA/2_Salicylic_Acid.jpg',
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Murad Acne Control Clarifying Cleanser",
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Keep your skin clear and free of milia with Murad Acne Control Clarifying Cleanser, a salicylic acid-infused formula that deeply cleanses and exfoliates.",
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
                                                    "assets/images/MILIA/2_Salicylic_Acid.jpg";
                                                String productName =
                                                    "Murad Acne Control Clarifying Cleanser";
                                                String productDesc =
                                                    "Keep your skin clear and free of milia with Murad Acne Control Clarifying Cleanser, a salicylic acid-infused formula that deeply cleanses and exfoliates.";
                                                String productUse =
                                                    "Use as a daily cleanser. Apply to damp skin, massage gently, and rinse thoroughly. Use morning and evening.";
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
                          else if (widget.productCategory == 'Retinol') ...[
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
                                        'assets/images/MILIA/1_Retinoids.jpg',
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "RoC Retinol Correxion Deep Wrinkle Night Cream",
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Target fine lines and milia with RoC Retinol Correxion Night Cream, a powerful retinoid formula that promotes cell turnover and smooths skin texture while you sleep.",
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
                                                    "assets/images/MILIA/1_Retinoids.jpg";
                                                String productName =
                                                    "RoC Retinol Correxion Deep Wrinkle Night Cream";
                                                String productDesc =
                                                    "Target fine lines and milia with RoC Retinol Correxion Night Cream, a powerful retinoid formula that promotes cell turnover and smooths skin texture while you sleep.";
                                                String productUse =
                                                    "Apply a pea-sized amount to clean, dry skin at night. Start with 2-3 times per week and gradually increase as your skin adjusts to nightly use.";
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
                                        'assets/images/MILIA/2_Retinoids.jpg',
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Eye Cream - The INKEY List _ Sephora",
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Keep your skin clear and free of milia with Murad Acne Control Clarifying Cleanser, a salicylic acid-infused formula that deeply cleanses and exfoliates.",
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
                                                    "assets/images/MILIA/2_Retinoids.jpg";
                                                String productName =
                                                    "Eye Cream - The INKEY List Sephora (Retinols)";
                                                String productDesc =
                                                    "Keep your skin clear and free of milia with  Eye Cream - The INKEY List _ Sephora, a salicylic acid-infused formula that deeply cleanses and exfoliates.";
                                                String productUse =
                                                    "Use a small amount and apply gently around the orbital bone, avoiding direct contact with the eyes. Use nightly or as directed.";
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
                                        'assets/images/MILIA/3_Retinoids.jpg',
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Some By Mi; Retinol Intense Advanced Triple Action Eye Cream",
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
                                              maxWidth: 175,
                                            ),
                                            child: Text(
                                              "Smooth and firm the skin around your eyes with Some By Mi Retinol Intense Eye Cream, a potent retinol formula that helps reduce milia and fine lines.",
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
                                                    "assets/images/MILIA/3_Retinoids.jpg";
                                                String productName =
                                                    "Some By Mi; Retinol Intense Advanced Triple Action Eye Cream";
                                                String productDesc =
                                                    "Smooth and firm the skin around your eyes with Some By Mi Retinol Intense Eye Cream, a potent retinol formula that helps reduce milia and fine lines.";
                                                String productUse =
                                                    "Apply a small amount to the under-eye area and gently pat until absorbed. Use nightly or as directed.";
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
              const SizedBox(height: 30),
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
