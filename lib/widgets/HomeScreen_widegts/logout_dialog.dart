import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/view/Registration_Screens/login_screen/login_screen.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      title: Text('Logout'),
      content: Text("Goodbye, Hope to see you back soon."),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (route) => false,
              );
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            )),
      ],
    );
  }
}
