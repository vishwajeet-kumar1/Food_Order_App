import 'package:flutter/material.dart';
import 'package:food/AddFoodPage.dart';
import 'package:food/FoodDetailPage.dart';
import 'package:food/item.dart';


class FoodHomePage extends StatefulWidget {
  const FoodHomePage({super.key});

  @override
  _FoodHomePageState createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose the\nFood you Love',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Search bar
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.pink[50],
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Search Food Here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Categories
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryItem('Burger', 'assets/burger.jpeg'),
                  CategoryItem('Pizza', 'assets/pizza.jpeg'),
                  CategoryItem('Momo', 'assets/momo.jpeg'),
                  CategoryItem('Burger', 'assets/burger.jpeg'),
                  CategoryItem('Pizza', 'assets/pizza.jpeg'),
                  CategoryItem('Momo', 'assets/momo.jpeg'),
                  CategoryItem('Burger', 'assets/burger.jpeg'),
                  CategoryItem('Pizza', 'assets/pizza.jpeg'),
                  CategoryItem('Momo', 'assets/momo.jpeg'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Food items
            const Text(
              'Popular food Choices',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  FoodCard('Combo Burger', 10.0, 'assets/comboburger.jpeg'),
                  FoodCard('Burger', 5.0, 'assets/burger.jpeg'),
                  FoodCard('Burger', 5.0, 'assets/burger.jpeg'),
                  FoodCard('Combo Burger', 10.0, 'assets/comboburger.jpeg'),
                  FoodCard('Combo Burger', 10.0, 'assets/comboburger.jpeg'),
                  FoodCard('Burger', 5.0, 'assets/burger.jpeg'),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Item(
                    name: 'Combo Burger',
                    price: 10.0,
                    imagePath: 'assets/comboburger.jpeg',
                    quantity: 1,
                )));
              },
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFoodPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for Category Item
class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoryItem(this.title, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

// Widget for Food Item Card
class FoodCard extends StatelessWidget {
  final String title;
  final double price;
  final String imagePath;

  const FoodCard(this.title, this.price, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailPage(
              name: title,
              price: price,
              imagePath: imagePath,
            )
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.pink[50],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('\$${price.toString()}', style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
