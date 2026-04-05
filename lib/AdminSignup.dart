import 'package:flutter/material.dart';
import 'package:restaurant_app/AdminDashboard.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({super.key});

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {

  TextEditingController ownerController = TextEditingController();
  TextEditingController restaurantController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? selectedCity;

  bool hidePassword = true;

  @override
  void dispose() {
    ownerController.dispose();
    restaurantController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/Fast food.png",
                  height: 160,
                ),
                SizedBox(height: 10),
                Text("Waves Of Food",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text("Signup Here For Your \nAdmin Dashboard",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Choose Your Location",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedCity,
                      hint: Text("Select City"),
                      items: [
                        "Lahore",
                        "Karachi",
                        "Islamabad",
                        "Rawalpindi",
                        "Peshawar",
                        "Quetta",
                        "Faisalabad",
                        "Multan",
                        "Hyderabad"
                      ].map((city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(city),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                      icon: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: ownerController,
                  decoration: InputDecoration(
                    hintText: "Name of Owner",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: restaurantController,
                  decoration: InputDecoration(
                    hintText: "Name of Restaurant",
                    prefixIcon: Icon(Icons.restaurant),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email or Phone Number",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    String owner = ownerController.text;
                    String restaurant = restaurantController.text;
                    String email = emailController.text;
                    String password = passwordController.text;
                    print(owner);
                    print(restaurant);
                    print(email);
                    print(password);
                    print(selectedCity);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminDashboard(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text("Already Have An Account?",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
