import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List<Map<String, dynamic>> menuItems = [
    {"name": "Herbal Pancake", "price": "\$7", "image": "assets/Herbal Pancake.jpg", "added": false},
    {"name": "Fruit Salad", "price": "\$5", "image": "assets/Fruit Salad.jpg", "added": false},
    {"name": "Green Noodle", "price": "\$15", "image": "assets/Green Noodle.jpg", "added": false},
    {"name": "Herbal Pancake", "price": "\$7", "image": "assets/Herbal Pancake.jpg", "added": false},
    {"name": "Fruit Salad", "price": "\$5", "image": "assets/Fruit Salad.jpg", "added": false},
    {"name": "Green Noodle", "price": "\$15", "image": "assets/Green Noodle.jpg", "added": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Explore Your Favorite Food",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Text("Menu",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          ...menuItems.map((item) => Column(
            children: [
              menuTile(item),
              SizedBox(height: 15),
            ],
          )),
        ],
      ),
    );
  }
  Widget menuTile(Map<String, dynamic> item) {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item["image"],
              height: 55,
              width: 55,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              item["name"],
              style: TextStyle(fontSize: 16),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item["price"],
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              InkWell(
                onTap: () {
                  setState(() {
                    item["added"] = !item["added"];
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        item["added"]
                            ? "${item["name"]} added to cart"
                            : "${item["name"]} removed from cart",
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: item["added"] ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    item["added"] ? "Added" : "Add to Cart",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
