import 'package:flutter/material.dart';
import 'package:restaurant_app/HomeScreen.dart';
import 'package:restaurant_app/CartScreen.dart';
import 'package:restaurant_app/HistoryScreen.dart';
import 'package:restaurant_app/ProfileScreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedIndex = 2;
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> products = [
    {
      "name": "Herbal Pancake",
      "price": "\$7",
      "image": "assets/Herbal Pancake.jpg"
    },
    {
      "name": "Fruit Salad",
      "price": "\$5",
      "image": "assets/Fruit Salad.jpg"
    },
    {
      "name": "Green Noodle",
      "price": "\$15",
      "image": "assets/Green Noodle.jpg"
    },
    {
      "name": "Herbal Pancake",
      "price": "\$7",
      "image": "assets/Herbal Pancake.jpg"
    },
    {
      "name": "Fruit Salad",
      "price": "\$5",
      "image": "assets/Fruit Salad.jpg"
    },
    {
      "name": "Green Noodle",
      "price": "\$15",
      "image": "assets/Green Noodle.jpg"
    },
    ];
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      CartScreen(),
      searchContent(),
      HistoryScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
  Widget searchContent() {
    List filteredProducts = products.where((product) {
      return product["name"]!
          .toLowerCase()
          .contains(searchController.text.toLowerCase());
    }).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Explore Your Favorite Food",
                    style: TextStyle(
                      fontSize: 20,
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
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "What do you want to order?",
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
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
              Expanded(
                child: ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    var product = filteredProducts[index];
                    return menuTile(
                      product["name"],
                      product["price"],
                      product["image"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget menuTile(String name, String price, String image) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
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
              image,
              height: 55,
              width: 55,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              name,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
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
