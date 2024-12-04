import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vallet_parking/utils/constants/assetsConstants.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/home_screen.dart';

class Statusscreen extends StatefulWidget {
  const Statusscreen({super.key, this.isSucces = true});
  final bool isSucces;

  @override
  State<Statusscreen> createState() => _StatusscreenState();
}

class _StatusscreenState extends State<Statusscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then(
      (value) => widget.isSucces
          ? Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => DiscoverScreen(),
              ),
              (route) => false,
            )
          : Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.scaffoldBackgroundColor,
        body: widget.isSucces
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                        height: 200, width: 200, Animationconstants.Success),
                    Text(
                      'Parking Success',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                        height: 200, width: 200, Animationconstants.failed),
                    Text(
                      'Incorrect code',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )
                  ],
                ),
              ));
  }
}
