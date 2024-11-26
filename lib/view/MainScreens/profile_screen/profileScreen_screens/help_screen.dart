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
        title: Text(label),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.help,
              color: ColorConstants.primaryColor,
            ),
            title: Text('Help'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.connect_without_contact_rounded,
              color: ColorConstants.primaryColor,
            ),
            title: Text('Contact us'),
          ),
        ],
      ),
    );
  }
}
