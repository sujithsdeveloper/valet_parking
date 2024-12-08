import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/home_screen.dart';
import 'package:vallet_parking/widgets/global_widgets/customSnackbar.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({
    super.key,
    required this.parkedTime,
    required this.checkOutTime,
    required this.totalHours,
    required this.amountPerHour,
  });

  final DateTime parkedTime;
  final DateTime checkOutTime;
  final double totalHours;
  final double amountPerHour;

  @override
  Widget build(BuildContext context) {
    double totalAmount = totalHours * amountPerHour;

    if (totalAmount < amountPerHour) {
      totalAmount = amountPerHour;
    }
var CheckoutTime=DateFormat('hhh:mm aaa').format(checkOutTime);
var CheckInTime=DateFormat('hhh:mm aaa').format(parkedTime);
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Parked Time: $CheckInTime',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              'Checkout Time: $CheckoutTime',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Hours: ${totalHours.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              'Amount Per Hour: ₹${amountPerHour.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Amount to Pay: ₹${totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ₹${totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(customSnackbar(title: 'Payment Success'));
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiscoverScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  height: 80,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Proceed To Pay',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
