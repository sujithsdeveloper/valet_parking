import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/otherScreens/paymentPage.dart';
import 'package:vallet_parking/widgets/global_widgets/buttonWidget.dart';
import 'package:vallet_parking/widgets/global_widgets/customSnackbar.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({
    super.key,
    this.fromVerificationScreen = false,
    this.amountPerHour = '40',
  });
  final bool fromVerificationScreen;
  final String amountPerHour;

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  void initState() {
    super.initState();

    if (widget.fromVerificationScreen) {
      final collectionRef = FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      var date = DateFormat('MMM dd').format(DateTime.now());
      var time = DateFormat('hh:mm aaa').format(DateTime.now());
      collectionRef.set({'date': date, 'time': time}, SetOptions(merge: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    final userRef = FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: userRef.get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text(
                'Error fetching data',
                style: TextStyle(color: Colors.red, fontSize: 16),
              );
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Text(
                'No parking data found',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              );
            }

            var data = snapshot.data!;
            var date = data['date'] ?? 'Unknown Date';
            var time = data['time'] ?? 'Unknown Time';

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You parked at $date',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  time,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(height: 30),
                ButtonWidget(
                  label: 'Checkout Now',
                  onTap: () async {
                    var endTime =
                        DateFormat('hh:mm aaa').format(DateTime.now());

                    try {
                      DateTime checkInTime =
                          DateFormat('hh:mm aaa').parse(time);
                      DateTime checkOutTime =
                          DateFormat('hh:mm aaa').parse(endTime);

                      Duration duration = checkOutTime.difference(checkInTime);
                      double totalHours = duration.inMinutes / 60;

                      await userRef.update({
                        'isParked': false,
                        'totalHours': totalHours.toStringAsFixed(2),
                        'endTime': endTime,
                      });

                      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
                        title: 'Checkout successful!',
                      ));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                                parkedTime: checkInTime,
                                checkOutTime: checkOutTime,
                                totalHours: totalHours,
                                amountPerHour:
                                    double.parse(widget.amountPerHour)),
                          ));
                    } catch (e) {
                      log('Error: $e');
                      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
                          title: 'Error calculating parking time'));
                    }
                  },
                  width: 200,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
