import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallet_parking/controller/editProfileController.dart';
import 'package:vallet_parking/main.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/utils/functions/validations.dart';
import 'package:vallet_parking/widgets/global_widgets/textfeildWidget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<Editprofilecontroller>()
                            .pickImage(context: context);
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: ColorConstants.primaryColor,
                        backgroundImage: context
                                    .watch<Editprofilecontroller>()
                                    .file !=
                                null
                            ? FileImage(
                                context.watch<Editprofilecontroller>().file!)
                            : null,
                        child: context.watch<Editprofilecontroller>().file ==
                                null
                            ? Icon(Icons.edit, color: Colors.white, size: 16)
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            TextfeildWidget(
              controller: _nameController,
              label: 'Enter your name',
              validation: (p0) => Validations.validateName(p0),
            ),
            SizedBox(height: 16),
            Text(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            TextfeildWidget(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                label: 'Enter your email',
                validation: (p0) => Validations.validateEmail(p0)),
            SizedBox(height: 16),
            TextfeildWidget(
                keyboardType: TextInputType.number,
                controller: _phoneController,
                label: 'Enter your Phone Number',
                validation: (p0) => Validations.validatePhoneNumber(p0)),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your phone number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () {},
                child: Text("Save Changes"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
