import 'package:flutter/material.dart';
import 'package:restaurant_app/HomeScreen.dart';

class CongratsScreen extends StatefulWidget {
  const CongratsScreen({super.key});

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 60),
            Text(
              "Congrats",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Your Order Placed",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -20,
                    left: -20,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -15,
                    right: -15,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -15,
                    left: -15,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Go Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
