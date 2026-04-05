import 'package:flutter/material.dart';

class PendingOrders extends StatefulWidget {
  const PendingOrders({super.key});

  @override
  State<PendingOrders> createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  List<Map<String, dynamic>> orders = [
    {
      "image": "assets/Fish Burger.jpg",
      "qty": "2",
      "customerName": TextEditingController(text: "Ibaad Qureshi"),
      "buttonText": "Accept",
    },
    {
      "image": "assets/Fish Burger.jpg",
      "qty": "5",
      "customerName": TextEditingController(text: "Abdul Raheem"),
      "buttonText": "Dispatch",
    },
    {
      "image": "assets/Fish Burger.jpg",
      "qty": "7",
      "customerName": TextEditingController(text: "Haroon Aslam"),
      "buttonText": "Dispatch",
    },
  ];

  @override
  void dispose() {
    for (var order in orders) {
      order["customerName"].dispose();
    }
    super.dispose();
  }

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
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Text("Pending Orders",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                ],
              ),
              SizedBox(height: 20),
              ...orders.map((order) {
                return Column(
                  children: [
                    orderCard(order),
                    SizedBox(height: 15),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
  Widget orderCard(Map<String, dynamic> order) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              order["image"],
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: order["customerName"],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Customer Name",
                  ),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text("Quantity  ${order["qty"]}",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "${order["buttonText"]} clicked for ${order["customerName"].text}"),
                ),
              );
              setState(() {
                if (order["buttonText"] == "Accept") {
                  order["buttonText"] = "Dispatch";
                } else if (order["buttonText"] == "Dispatch") {
                  order["buttonText"] = "Completed";
                }
              });
            },
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                order["buttonText"],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
