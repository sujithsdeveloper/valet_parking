import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vallet_parking/utils/constants/assetsConstants.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/otherScreens/verficationScreen.dart';
import 'package:vallet_parking/widgets/global_widgets/MapSection.dart';
import 'package:vallet_parking/widgets/global_widgets/buttonWidget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen(
      {super.key,
      required this.title,
      required this.index,
      required this.location});
  final String title;
  final String location;
  final int index;

  Future<void> _launchGoogleMaps(
      String startLocation, String endLocation) async {
    final Uri googleMapsUrl = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&origin=$startLocation&destination=$endLocation');
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'Could not open Google Maps';
    }
  }

  Future<String> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return 'Location services are disabled';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return 'Location permissions are denied';
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
    return '${position.latitude}, ${position.longitude}';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('parking_place').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final parkingPlace = snapshot.data?.docs.reversed.toList() ?? [];
        if (parkingPlace.isEmpty) {
          return const Center(child: Text('No parking places found.'));
        }

        final data = parkingPlace[index];

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: Stack(
            children: [
              MapSection(location: location),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
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
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(data['image'] ?? ''),
                              ),
                            ),
                          ),
                          title: Text(data['parking_place'] ?? 'N/A'),
                          subtitle: Text(data['location'] ?? 'N/A'),
                          trailing: const Icon(Icons.star, color: Colors.amber),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
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
                                children: [
                                  const Text('YOUR LOCATION'),
                                  const SizedBox(height: 8),
                                  Text('4822 Main Street'),
                                  const SizedBox(height: 32),
                                  const Text('YOUR DESTINATION'),
                                  const SizedBox(height: 8),
                                  Text(data['location'] ?? 'N/A'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        ButtonWidget(
                          label: 'Ride Now',
                          onTap: () async {
                            String currentLocation =
                                await _getCurrentLocation();

                            _launchGoogleMaps(
                                currentLocation, data['location'] ?? '');
                          },
                          width: 350,
                        ),
                        const SizedBox(height: 20),
                        ButtonWidget(
                          label: 'Reached Location',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerificationScreen(
                                          amountPerHour: data['price_per_hour'],
                                          code: data['code'].toString(),
                                        )));
                          },
                          width: 350,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
