import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_analyzed_project/recentSkinHistory.dart';
import 'package:skin_analyzed_project/service/database.dart';
import 'package:skin_analyzed_project/main.dart';

class Home extends StatefulWidget {
  final String username;
  final String id;

  const Home({required this.username, required this.id});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DatabaseMethods dbService = DatabaseMethods();
  final String id = globalUserId ?? 'Null';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Scrollable Column for static content
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LOGO
                      Image.asset(
                        'assets/images/logo.png',
                        width: 150,
                        height: 100,
                      ),

                      const SizedBox(height: 20),
                      // History Title
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'History',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              // Flexible container for StreamBuilder with independent scrolling
              Expanded(
                flex: 2,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: dbService.getHistoryDetails(widget.id),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot<Map<String, dynamic>> ds =
                            snapshot.data!.docs[index];
                        String skinImg = ds.data()?['skinDiseaseImg'] ??
                            'assets/default.jpg';
                        bool isNetworkImage = skinImg.startsWith('http');

                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 15, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 50),
                                child: Row(
                                  children: [
                                    Text(
                                      ds.data()?['dateSkinAnalyzed'] ??
                                          '01/01/2024',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    IconButton(
                                      icon:
                                          Icon(Icons.delete, color: Colors.red),
                                      onPressed: () {
                                        showDeleteConfirmationDialog(ds.id);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.black,
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: 330,
                                  child: Row(
                                    children: [
                                      isNetworkImage
                                          ? Image.network(skinImg,
                                              width: 120,
                                              height: 150,
                                              fit: BoxFit.cover)
                                          : Image.asset(skinImg,
                                              width: 120,
                                              height: 150,
                                              fit: BoxFit.cover),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Result:",
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: const Color.fromARGB(
                                                  255, 205, 186, 128),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            ds.data()?['skinDisease'] ??
                                                'Unknown Disease',
                                            style: GoogleFonts.poppins(
                                              fontSize: 11,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Selected Product:",
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: const Color.fromARGB(
                                                  255, 205, 186, 128),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 142),
                                            child: Text(
                                              ds.data()?['productName'] ??
                                                  'Unknown Product',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                              softWrap: true,
                                            ),
                                          ),
                                          const SizedBox(height: 30),
                                          SizedBox(
                                            height: 22,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        RecentSkinHistory(
                                                            historyID: ds.id),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 205, 186, 128),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                    left: Radius.circular(20),
                                                    right: Radius.circular(20),
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                'VIEW MORE',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
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
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDeleteConfirmationDialog(String documentId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this history item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                deleteHistory(documentId); // Delete the history item
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void deleteHistory(String documentId) async {
    try {
      await dbService.deleteHistory(id, documentId);
      showToast(message: "History deleted successfully");
    } catch (e) {
      showToast(message: "Error deleting history: $e");
    }
  }

  void showToast({required String message}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
