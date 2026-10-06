import 'package:flutter/material.dart';
import '../services/backend_service.dart';
import '../models/menu_item.dart';
import '../models/cart_item.dart';
import '../services/cart_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<List<MenuItem>> _menuFuture;

  @override
  void initState() {
    super.initState();
    _menuFuture = BackendService.fetchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 233, 145, 30),
        child: const Icon(Icons.shopping_bag),
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'Home',
              icon: const Icon(Icons.home),
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
            IconButton(
              tooltip: 'Menu',
              icon: const Icon(Icons.menu_book),
              onPressed: () => Navigator.pushNamed(context, '/menu'),
            ),
            const SizedBox(width: 40),
            IconButton(
              tooltip: 'Offers',
              icon: const Icon(Icons.local_offer),
              onPressed: () => Navigator.pushNamed(context, '/payment'),
            ),
            IconButton(
              tooltip: 'Profile',
              icon: const Icon(Icons.person),
              onPressed: () => Navigator.pushNamed(context, '/profile'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tasty Mood 🌮",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Our Menu",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/menu'),
                    child: const Text('View All',
                        style: TextStyle(
                            color: Color.fromARGB(255, 233, 169, 30))),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const SizedBox(height: 24),
              const Text(
                "Featured Items",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: FutureBuilder<List<MenuItem>>(
                  future: _menuFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final items = snapshot.data ?? [];
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      children: items.map((m) => foodCard(m)).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuCategory(String title, String emoji) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }

  Widget foodCard(MenuItem item) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) => Image.network(
                'https://via.placeholder.com/300x200.png?text=No+Image',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(item.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('${item.price} FCFA'),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.add_circle,
                  color: Color.fromARGB(255, 233, 169, 30)),
              onPressed: () {
                CartService.addItem(
                  CartItem(name: item.name, price: item.price),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
