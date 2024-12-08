import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Crudoperationcontroller extends ChangeNotifier {
  Future<void> updateTime({
    required String startTime,
    required String endTime,
    required String totalTime,
    required String date,
  }) async {
    final userRef = FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('history')
        .doc();

    Map<String, dynamic> data = {
      'startTime': startTime,
      'endTime': endTime,
      'totalTime': totalTime,
      'date': date,
    };

    try {
      await userRef.set(data);
      log('History successfully added to Firestore');
    } catch (e) {
      log('Error adding to history: $e');
    }
  }
}
