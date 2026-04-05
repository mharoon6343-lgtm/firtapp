import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<Map<String, dynamic>> notifications = [
    {
      "icon": Icons.sentiment_dissatisfied,
      "color": Colors.amber,
      "message": "Your order has been Canceled Successfully"
    },
    {
      "icon": Icons.local_shipping,
      "color": Colors.red,
      "message": "Order has been taken by the driver"
    },
    {
      "icon": Icons.check,
      "color": Colors.red,
      "message": "Congrats Your Order Placed",
      "isStack": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, size: 28),
                  ),
                  Expanded(
                    child: Center(
                      child: Text("Hello, Haroon Aslam",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 28),
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.separated(
                  itemCount: notifications.length,
                  separatorBuilder: (_, __) => SizedBox(height: 25),
                  itemBuilder: (context, index) {
                    var item = notifications[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 35,
                          child: item["isStack"] == true
                              ? Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: -6,
                                left: -6,
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -5,
                                right: -5,
                                child: Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  color: item["color"],
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  item["icon"],
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ],
                          )
                              : Icon(
                            item["icon"],
                            color: item["color"],
                            size: 28,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            item["message"],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
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
}
