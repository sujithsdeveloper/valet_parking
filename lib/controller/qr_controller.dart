

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QrController extends ChangeNotifier {
//   ScanResult? scanResult;
//    var _aspectTolerance = 0.00;
//   var _numberOfCameras = 0;
//   var _selectedCamera = -1;
//   var _useAutoFocus = true;
//   var _autoEnableFlash = false;
//    static final _possibleFormats = BarcodeFormat.values.toList()
//     ..removeWhere((e) => e == BarcodeFormat.unknown);
//   List<BarcodeFormat> selectedFormats = [..._possibleFormats];

// Future<void> scan() async {
//     final _flashOnController = TextEditingController(text: 'Flash on');
//   final _flashOffController = TextEditingController(text: 'Flash off');
//   final _cancelController = TextEditingController(text: 'Cancel');
//       try {
//       final result = await BarcodeScanner.scan(
//         options: ScanOptions(
//           strings: {
//             'cancel': _cancelController.text,
//             'flash_on': _flashOnController.text,
//             'flash_off': _flashOffController.text,
//           },
//           restrictFormat: selectedFormats,
//           useCamera: _selectedCamera,
//           autoEnableFlash: _autoEnableFlash,
//           android: AndroidOptions(
//             aspectTolerance: _aspectTolerance,
//             useAutoFocus: _useAutoFocus,
//           ),
//         ),
//       );
//     scanResult = result;
//     } on PlatformException catch (e) {
//     scanResult = ScanResult(
//           rawContent: e.code == BarcodeScanner.cameraAccessDenied
//               ? 'The user did not grant the camera permission!'
//               : 'Unknown error: $e',
//         );
//         notifyListeners();
//     }
// }

}
