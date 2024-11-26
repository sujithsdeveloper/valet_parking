import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallet_parking/controller/editProfileController.dart';
import 'package:vallet_parking/controller/homescreen_controller.dart';
import 'package:vallet_parking/controller/qr_controller.dart';
import 'package:vallet_parking/controller/registration_controller.dart';
import 'package:vallet_parking/controller/widgetController.dart';
import 'package:vallet_parking/firebase_options.dart';
import 'package:vallet_parking/view/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomescreenController()),
        ChangeNotifierProvider(create: (context) => RegistrationController()),
        ChangeNotifierProvider(create: (context) => Widgetcontroller()),
        ChangeNotifierProvider(create: (context) => Editprofilecontroller()),
        ChangeNotifierProvider(create: (context) => QrController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
