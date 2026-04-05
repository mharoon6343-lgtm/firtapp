import 'package:flutter/material.dart';
import 'package:restaurant_app/CartScreen.dart';
import 'package:restaurant_app/FoodDetails.dart';
import 'package:restaurant_app/HistoryScreen.dart';
import 'package:restaurant_app/ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    HomeContent(),
    CartScreen(),
    Center(child: Text("Search Screen")),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Explore Your Favorite Food",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.red),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("assets/Pizza Banner.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => FoodDetails()),
                    );
                  },
                  child: Text("View Menu", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
            SizedBox(height: 15),
            popularTile(context, "Herbal Pancake", "\$7", "assets/Herbal Pancake.jpg"),
            popularTile(context, "Fruit Salad", "\$5", "assets/Fruit Salad.jpg"),
            popularTile(context, "Green Noodle", "\$15", "assets/Green Noodle.jpg"),
          ],
        ),
      ),
    );
  }
  Widget popularTile(BuildContext context, String name, String price, String image) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10, offset: const Offset(0, 5))],
        color: Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, height: 55, width: 55, fit: BoxFit.cover),
          ),
          SizedBox(width: 15),
          Expanded(child: Text(name)),
          Text(
            price,
            style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
