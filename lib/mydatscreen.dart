import 'package:flutter/material.dart';

class MyDataScreen extends StatefulWidget {
  final String title;
  final String message;
  const MyDataScreen({super.key,required this.title,required this.message});

  @override
  State<MyDataScreen> createState() => _MyDataScreenState();
}

class _MyDataScreenState extends State<MyDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.title),
          Text(widget.message)

        ],
      ),
    );
  }
}
