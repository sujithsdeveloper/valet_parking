import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';

class BestParkingContainer extends StatelessWidget {
  const BestParkingContainer({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffE6E4E0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.pexels.com/photos/457418/pexels-photo-457418.jpeg?auto=compress&cs=tinysrgb&w=600'))),
              ),
            ),
            SizedBox(height: 20),
            Text('Big Town Parking'),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                ),
                Text(
                  '3718 W 25TH New York',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '\$4.6',
                  style: TextStyle(
                      color: ColorConstants.primaryColor, fontSize: 20),
                ),
                Text('/Hour'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
