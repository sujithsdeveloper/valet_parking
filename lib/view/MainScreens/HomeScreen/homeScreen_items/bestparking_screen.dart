import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/otherScreens/navigationScreen.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/best_parking_container.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/bottomSheetWidget.dart';

class BestparkingScreen extends StatelessWidget {
  const BestparkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Best Parking',
          style: StringStyles.appbarTitleStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.7),
          itemBuilder: (context, index) => BestParkingContainer(onTap: () {
            parckingCardSheet(
              context: context,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationScreen(
                   
                      ),
                    ));
              },
            );
          }),
        ),
      ),
    );
  }
}
