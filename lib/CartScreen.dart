import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class CartItem {
  String name;
  String imagePath;
  double price;
  int qty;

  CartItem({required this.name, required this.imagePath, required this.price, required this.qty});
}

class _CartScreenState extends State<CartScreen> {

  List<CartItem> cartItems = [
    CartItem(name: "Fish Burger", imagePath: "assets/Fish Burger.jpg", price: 35, qty: 1),
    CartItem(name: "Chicken Burger", imagePath: "assets/Fish Burger.jpg", price: 40, qty: 2),
    CartItem(name: "Veggie Burger", imagePath: "assets/Fish Burger.jpg", price: 30, qty: 1),
  ];

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
                Text("Explore Your Favorite Food",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Icon(Icons.notifications_none, color: Colors.red),
              ],
            ),
            SizedBox(height: 20),
            Text("Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ...cartItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: cartItemWidget(item),
            )),
            Spacer(),
            GestureDetector(
              onTap: () {
               },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text("Proceed",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: "Delivery"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
  Widget cartItemWidget(CartItem item) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(item.imagePath, height: 60, width: 60),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text("\$ ${item.price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (item.qty > 1) {
                    setState(() {
                      item.qty--;
                    });
                  }
                },
                child: Icon(Icons.remove, color: Colors.red),
              ),
              SizedBox(width: 8),
              Text(item.qty.toString()),
              SizedBox(width: 8),
              InkWell(
                onTap: () {
                  setState(() {
                    item.qty++;
                  });
                },
                child: Icon(Icons.add, color: Colors.red),
              ),
              SizedBox(width: 15),
              InkWell(
                onTap: () {
                  setState(() {
                    cartItems.remove(item);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${item.name} Deleted"), duration: Duration(seconds: 1)),
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
