import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
}
