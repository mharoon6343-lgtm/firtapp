import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  int recentCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Explore Your Favorite Food",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Icon(Icons.notifications_none,
                    color: Colors.red)
              ],
            ),
            SizedBox(height: 30),
            Text("Recent buy"),
            SizedBox(height: 15),
            itemBox(true),
           SizedBox(height: 30),
            Text("Previously buy"),
            SizedBox(height: 15),
            itemBox(false),
            SizedBox(height: 15),
            itemBox(false),
            SizedBox(height: 15),
            itemBox(false),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
  Widget itemBox(bool isRecent) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset("assets/Fish Burger.jpg",
              height: 60, width: 60),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text("Fish Burger",
                    style: TextStyle(
                        fontWeight:
                        FontWeight.bold)),
                Text("Burger",
                    style:
                    TextStyle(color: Colors.grey)),
                Text("\$ 35",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight:
                        FontWeight.bold)),
              ],
            ),
          ),
          isRecent
              ? CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red)
              : InkWell(
            onTap: () {
              setState(() {
                recentCount++;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Added to cart again! Total: $recentCount"),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8)),
              child: Text("Buy Again",
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
