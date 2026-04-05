import 'package:flutter/material.dart';

class OutForDelivery extends StatefulWidget {
  const OutForDelivery({super.key});

  @override
  State<OutForDelivery> createState() => _OutForDeliveryState();
}

class _OutForDeliveryState extends State<OutForDelivery> {
  List<Map<String, dynamic>> deliveries = [
    {
      "customerName": TextEditingController(text: "Ibaad Qureshi"),
      "paymentStatus": "Not Received",
      "statusColor": Colors.green,
    },
    {
      "customerName": TextEditingController(text: "Abdul Raheem"),
      "paymentStatus": "Received",
      "statusColor": Colors.red,
    },
    {
      "customerName": TextEditingController(text: "Haroon Aslam"),
      "paymentStatus": "Not Received",
      "statusColor": Colors.green,
    },
  ];

  @override
  void dispose() {
    for (var delivery in deliveries) {
      delivery["customerName"].dispose();
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
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Center(
                      child: Text("Out For Delivery",
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
              SizedBox(height: 20),
              ...deliveries.map((delivery) {
                return Column(
                  children: [
                    deliveryCard(
                      delivery,
                    ),
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
  Widget deliveryCard(Map<String, dynamic> delivery) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: delivery["customerName"],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Customer Name",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 4),
              Text("Payment", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 4),
              Text(
                delivery["paymentStatus"],
                style: TextStyle(
                  color: delivery["paymentStatus"] == "Received"
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text("Delivered"),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (delivery["paymentStatus"] == "Received") {
                      delivery["paymentStatus"] = "Not Received";
                      delivery["statusColor"] = Colors.green;
                    } else {
                      delivery["paymentStatus"] = "Received";
                      delivery["statusColor"] = Colors.red;
                    }
                  });
                },
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: delivery["statusColor"],
                  child: Icon(Icons.check, size: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
