import 'package:flutter/material.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {

  int cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, size: 28),
              ),
              SizedBox(height: 20),
              Center(
                child: Text("Herbal Pancake",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Image.asset("assets/Herbal Pancake.jpg",
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              Text("Herbal Pancake is a soft and healthy pancake made with natural herbs and organic ingredients. "
                    "It often includes whole wheat flour, honey, and herbal extracts, making it more nutritious than regular pancakes. "
                    "It is light, tasty, and easier to digest — a perfect choice for breakfast or a healthy snack.",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text("Ingredients",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("• Whole wheat flour (or all-purpose flour)"),
              Text("• Baking powder"),
              Text("• A pinch of salt"),
              Text("• Milk (or almond/soy milk)"),
              Text("• Egg"),
              Text("• Honey (or natural sweetener)"),
              Text("• Olive oil or melted butter"),
              Text("• Fresh herbs (such as mint or basil)"),
              Text("• Herbal powder (like moringa or green tea powder – optional)"),
              Text("• Vanilla extract (optional)"),
              Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    cartCount++;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Added to Cart! Total: $cartCount"),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("Add To Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
