import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';

class ParkingCard extends StatelessWidget {
  final String name;
  final String address;
  final String price;
  final double rating;

  const ParkingCard({
    required this.name,
    required this.address,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          height: 98,
          width: 98,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.pexels.com/photos/1004409/pexels-photo-1004409.jpeg?auto=compress&cs=tinysrgb&w=600')),
            color: ColorConstants.containerColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(address),
            Text(
              '$price',
              style:
                 StringStyles.priceStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
