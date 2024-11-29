import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:vallet_parking/controller/qr_controller.dart';
import 'package:vallet_parking/utils/constants/assetsConstants.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/widgets/global_widgets/buttonWidget.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(height: 200, Animationconstants.QRAnimation),
            SizedBox(
              height: 50,
            ),
            ButtonWidget(
                label: 'Scan Now',
                onTap: () {
                  // proRead.QRread();
                },
                width: 200)
          ],
        ),
      ),
    );
  }
}
