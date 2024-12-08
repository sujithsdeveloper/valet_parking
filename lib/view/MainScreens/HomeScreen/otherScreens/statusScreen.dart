import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vallet_parking/utils/constants/assetsConstants.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/otherScreens/timer_screen.dart';
import 'package:vallet_parking/widgets/global_widgets/customSnackbar.dart';

class Statusscreen extends StatefulWidget {
  const Statusscreen({super.key, this.isSucces = true, required this.amountPerHour,});
  final bool isSucces;
final String amountPerHour;

  @override
  State<Statusscreen> createState() => _StatusscreenState();
}

class _StatusscreenState extends State<Statusscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then(
      (value) async {
        if (widget.isSucces) {
          final userRef = FirebaseFirestore.instance
              .collection('user')
              .doc(FirebaseAuth.instance.currentUser!.uid);

          try {
            await userRef.update({'isParked': true});
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
                title: 'Internal problem..couldnt update right now..'));
            log('Error updating isParked field: $e');
          }

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => TimerScreen(
                fromVerificationScreen: true,
                amountPerHour: widget.amountPerHour,
          

              ),
            ),
            (route) => false,
          );
        } else {
          Navigator.pop(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.scaffoldBackgroundColor,
        body: widget.isSucces
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                        height: 200, width: 200, Animationconstants.Success),
                    Text(
                      'Parking Success',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                        height: 200, width: 200, Animationconstants.failed),
                    Text(
                      'Incorrect code',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )
                  ],
                ),
              ));
  }
}
