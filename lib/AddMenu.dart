import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {

  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();

  @override
  void dispose() {
    itemNameController.dispose();
    itemPriceController.dispose();
    descriptionController.dispose();
    ingredientsController.dispose();
    super.dispose();
  }
Future<void> saveMenu()async {


  await FirebaseFirestore.instance.collection("Menu").add({
    "name": itemNameController.text,
    "price": itemPriceController.text,
    "description": descriptionController.text,
    "ingredients":ingredientsController.text
  });
  Navigator.pop(context);
}
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
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: Center(
                        child: Text("Add Item",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: itemNameController,
                  decoration: InputDecoration(
                    hintText: "Item Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: itemPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Item Price",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Item Image"),
                      Icon(Icons.add_circle_outline),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset("assets/Herbal Pancake.jpg",
                      height: 120,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Short Description",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: ingredientsController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Ingredients",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: InkWell(
                    onTap: () {
                  saveMenu();
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 55,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text("Add Item",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
