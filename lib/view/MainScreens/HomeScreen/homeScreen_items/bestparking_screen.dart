import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('parking_place')
              .snapshots(),
          builder: (context, snapshot) {
            final parkingPlace = snapshot.data!.docs.reversed.toList();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView.builder(
                itemCount: parkingPlace.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7),
                itemBuilder: (context, index) {
                  final data = parkingPlace[index];
                  return BestParkingContainer(
                      coordinate: data['location'],
                      name: data['parking_place'],
                      price: data['price_per_hour'],
                      url: data['image'],
                      onTap: () {
                        parckingCardSheet(
                          location: data['location'],
                          name: data['parking_place'],
                          price: data['price_per_hour'],
                          image: data['image'],
                          rating: data['rating'],
                          slots: data['number_of_slots'],
                          context: context,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavigationScreen(
                                    location: data['location'],
                                    index: index,
                                    title: data['parking_place'],
                                  ),
                                ));
                          },
                        );
                      });
                },
              ),
            );
          }),
    );
  }
}
