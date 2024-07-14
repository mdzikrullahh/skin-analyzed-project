import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_analyzed_project/service/database.dart';
import 'package:skin_analyzed_project/main.dart';

class RecentSkinHistory extends StatefulWidget {
  final String historyID;

  const RecentSkinHistory({required this.historyID});

  @override
  State<RecentSkinHistory> createState() => _RecentSkinHistoryState();
}

class _RecentSkinHistoryState extends State<RecentSkinHistory> {
  final DatabaseMethods dbService = DatabaseMethods();
  final String id = globalUserId ?? 'Null';
  Map<String, dynamic>? historyItem;

  @override
  void initState() {
    super.initState();
    fetchHistoryItem();
  }

  void fetchHistoryItem() async {
    Map<String, dynamic>? item =
        await dbService.getHistoryById(id, widget.historyID);
    setState(() {
      historyItem = item;
    });
  }

  void showFeedbackDialog(BuildContext context) {
    final _feedbackController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Give Feedback', style: GoogleFonts.poppins()),
          content: TextField(
            controller: _feedbackController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter your feedback',
              hintStyle: GoogleFonts.poppins(),
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: GoogleFonts.poppins()),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle feedback submission
                final feedback = _feedbackController.text;
                if (feedback.isNotEmpty) {
                  // Submit feedback to Firestore or perform any other actions
                  FirebaseFirestore.instance
                      .collection('feedback')
                      .add({
                        'userId': id,
                        'historyId': widget.historyID,
                        'feedback': feedback,
                        'timestamp': Timestamp.now(),
                      })
                      .then((value) => print('Feedback Submitted'))
                      .catchError((error) =>
                          print('Failed to submit feedback: $error'));

                  Navigator.of(context).pop();
                }
              },
              child: Text('Submit', style: GoogleFonts.poppins()),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(
          //           'assets/images/history-bg.png'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 35,
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // LOGO
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset(
                                'assets/images/logo.png',
                                width: 150,
                                height: 100,
                              ),
                            ),

                            const SizedBox(height: 20),
                            // History Title
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Past Analysis',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                    ),
                                  ),
                                  historyItem != null
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 5),
                                          child: Text(
                                            historyItem!['dateSkinAnalyzed'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),

                            if (historyItem != null) ...[
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        historyItem!['skinDiseaseImg'],
                                        width: 235,
                                        height: 155,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        historyItem!['skinDisease'],
                                        style: GoogleFonts.hanuman(
                                          fontSize: 18,
                                          color: Colors.red[500],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                color: Color(0xFFEDE4D8),
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Selected Product",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.asset(
                                            historyItem!['productImage'],
                                            width: 155,
                                            height: 155,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(height: 30),
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 300),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  historyItem!['productName'],
                                                  style: GoogleFonts.hanuman(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                  ),
                                                  softWrap: true,
                                                ),
                                                const SizedBox(height: 20),
                                                Text(
                                                  "Category ",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.red[400],
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  softWrap: true,
                                                ),
                                                Text(
                                                  historyItem![
                                                      'productCategory'],
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.justify,
                                                  softWrap: true,
                                                ),
                                                const SizedBox(height: 20),
                                                Text(
                                                  "About ",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.red[400],
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  softWrap: true,
                                                ),
                                                Text(
                                                  historyItem!['productDesc'],
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.justify,
                                                  softWrap: true,
                                                ),
                                                const SizedBox(height: 20),
                                                Text(
                                                  "How to Use ",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.red[400],
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.justify,
                                                ),
                                                Text(
                                                  historyItem!['productUse'] ??
                                                      "Data not available, please refer other sources",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                  ),
                                                  softWrap: true,
                                                ),
                                                const SizedBox(height: 20),
                                                Text(
                                                  "Available Location ",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.red[400],
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  softWrap: true,
                                                ),
                                                Text(
                                                  "Guardian, Watson, Sephora, Sasa",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                  ),
                                                  softWrap: true,
                                                ),
                                                const SizedBox(height: 30),
                                                Center(
                                                  child: SizedBox(
                                                    width: 180,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        showFeedbackDialog(
                                                            context);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.black,
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'GIVE FEEDBACK',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 30),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ] else ...[
                              Center(
                                child: CircularProgressIndicator(),
                              )
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
