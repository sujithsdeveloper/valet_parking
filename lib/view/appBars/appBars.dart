import 'package:flutter/material.dart';
import 'package:vallet_parking/controller/homescreen_controller.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';

AppBar homeAppbar(HomescreenController proRead) {
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Home",
        style: StringStyles.appbarTitleStyle(),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {
              proRead.onProfileTap(3);
            },
            child: CircleAvatar(
              backgroundImage: const NetworkImage(
                  'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              backgroundColor: Colors.grey.shade300,
            ),
          ),
        ),
      ],
    );
  }