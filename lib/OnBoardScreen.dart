import 'package:flutter/material.dart';
import 'package:restaurant_app/SignupScreen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/Holding_Burger.png",
                  height: 220,
                ),
                SizedBox(height: 30),
                Text("Enjoy Restaurant Quality Meals\nat Home",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffE53935),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 80),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [Color(0xffE53935), Color(0xffC62828)],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text("Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
