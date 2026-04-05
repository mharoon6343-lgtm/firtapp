import 'package:flutter/material.dart';

class AllMenuItems extends StatefulWidget {
  const AllMenuItems({super.key});

  @override
  State<AllMenuItems> createState() => _AllMenuItemsState();
}

class _AllMenuItemsState extends State<AllMenuItems> {
  int qty1 = 10;
  int qty2 = 15;
  int qty3 = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Center(
                      child: Text("All Item",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),
              SizedBox(height: 25),
              itemCard("assets/Fish Burger.jpg", qty1, (value) {
                setState(() {
                  qty1 = value;
                });
              }),
              SizedBox(height: 15),
              itemCard("assets/Fish Burger.jpg", qty2, (value) {
                setState(() {
                  qty2 = value;
                });
              }),
              SizedBox(height: 15),
              itemCard("assets/Fish Burger.jpg", qty3, (value) {
                setState(() {
                  qty3 = value;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
  Widget itemCard(String imagePath, int qty, Function(int) onQtyChanged) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 65,
              width: 65,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Fish Burger",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text("Burger",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 6),
                Text("\$ 35",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (qty > 0) onQtyChanged(qty - 1);
                    },
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red.shade100,
                      child: Text("-", style: TextStyle(color: Colors.red)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(qty.toString()),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      onQtyChanged(qty + 1);
                    },
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Text("+", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Item Deleted"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Icon(Icons.delete_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
