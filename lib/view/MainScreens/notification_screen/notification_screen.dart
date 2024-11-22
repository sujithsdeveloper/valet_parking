import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Container(
              color: ColorConstants.scaffoldBackgroundColor,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: ColorConstants.primaryColor,
                  child: Icon(Icons.notifications, color: Colors.black),
                ),
                title: Text("Notification ${index + 1}"),
                subtitle: Text(
                    "This is the description of notification ${index + 1}."),
                trailing: Text(
                  "2h ago",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
