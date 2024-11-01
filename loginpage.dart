import 'package:flutter/material.dart';
import 'package:food/homepage.dart';
import 'package:food/signuppage.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // A key to identify and validate the form
    final formKey = GlobalKey<FormState>();

    // TextEditingController for username and password fields
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      // Set background color to grey
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,  // Center the login text in the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.person, size: 200,),

              const SizedBox(height: 100,),
              // Username TextField with square border
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0), // Square border
                  borderRadius: BorderRadius.circular(10), // No rounded corners
                ),
                child: TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: InputBorder.none, // Remove internal border
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16.0),

              // Password TextField with square border
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0), // Square border
                  borderRadius: BorderRadius.circular(10), // No rounded corners
                ),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: InputBorder.none, // Remove internal border
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 30.0),

              // Login button with square border
              Container(
                width: double.infinity, // Make the button full width
                decoration: BoxDecoration(
                  border: Border.all(), // Square border
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 9, 54, 90), 
                    foregroundColor: Colors.white
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // You can handle the login action here
                      Navigator.push(context, MaterialPageRoute(builder: (Context) =>  const FoodHomePage()));
                    }
                  },
                  child: const Text('Login'),
                ),
              ),

              const SizedBox(height: 40,),
              const Text("Don't have an account ?"),
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (Context) => const SignupPage()));
              }, child: const Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }
}
