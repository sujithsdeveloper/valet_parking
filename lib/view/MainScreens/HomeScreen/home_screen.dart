import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:vallet_parking/controller/homescreen_controller.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/utils/data/appDatas.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/homeScreen_items/bestparking_screen.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/homeScreen_items/nearby_parkingScree.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/otherScreens/navigationScreen.dart';
import 'package:vallet_parking/view/appBars/appBars.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/best_parking_container.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/bottomSheetWidget.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/homeDrawer.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/parking_card.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/section_tile.dart';
import 'package:vallet_parking/widgets/global_widgets/textfeildWidget.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final proWatch = context.watch<HomescreenController>();
    final proRead = context.read<HomescreenController>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (proWatch.currentIndex != 0) {
          proRead.onBottomNavTap(0);
        } else {
          Navigator.of(context).maybePop();
        }
      },
      child: Scaffold(
        body: AppDatas.screenList[proWatch.currentIndex],
        bottomNavigationBar: SlidingClippedNavBar(
          barItems: [
            BarItem(title: 'Discover', icon: Icons.explore),
            BarItem(title: 'Search', icon: Icons.search),
            BarItem(title: 'Notification', icon: Icons.notifications),
            BarItem(title: 'Profile', icon: Icons.person),
          ],
          selectedIndex: proWatch.currentIndex,
          onButtonPressed: (index) {
            proRead.onBottomNavTap(index);
          },
          activeColor: ColorConstants.primaryColor,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final proRead = context.read<HomescreenController>();
    final searchController = TextEditingController();

    return Scaffold(
      drawer: const HomeDrawer(),
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: homeAppbar(proRead),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('parking_place')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ],
              ));
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final parkingPlace = snapshot.data?.docs.reversed.toList() ?? [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextfeildWidget(
                          controller: searchController,
                          label: 'Search...',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: const Icon(Icons.tune),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SectionTitle(
                  title: "Best Parking",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BestparkingScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                      (index) {
                        final data = parkingPlace[index];
                        return BestParkingContainer(
                          coordinate: data['location'] ?? '',
                          name: data['parking_place'] ?? '',
                          price: data['price_per_hour'] ?? '',
                          url: data['image'] ?? '',
                          onTap: () {
                            parckingCardSheet(
                              location: data['location'] ?? '',
                              name: data['parking_place'] ?? '',
                              price: data['price_per_hour'] ?? '',
                              image: data['image'] ?? '',
                              rating: data['rating']?.toString() ?? '',
                              slots: data['number_of_slots'] ?? '',
                              context: context,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavigationScreen(
                                      index: index,
                                      title: data['parking_place'] ?? '',
                                      location: data['location'] ?? '',
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SectionTitle(
                  title: "Nearby You",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NearbyParkingscreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: ParkingCard(
                        name: "Blue Way City Parking",
                        address: "428 RR Apache New York",
                        price: "\$5.50/hour",
                        rating: 4.8,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
