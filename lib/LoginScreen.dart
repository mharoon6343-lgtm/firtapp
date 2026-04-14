import 'package:flutter/material.dart';
import 'package:restaurant_app/SignupScreen.dart';
import 'package:restaurant_app/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> getdatabylogin() async {
    var result = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: emailController.text.trim())
        .get();
    if (result.docs.isNotEmpty) {
      var userData = result.docs.first.data();

      if (userData['password'] == passwordController.text.trim()) {
        print("Login Success");
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        print("Wrong Password");
      }
    } else {
      print("User not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 50),
            Image.asset("assets/Fast food.png", height: 160),
            SizedBox(height: 20),
            Text(
              "Deliver Favorite Food",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 35),
            Text(
              "Login To Your Account",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 30),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email or Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Or",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              "Continue With",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff1877F2)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook, color: Color(0xff1877F2)),
                        SizedBox(width: 8),
                        Text("Facebook"),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffDB4437)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.g_mobiledata,
                            color: Color(0xffDB4437), size: 30),
                        SizedBox(width: 5),
                        Text("Google"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                // Navigate to HomeScreen on login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignupScreen()),
                );
              },
              child: Text(
                "Don't Have Account?",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
