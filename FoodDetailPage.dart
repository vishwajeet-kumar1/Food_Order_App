import 'package:flutter/material.dart';
import 'package:food/item.dart';


class FoodDetailPage extends StatefulWidget {
  final String name;
  final double price;
  final String imagePath;

  const FoodDetailPage(
      {super.key,
      required this.name,
      required this.price,
      required this.imagePath});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  bool isFavorite = false;
  int quantity = 1;
  bool isPizzaChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Background image with food text
            Container(
              height: 250,
              decoration: BoxDecoration(
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
            // Main card with burger details
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the image and icon row
                      children: [
                        // Burger image in circular box
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(100), // Circular image
                          child: Image.asset(
                            widget.imagePath, // Use passed image path
                            width: 100, // Adjusted size
                            height: 100, // Adjusted size
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                            width: 20), // Space between image and heart icon
                        // Heart icon (Favorite button)
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          icon: Icon(isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border),
                          color: isFavorite ? Colors.red : Colors.pink,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.name, // Use passed food name
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star_half, color: Colors.yellow, size: 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Quantity control
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            Text('$quantity'),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                        // Add item button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Item(
                                  name: widget.name,
                                  price: widget.price,
                                  imagePath: widget.imagePath,
                                  quantity: quantity,
                                )
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                              'Add Item \$${widget.price * quantity}'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Back Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // Handle back button logic
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            const SizedBox(height: 20), // Adding some space at the bottom
          ],
        ),
      ),
    );
  }
}
