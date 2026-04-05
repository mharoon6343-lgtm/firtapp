import 'package:flutter/material.dart';
import 'package:restaurant_app/AdminSignup.dart';
import 'package:restaurant_app/AdminDashboard.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 50),
            Image.asset("assets/Fast food.png",
              height: 160,
            ),
            SizedBox(height: 10),
            Text("Waves Of Food",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 25),
            Text("Login To Your \nAdmin Dashboard",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            SizedBox(height: 30),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: isPasswordHidden,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordHidden
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Or",
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10),
            Text("Continue With",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
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
                            color: Color(0xffDB4437),
                            size: 30),
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
                String email = emailController.text;
                String password = passwordController.text;
                print(email);
                print(password);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AdminDashboard(),
                  ),
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
                  child: Text("Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AdminSignup()),
                );
              },
              child: Text("Don't Have Account?",
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
