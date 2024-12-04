import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code_field/flutter_verification_code_field.dart';
import 'package:provider/provider.dart';
import 'package:vallet_parking/controller/qr_controller.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/otherScreens/statusScreen.dart';
import 'package:vallet_parking/widgets/global_widgets/buttonWidget.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key, required this.code});

  final int code;

  @override
  Widget build(BuildContext context) {
    final proWatch = context.watch<QrController>();
    final proRead = context.read<QrController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR'),
        centerTitle: true,
        backgroundColor: ColorConstants.scaffoldBackgroundColor,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Text(
              'Code',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Text(
              'Enter the six-digit code from the \nparking station',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            VerificationCodeField(
              length: 5,
              onFilled: (value) {
                try {
                  int enteredCode = int.parse(value);

                  if (enteredCode == code) {
                    log('Success: Code matched');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Statusscreen(),
                        ));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Statusscreen(
                            isSucces: false,
                          ),
                        ));
                  }
                } catch (e) {
                  log('Error: Invalid input or Firestore data');
                }
              },
              size: Size(30, 60),
              spaceBetween: 16,
              matchingPattern: RegExp(r'^\d+$'),
            ),
            SizedBox(height: 50),
            ButtonWidget(label: 'Verify', onTap: () {}, width: 200),
          ],
        ),
      ),
    );
  }
}
