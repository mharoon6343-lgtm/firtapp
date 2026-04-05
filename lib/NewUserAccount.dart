import 'package:flutter/material.dart';

class NewUserAccount extends StatefulWidget {
  const NewUserAccount({super.key});

  @override
  State<NewUserAccount> createState() => _NewUserAccountState();
}

class _NewUserAccountState extends State<NewUserAccount> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {

    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Image.asset("assets/Fast food.png",
                  height: 150,
                ),
                SizedBox(height: 10),
                Text("Waves Of Food",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text("Create New User Admin",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 25),
                inputField(Icons.person, "Name", controller: nameController),
                SizedBox(height: 15),
                inputField(Icons.email, "Email or Phone Number",
                    controller: emailController),
                SizedBox(height: 15),
                inputField(Icons.lock, "Password",
                    controller: passwordController, isPassword: true),
                SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all fields")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                            Text("New User Created Successfully!")),
                      );
                      Navigator.pop(context);
                    }
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 70,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text("Create New User",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
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
  Widget inputField(IconData icon, String hint,
      {required TextEditingController controller, bool isPassword = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
