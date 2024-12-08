import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vallet_parking/utils/constants/assetsConstants.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/home_screen.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/otherScreens/timer_screen.dart';
import 'package:vallet_parking/view/Registration_Screens/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((_) async {
      if (user != null) {
        final userRef = FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser!.uid);

        final userSnapshot = await userRef.get();

        if (userSnapshot.exists) {
          final isParked = userSnapshot.data()?['isParked'] as bool;

          if (isParked) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TimerScreen(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DiscoverScreen()),
            );
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              height: 200,
              Animationconstants.splashAnimation,
            ),
            const Text(
              'My Parking',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
