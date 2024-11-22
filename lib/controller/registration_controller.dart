import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/home_screen.dart';

class RegistrationController extends ChangeNotifier {
  bool isRegLoading = false;
  bool isLoginLoading = false;

  Future<void> createUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isRegLoading = true;
      notifyListeners();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential != null) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful! Please login.')),
        );
      }
      isRegLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      isRegLoading = false;
      notifyListeners();
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The password provided is too weak.')),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The account already exists for that email.')),
        );
      }
    } catch (e) {
      isRegLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isLoginLoading = true;
      notifyListeners();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DiscoverScreen(),
          ),
        );
      }
      isLoginLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      isLoginLoading = false;
      notifyListeners();
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user found for that email.')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wrong password provided for that user.')),
        );
      }
    }
  }
}
