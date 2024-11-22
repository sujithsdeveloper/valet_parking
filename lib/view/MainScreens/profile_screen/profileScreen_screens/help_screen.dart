import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Text(label),
      ),
    );
  }
}
