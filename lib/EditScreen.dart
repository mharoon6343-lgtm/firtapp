import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String paymentMethod = "CASH ON DELIVERY";
  double totalAmount = 35.0;

  @override
  void dispose() {

    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, size: 28),
                ),
                SizedBox(height: 15),
                Center(
                  child: Text("Edit",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: "Address",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment Method", style: TextStyle(color: Colors.grey, fontSize: 16)),
                      Row(
                        children: [
                          Icon(Icons.money, color: Colors.green),
                          SizedBox(width: 5),
                          Text(paymentMethod, style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Amount", style: TextStyle(color: Colors.grey, fontSize: 16)),
                      Text("\$${totalAmount.toStringAsFixed(2)}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Order Placed for ${nameController.text}")),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text("Place My Order",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
