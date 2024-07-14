// import "package:flutter/material.dart";
// import "package:google_fonts/google_fonts.dart";

// class Home extends StatefulWidget {
//   final String username;
//   final String id;

//   const Home({Key? key, required this.username, required this.id})
//       : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late String globalUserId;
//   late String userName;

//   @override
//   void initState() {
//     super.initState();
//     globalUserId = widget.id;
//     userName = widget.username;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 30, top: 40),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //LOGO
//                 Image.asset(
//                   'assets/images/logo.png',
//                   width: 150,
//                   height: 100,
//                 ),

//                 const SizedBox(
//                   height: 20,
//                 ),

//                 //Text
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'hi {$userName} your face to get',
//                         style: GoogleFonts.poppins(
//                           // fontWeight: FontWeight.w800,
//                           fontSize: 26,
//                         ),
//                       ),
//                       Text(
//                         'your skin analysis',
//                         style: GoogleFonts.poppins(
//                           // fontWeight: FontWeight.w500,
//                           fontSize: 26,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 10),

//                 //Image
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Container(
//                     width: 300,
//                     height: 310,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.black, // Border color
//                         width: 1, // Border width
//                       ),
//                       image: const DecorationImage(
//                         image:
//                             AssetImage('assets/images/face.png'), // Image asset
//                         fit: BoxFit.cover, // Image fit
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 10,
//                     left: 50,
//                     right: 50,
//                     bottom: 50,
//                   ),
//                   child: SizedBox(
//                     width: 250,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         debugPrint('Clicked Scan Button');
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                       ),
//                       child: Text(
//                         'SCAN',
//                         style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 //button
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
