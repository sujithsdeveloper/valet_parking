import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/utils/data/appDatas.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.person, size: 50, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              "Sujith",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "sujithsdeveloper@gmail.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                title: Text(AppDatas.ProfileScreenContens[index]['label']),
                leading: AppDatas.ProfileScreenContens[index]['icon'],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AppDatas.ProfileScreenContens[index]['screen'],
                    ),
                  );
                },
              ),
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: AppDatas.ProfileScreenContens.length,
            ),
          ],
        ),
      ),
    );
  }
}
