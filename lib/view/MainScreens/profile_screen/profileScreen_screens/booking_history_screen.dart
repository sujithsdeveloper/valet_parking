import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';
import 'package:vallet_parking/utils/styles/animation_styles.dart';
import 'package:vallet_parking/view/MainScreens/profile_screen/profileScreen_screens/booking.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(label, style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .collection('history')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final history = snapshot.data?.docs.reversed.toList();

            return ListView.builder(
              itemCount: history?.length ?? 0,
              itemBuilder: (context, index) {
                final doc = history![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Booking(
                              placeName: doc['parking_place'],
                              totalTime: doc['totalTime'],
                              startTime: doc['startTime'],
                              endTime: doc['endTime'],
                              price: doc['amount'],
                              location: doc['location'],
                              pricePerHour: doc['price_per_hour'],
                              image: doc['image'],
                              noOfSlots: doc['number_of_slots'],
                              rating: doc['rating'],
                              date: doc['date']),
                        ));
                  },
                  child: ListTile(
                    leading: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.grey,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(doc['image']))),
                    ),
                    title: Text(
                      'Parking Name: ${doc['parking_place']}',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        'Location: ${doc['location']}\nTime: ${doc['totalTime']}'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '₹${doc['amount']}',
                          style: StringStyles.priceStyle(),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: AnimationStyles.loadingIndicator(),
            );
          } else {
            return AnimationStyles.loadingIndicator();
          }
        },
      ),
    );
  }
}
