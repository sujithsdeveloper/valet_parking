import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/home_screen.dart';
import 'package:vallet_parking/view/MainScreens/notification_screen/notification_screen.dart';
import 'package:vallet_parking/view/MainScreens/profile_screen/profileScreen_screens/booking_history_screen.dart';
import 'package:vallet_parking/view/MainScreens/profile_screen/profileScreen_screens/edit_profileScreen.dart';
import 'package:vallet_parking/view/MainScreens/profile_screen/profileScreen_screens/help_screen.dart';
import 'package:vallet_parking/view/MainScreens/profile_screen/profileScreen_screens/payment_method_screen.dart';
import 'package:vallet_parking/view/MainScreens/profile_screen/profile_screen.dart';
import 'package:vallet_parking/view/MainScreens/profile_screen/profileScreen_screens/settings_screen.dart';
import 'package:vallet_parking/view/MainScreens/search_screen.dart';

class AppDatas {
  static const List homeFilterDatas = [
    'Recomended',
    'Truck',
    'Car',
    'Bike',
    'Bicycle'
  ];

  static List screenList = [
    homeScreen(),
    SearchScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  static List ProfileScreenContens = [
    {
      'label': 'Edit Profile',
      'icon': Icon(Icons.edit, color: ColorConstants.primaryColor),
      'screen': EditProfileScreen(label: "Edit Profile")
    },
    {
      'label': 'Payment Methods',
      'icon': Icon(Icons.payment, color: ColorConstants.primaryColor),
      'screen': PaymentMethodScreen(
        label: 'Payment Methods',
      )
    },
    {
      'label': 'Booking History',
      'icon': Icon(Icons.history, color: ColorConstants.primaryColor),
      'screen': BookingHistoryScreen(
        label: 'Booking History',
      )
    },
    {
      'label': 'Settings',
      'icon': Icon(Icons.settings, color: ColorConstants.primaryColor),
      'screen': SettingsScreen(
        label: 'Settings',
      )
    },
    {
      'label': 'Help & Support',
      'icon': Icon(
        Icons.help,
        color: ColorConstants.primaryColor,
      ),
      'screen': HelpScreen(
        label: 'Help and Support',
      )
    },
  ];

  static List<Map<String, dynamic>> settingsData = [
    {
      'title': 'Account Settings',
      'icon': Icons.account_circle,
      'onTap': () {
        print('Account Settings tapped');
      }
    },
    {
      'title': 'Notification Settings',
      'icon': Icons.notifications,
      'onTap': () {
        print('Notification Settings tapped');
      }
    },
    {
      'title': 'Privacy Settings',
      'icon': Icons.lock,
      'onTap': () {
        print('Privacy Settings tapped');
      }
    },
    {
      'title': 'Language Settings',
      'icon': Icons.language,
      'onTap': () {
        print('Language Settings tapped');
      }
    },
    {
      'title': 'Theme Settings',
      'icon': Icons.brightness_6,
      'onTap': () {
        print('Theme Settings tapped');
      }
    },
    {
      'title': 'Log Out',
      'icon': Icons.logout,
      'onTap': () {
        print('Log Out tapped');
      }
    },
  ];
}
