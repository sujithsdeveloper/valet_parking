import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vallet_parking/utils/constants/assetsConstants.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/otherScreens/qr_screen.dart';
import 'package:vallet_parking/widgets/global_widgets/MapSection.dart';
import 'package:vallet_parking/widgets/global_widgets/buttonWidget.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Temporary debug color
      appBar: AppBar(
        title: const Text('Green Parking'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          MapSection(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      isThreeLine: true,
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://images.pexels.com/photos/1004409/pexels-photo-1004409.jpeg?auto=compress&cs=tinysrgb&w=600',
                            ),
                          ),
                        ),
                      ),
                      title: const Text('Green Star Parking'), // Debug title
                      subtitle: const Text('8643 RR Apache New York'),
                      trailing: const Icon(Icons.star, color: Colors.amber),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Icon(Icons.circle,
                                  color: Colors.orange, size: 16),
                              Lottie.asset(
                                Animationconstants.navAnimation,
                                height: 90,
                              ),
                              const Icon(Icons.circle,
                                  color: Colors.blue, size: 16),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('YOUR LOCATION'),
                              SizedBox(height: 8),
                              Text('4822 Main Street'),
                              SizedBox(height: 32),
                              Text('YOUR DESTINATION'),
                              SizedBox(height: 8),
                              Text('43828 W 33rd Street'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ButtonWidget(label: 'Ride Now', onTap: () {}, width: 350),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonWidget(
                        label: 'Reached Location',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QrScreen(),
                              ));
                        },
                        width: 350)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
