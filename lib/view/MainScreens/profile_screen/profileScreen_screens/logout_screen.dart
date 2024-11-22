import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/assetsConstants.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/logout_dialog.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Logout',
          style: StringStyles.appbarTitleStyle(),
        ),
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.center,
              child: Image(
                  height: 250, image: AssetImage(ImageConstants.logoutImage))),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => LogoutDialog(),
              );
            },
            child: Container(
              height: 50,
              width: 200,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Logout Now',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );
  }
}
