import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: StringStyles.subHeadingStyle()),
          Text(
            "View All",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
