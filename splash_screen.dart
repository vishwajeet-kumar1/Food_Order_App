import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food/loginpage.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to LoginPage after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });

    return Scaffold(
      body: Container(
        color: Colors.red, 
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                // Icon and Text in the center
                const Icon(
                  Icons.restaurant_menu,
                  color: Colors.cyan,
                  size: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'FOOD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                // Bottom Image of a Burger (partially visible)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(200), // Curve for the top left
                    ),
                    child: Image.asset(
                      'assets/burger.jpeg', // Add your burger image here
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}