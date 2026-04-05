import 'package:flutter/material.dart';
import 'package:restaurant_app/OnBoardScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnBoardScreen()),
        );
      }
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
            Text("Deliver Favorite Food",
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
