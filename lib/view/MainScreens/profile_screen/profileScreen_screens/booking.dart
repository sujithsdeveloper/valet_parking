import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';

class Booking extends StatelessWidget {
  const Booking(
      {super.key,
      required this.placeName,
      required this.totalTime,
      required this.startTime,
      required this.endTime,
      required this.price,
      required this.location,
      required this.pricePerHour,
      required this.image,
      required this.noOfSlots,
      required this.rating,
      required this.date});
  final String placeName;
  final String totalTime;
  final String startTime;
  final String endTime;
  final String date;
  final String price;
  final String location;
  final String pricePerHour;
  final String image;
  final String noOfSlots;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(placeName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                width: double.infinity,
                height: 200,
                image: NetworkImage(image)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  placeName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Text(
                  '₹$price',
                  style: StringStyles.priceStyle(),
                )
              ],
            ),
            SizedBox(height: 20),
            Text('Number of slots : $noOfSlots'),
            SizedBox(height: 20),
            Text('Parking Date: $date'),
            SizedBox(height: 20),
            Text('Parking Start time: $startTime'),
            SizedBox(
              height: 5,
            ),
            Text('Parking End time: $endTime'),
            SizedBox(
              height: 5,
            ),
            Text('Total time: $totalTime'),
            SizedBox(
              height: 20,
            ),
            Text('Location Coordinates : $location'),
          ],
        ),
      ),
    );
  }
}
