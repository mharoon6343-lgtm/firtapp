import 'package:flutter/material.dart';
import 'package:restaurant_app/AddMenu.dart';
import 'package:restaurant_app/AdminDashboard.dart';
import 'package:restaurant_app/AdminLogin.dart';
import 'package:restaurant_app/AdminProfile.dart';
import 'package:restaurant_app/AdminSignup.dart';
import 'package:restaurant_app/AdminSplashScreen.dart';
import 'package:restaurant_app/AllMenuItems.dart';
import 'package:restaurant_app/CartScreen.dart';
import 'package:restaurant_app/CongratsScreen.dart';
import 'package:restaurant_app/EditScreen.dart';
import 'package:restaurant_app/FoodDetails.dart';
import 'package:restaurant_app/HistoryScreen.dart';
import 'package:restaurant_app/HomeScreen.dart';
import 'package:restaurant_app/LocationScreen.dart';
import 'package:restaurant_app/LoginScreen.dart';
import 'package:restaurant_app/NewUserAccount.dart';
import 'package:restaurant_app/NotificationScreen.dart';
import 'package:restaurant_app/OutForDelivery.dart';
import 'package:restaurant_app/PendingOrders.dart';
import 'package:restaurant_app/Popular.dart';
import 'package:restaurant_app/ProfileScreen.dart';
import 'package:restaurant_app/SearchScreen.dart';
import 'package:restaurant_app/OnBoardScreen.dart';
import 'package:restaurant_app/SignupScreen.dart';
import 'package:restaurant_app/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const OnBoardScreen(),
    );
  }
}


