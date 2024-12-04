import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';

class BestParkingContainer extends StatelessWidget {
  const BestParkingContainer({
    super.key,
    required this.onTap, required this.name, required this.price, required this.url, required this.coordinate,
  });
  final String name;
  final String price;
  final String url;

  final String coordinate;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                            url))),
              ),
            ),
            SizedBox(height: 20),
            Text(name),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                ),
                Text(
                  coordinate,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '₹$price',
                  style: StringStyles.priceStyle(),
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
