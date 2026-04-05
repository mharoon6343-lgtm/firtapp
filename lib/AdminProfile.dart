import 'package:flutter/material.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {

  TextEditingController nameController =
  TextEditingController(text: "lorem ipsum");

  TextEditingController addressController =
  TextEditingController(text: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts.");

  TextEditingController emailController =
  TextEditingController(text: "lorem ipsum@gmail.com");

  TextEditingController phoneController =
  TextEditingController(text: "123456789");

  TextEditingController passwordController =
  TextEditingController(text: "12345678");

  bool isEdit = false;
  bool hidePassword = true;

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Text("Admin Profile",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Edit Your Profile",
                    style: TextStyle(color: Colors.red),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isEdit = !isEdit;
                      });
                    },
                    child: Text(
                      isEdit ? "Cancel Edit" : "Click Here To Edit",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              buildField("Name", nameController),
              buildField("Address", addressController, maxLines: 3),
              buildField("Email", emailController),
              buildField("Phone", phoneController),
              buildPasswordField(),
              Spacer(),
              InkWell(
                onTap: () {
                  String name = nameController.text;
                  String address = addressController.text;
                  String email = emailController.text;
                  String phone = phoneController.text;
                  String password = passwordController.text;
                  print(name);
                  print(address);
                  print(email);
                  print(phone);
                  print(password);
                  Navigator.pop(context);
                },
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text("Save Information",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
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
  Widget buildField(String title, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18),
      child: TextField(
        controller: controller,
        enabled: isEdit,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: title,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
  Widget buildPasswordField() {
    return Padding(
      padding: EdgeInsets.only(bottom: 18),
      child: TextField(
        controller: passwordController,
        enabled: isEdit,
        obscureText: hidePassword,
        decoration: InputDecoration(
          labelText: "Password",
          filled: true,
          fillColor: Colors.grey.shade100,
          suffixIcon: IconButton(
            icon: Icon(
                hidePassword ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
