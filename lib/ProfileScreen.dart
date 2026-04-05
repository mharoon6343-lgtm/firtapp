import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore Your Favorite Food",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.notifications_none, color: Colors.red),
              ],
            ),
            SizedBox(height: 30),
            textField("Name", nameController),
            SizedBox(height: 15),
            textField("Address", addressController),
            SizedBox(height: 15),
            textField("Email", emailController),
            SizedBox(height: 15),
            textField("Phone", phoneController),
            Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Profile information saved successfully!"),
                    ),
                  );
                });
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("Save Information",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: "Delivery"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
  Widget textField(String title, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: title,
        ),
      ),
    );
  }
}
