import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("UserSkinAi")
        .doc(id)
        .set(userInfoMap);
  }

  // Future<Stream<QuerySnapshot>> getUserDetails() async {
  //   return await FirebaseFirestore.instance
  //       .collection("UserSkinAi")
  //       .doc(id)
  //       .snapshots();
  // }
  Future<Map<String, dynamic>?> getUserDetailsById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection("UserSkinAi").doc(id).get();

    if (snapshot.exists) {
      return snapshot.data();
    } else {
      return null; // Return null if the document doesn't exist
    }
  }

  Future<void> updateUserDetails(
      Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("UserSkinAi")
        .doc(id)
        .update(userInfoMap);
  }

  Future<DocumentSnapshot> getUserInfo(String id) async {
    return await FirebaseFirestore.instance
        .collection("UserSkinAi")
        .doc(id)
        .get();
  }

  // --------------------------- THIS IS PRODUCT ------------------------------------
  Future addSkinHistory(
      Map<String, dynamic> skinHistoryMap, String userId) async {
    return await FirebaseFirestore.instance
        .collection("UserSkinAi")
        .doc(userId)
        .collection("SkinHistory")
        .add(skinHistoryMap);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getHistoryDetails(String userId) {
    return FirebaseFirestore.instance
        .collection("UserSkinAi")
        .doc(userId)
        .collection("SkinHistory")
        .snapshots();
  }

  Future<void> deleteHistory(String userId, String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection("UserSkinAi")
          .doc(userId)
          .collection("SkinHistory")
          .doc(documentId)
          .delete();
      print("Selected history deleted successfully");
    } catch (e) {
      print("Error deleting history: $e");
    }
  }

  Future<Map<String, dynamic>?> getHistoryById(
      String userId, String historyId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection("UserSkinAi")
          .doc(userId)
          .collection("SkinHistory")
          .doc(historyId)
          .get();

      if (snapshot.exists) {
        return snapshot.data();
      } else {
        return null; // Return null if the document doesn't exist
      }
    } catch (e) {
      print("Error getting history by ID: $e");
      return null;
    }
  }
}
