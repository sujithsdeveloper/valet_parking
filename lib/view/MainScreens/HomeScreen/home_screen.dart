import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:vallet_parking/controller/homescreen_controller.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/utils/data/appDatas.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/homeScreen_items/bestparking_screen.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/homeScreen_items/nearby_parkingScree.dart';
import 'package:vallet_parking/view/MainScreens/HomeScreen/otherScreens/navigationScreen.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/best_parking_container.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/bottomSheetWidget.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/filter_button.dart';
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

class homeScreen extends StatelessWidget {
  const homeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final proWatch = context.watch<HomescreenController>();
    final proRead = context.read<HomescreenController>();
    final SearchController = TextEditingController();
    return Scaffold(
      drawer: const HomeDrawer(),
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Row(
              children: [
                Expanded(
                    child: TextfeildWidget(
                  controller: SearchController,
                  label: 'Search...',
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Icon(Icons.tune),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                AppDatas.homeFilterDatas.length,
                (index) => FilterButton(
                  index: index,
                  label: AppDatas.homeFilterDatas[index],
                  isSelected:
                      proWatch.filterCurrentIndex == index ? true : false,
                ),
              ),
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
                  ));
            },
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                (index) => BestParkingContainer(
                  onTap: () {
                    parckingCardSheet(
                      context: context,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationScreen(),
                            ));
                      },
                    );
                  },
                ),
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
                  ));
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
        ]),
      ),
    );
  }
}
