import 'package:flutter/material.dart';
import 'package:restaurant_app/AdminLogin.dart';

class AdminSplashScreen extends StatefulWidget {
  const AdminSplashScreen({super.key});

  @override
  State<AdminSplashScreen> createState() => _AdminSplashScreenState();
}

class _AdminSplashScreenState extends State<AdminSplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AdminLogin(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Fast food.png",
              height: 220,
            ),
            SizedBox(height: 30),
            Text("Waves Of Food",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text("Admin Dashboard",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
