import 'package:flutter/material.dart';
import 'package:restaurant_app/AddMenu.dart';
import 'package:restaurant_app/AdminLogin.dart';
import 'package:restaurant_app/AdminProfile.dart';
import 'package:restaurant_app/AllMenuItems.dart';
import 'package:restaurant_app/NewUserAccount.dart';
import 'package:restaurant_app/OutForDelivery.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/Fast food.png",
                      height: 45,
                      width: 45,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    Text("Waves Of Food",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.info_outline, color: Colors.red),
                          SizedBox(height: 5),
                          Text("Pending Order",
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(height: 5),
                          Text("30",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.red),
                          SizedBox(height: 5),
                          Text("Completed Order",
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(height: 5),
                          Text("10",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.attach_money, color: Colors.red),
                          SizedBox(height: 5),
                          Text("Whole Time\nEarnings",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(height: 5),
                          Text("\$100",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dashboardBox(Icons.add, "Add Menu", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddMenu(),
                        ),
                      );
                    }),
                    dashboardBox(Icons.remove_red_eye, "All Item Menu", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllMenuItems(),
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dashboardBox(Icons.person, "Profile", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminProfile(),
                        ),
                      );
                    }),
                    dashboardBox(Icons.person_add, "Create New User", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewUserAccount(),
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dashboardBox(Icons.shopping_bag, "Order Dispatch", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OutForDelivery(),
                        ),
                      );
                    }),
                    dashboardBox(Icons.logout, "Log Out", () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminLogin(),
                        ),
                            (route) => false,
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget dashboardBox(
      IconData icon,
      String text,
      VoidCallback onTap,
      ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 150,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.red, size: 30),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
