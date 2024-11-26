import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/parking_card.dart';

class NearbyParkingscreen extends StatelessWidget {
  const NearbyParkingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Nearby Parking',
          style: StringStyles.appbarTitleStyle(),
        ),
      ),
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => ParkingCard(
              name: "Blue Way City Parking",
              address: "428 RR Apache New York",
              price: "\$5.50/hour",
              rating: 4.8,
            ),
          ),
        ),
      ),
    );
  }
}
