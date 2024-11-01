import 'package:flutter/material.dart';
import 'package:food/homepage.dart';
import 'package:food/loginpage.dart';



class OrderConfirmPage extends StatefulWidget {
  const OrderConfirmPage({super.key});

  @override
  _OrderConfirmPageState createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top image container
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/pizza.jpeg'), // Your image asset
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Food',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Delivery image and text
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/delivery.png',
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Thanks you for your orders',
                    style: TextStyle(fontSize: 18, color: Colors.redAccent),
                  ),
                ],
              ),
            ),

            // Buttons
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FoodHomePage()));
                    },
                    child: const Text(
                      'Go to Home page',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            // Back button at the bottom
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                  // Back action
                },
                child: const Text(
                  'Back',
                  style: TextStyle(fontSize: 18, color: Colors.redAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
