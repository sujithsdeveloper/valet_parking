import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: Text(
          'No Booking History',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
