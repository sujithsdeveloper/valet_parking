import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code_field/flutter_verification_code_field.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/otherScreens/statusScreen.dart';
import 'package:vallet_parking/widgets/global_widgets/buttonWidget.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({
    super.key,
   
   required this.code, required this.amountPerHour,
  });
  final String code;
  final String amountPerHour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code'),
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

                  if (value == code) {
                    log('Success: Code matched');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Statusscreen(
                            amountPerHour: amountPerHour
,
isSucces: true,

                         
                          ),
                        ));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Statusscreen(
                            amountPerHour: amountPerHour,
                           
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
