// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// class QrController extends ChangeNotifier {
//   Future<void> scanQR() async {
//     String codeScanResult = 'Unknown Error'; // Default fallback value
//     try {
//       codeScanResult = await FlutterBarcodeScanner.scanBarcode(
//         '#FF0000', // Color for the scan line
//         'Cancel', // Text for the cancel button
//         true, // Show the flash button
//         ScanMode.QR, // Specify the scan mode
//       );
//       log('Scanned QR Code: $codeScanResult');
//     } on PlatformException catch (e) {
//       log('PlatformException: ${e.message}');
//       codeScanResult = 'Failed to get platform version.';
//     } catch (e) {
//       log('Unexpected error: $e');
//       codeScanResult = 'An unexpected error occurred.';
//     }
//     notifyListeners();
//   }
// }
