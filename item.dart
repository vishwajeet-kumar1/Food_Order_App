import 'package:flutter/material.dart';
import 'package:food/DeliveryAddressPage.dart';
import 'package:food/homepage.dart';



class Item extends StatefulWidget {
  final String name;
  final double price;
  final String imagePath;
  final int quantity;

  const Item({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.quantity,
  });

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity; // Initialize the quantity
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100, // Background color
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
            Container(
              height: 200, // Adjusted for a larger image size
              decoration: BoxDecoration(
                color: Colors.pink.shade200, // Optional background color
                image: DecorationImage(
                  image: AssetImage(widget.imagePath), // Use passed image path
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  widget.name, // Use passed food name
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Main content (item added with buttons)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          widget.imagePath, // Use passed image path
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Item Added',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                            icon: const Icon(Icons.remove),
                            color: Colors.black,
                          ),
                          Text('$quantity'), // Updated with dynamic quantity
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: const Icon(Icons.add),
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Price: \$${(widget.price * quantity).toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 300),
                  // Buttons for Back and Next
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const FoodHomePage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          ),
                          child: const Text('Back'),
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryAddressPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade200,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                              ),
                              child: const Text('Next'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Extra space at the bottom
          ],
        ),
      ),
    );
  }
}
