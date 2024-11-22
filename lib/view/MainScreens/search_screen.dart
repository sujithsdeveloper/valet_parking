import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/utils/data/appDatas.dart';
import 'package:vallet_parking/utils/styles/String_styles.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/best_parking_container.dart';
import 'package:vallet_parking/widgets/HomeScreen_widegts/filter_button.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        leadingWidth: 99,
        backgroundColor: ColorConstants.scaffoldBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 9),
          child: Text('Search', style: StringStyles.appbarTitleStyle()),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(Icons.tune),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                )
              ],
            ),
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
              5,
              (index) => BestParkingContainer(
                onTap: () {
                  
                },
              ),
            )),
          )
        ],
      ),
    );
  }
}
