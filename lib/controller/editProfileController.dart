import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vallet_parking/widgets/global_widgets/customSnackbar.dart';

class Editprofilecontroller extends ChangeNotifier {
  File? file;
  pickImage({required BuildContext context}) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No image selected')));
    }
  }

    bool isNameUpdating = false;
  Future<void> upDateName(
      {required String name, required BuildContext context}) async {
    isNameUpdating = true;
    notifyListeners();
    final ref = FirebaseFirestore.instance
        .collection('admins')
        .doc(FirebaseAuth.instance.currentUser?.uid);
    await ref.update({'name': name});
    ScaffoldMessenger.of(context)
        .showSnackBar(customSnackbar(title: 'Name Updated succesfully'));
    isNameUpdating = false;
    notifyListeners();
  }
}
