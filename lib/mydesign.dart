import 'package:flutter/material.dart';

class MyDesign extends StatefulWidget {
  const MyDesign({super.key});

  @override
  State<MyDesign> createState() => _MyDesignState();
}

class _MyDesignState extends State<MyDesign> {
  List<Map<String, String>> messages = [
    {
      "imageUrl": "https://mobideals.uk/assets/mac-DxaZUqsF.png",
      "name": "Ali",
      "message": "Hello! How are you?",
      "time": "10:00 AM",
    },
    {
      "imageUrl": "https://mobideals.uk/assets/mac-DxaZUqsF.png",
      "name": "Ahmed",
      "message": "Let's meet today.",
      "time": "10:05 AM",
    },
    {
      "imageUrl": "https://mobideals.uk/assets/mac-DxaZUqsF.png",
      "name": "Sara",
      "message": "I sent you the files.",
      "time": "10:10 AM",
    },
    {
      "imageUrl": "https://mobideals.uk/assets/mac-DxaZUqsF.png",
      "name": "Usman",
      "message": "Check your email.",
      "time": "10:15 AM",
    },
    {
      "imageUrl": "https://mobideals.uk/assets/mac-DxaZUqsF.png",
      "name": "Hina",
      "message": "Call me when free.",
      "time": "10:20 AM",
    },
    {
      "imageUrl": "https://mobideals.uk/assets/mac-DxaZUqsF.png",
      "name": "Bilal",
      "message": "Project is done.",
      "time": "10:25 AM",
    },
    {
      "imageUrl": "https://mobideals.uk/assets/mac-DxaZUqsF.png",
      "name": "Ayesha",
      "message": "Good morning!",
      "time": "10:30 AM",
    },
    {
      "imageUrl": "https://mobideals.uk/assets/mac-DxaZUqsF.png",
      "name": "Zain",
      "message": "Where are you?",
      "time": "10:35 AM",
    },
    {
      "imageUrl": "https://mobideals.uk/assets/mac-DxaZUqsF.png",
      "name": "Fatima",
      "message": "See you soon.",
      "time": "10:40 AM",
    },
    {
      "imageUrl": "https://mobideals.uk/assets/mac-DxaZUqsF.png",
      "name": "Hamza",
      "message": "Thanks!",
      "time": "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.builder(
        itemCount: messages?.length ?? 0,
        itemBuilder: (context,index){
          var data=messages[index];

          return      Row(
            children: [
              Image.network(
                "https://mobideals.uk/assets/mac-DxaZUqsF.png",
                width: 100,
                height: 100,
              ),
              SizedBox(width: 20),
              Column(children: [Text(data["name"]!), Text(data["message"]!)]),
              SizedBox(width: 20),
              Text(data["time"]!),
            ],
          );
        },
      )
    );
  }
}
