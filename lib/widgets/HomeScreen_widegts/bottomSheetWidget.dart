import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';
import 'package:vallet_parking/widgets/global_widgets/buttonWidget.dart';

Future<dynamic> parckingCardSheet({required BuildContext context,required Function() onTap}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Big Town Parking',
                      style: StringStyles.subHeadingStyle(),
                    ),
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
                    Text('20 slots available'),
                    AnimatedRatingStars(
                        starSize: 20,
                        initialRating: 4,
                        readOnly: true,
                        onChanged: (p0) {},
                        customFilledIcon: Icons.star,
                        customHalfFilledIcon: Icons.star_half_outlined,
                        customEmptyIcon: Icons.star_border_outlined),
                  ],
                ),
                Text(
                  '\$20.5',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 9,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: EdgeInsets.all(9),
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://images.pexels.com/photos/28468181/pexels-photo-28468181/free-photo-of-tesla-cybertruck-with-dog-and-crate-in-nature.jpeg?auto=compress&cs=tinysrgb&w=600')),
                    ),
                  ),
                ),
              ),
            ),
            ButtonWidget(
              width: double.infinity,
              label: 'Choose place',
              onTap: onTap,
            )
          ],
        ),
      ),
    ),
  );
}
