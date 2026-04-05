import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<String> cities = [
    "Raja Bazar",
    "Saddar",
    "College Road",
    "Fawara Chowk",
    "Lal Haveli",
    "Committee Chowk",
    "Iqbal Road",
    "Satellite Town",
    "Chaklala Scheme 3",
    "Westridge",
    "Lalazar",
    "Afandi Colony",
    "Muslim Town",
    "Dhok Hukam Dad",
    "Amar Pura",
    "Arya Mohallah",
    "Bahria Town",
    "DHA Islamabad/Rawalpindi",
    "Top City-1",
    "General HeadQuarter (GHQ)",
    "Peshawar Road",
    "R.A Bazar",
    "Chaklala Air Field",
    "Capital Smart City",
    "Park View City",
    "Abdullah City",
    "Pir Wadhai"
  ];

  String? selectedCity;

  @override
  void initState() {
    super.initState();
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text("Choose Your Location",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                underline: SizedBox(),
                value: selectedCity,
                items: cities.map((city) {
                  return DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value!;
                  });
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text("To provide you with the best dining experience, "
                    "we need your permission to access your device's location. "
                    "By enabling location services, "
                    "we can offer personalized restaurant recommendations, "
                    "accurate delivery estimates, "
                    "and ensure a seamless food delivery experience.",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
