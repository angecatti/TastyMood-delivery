import 'package:flutter/material.dart';
import 'details_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'name': 'Tacos Beef',
        'price': 2500,
        'image': 'assets/images/beef tacos.jpeg'
      },
      {
        'name': 'Tacos Chiken',
        'price': 3000,
        'image': 'assets/images/chicken tacos.jpeg'
      },
      {
        'name': '2 Mini Tacos Beef',
        'price': 1500,
        'image': 'assets/images/mini tacos B.jpeg'
      },
      {
        'name': '2 Mini Tacos Chicken',
        'price': 2000,
        'image': 'assets/images/mini tacos C.jpeg'
      },
      {
        'name': '3 crepes Beef',
        'price': 3000,
        'image': 'assets/images/crepes beef.jpeg'
      },
      {
        'name': '3 crepes Chicken',
        'price': 3500,
        'image': 'assets/images/crepes chicken.jpeg'
      },
      {
        'name': 'Loaded Fries Beef',
        'price': 2500,
        'image': 'assets/images/beef fries.jpeg'
      },
      {
        'name': 'Loaded Fries Chicken',
        'price': 2500,
        'image': 'assets/images/chicken fries.jpeg'
      },
      {
        'name': 'Loaded Fries Bacon',
        'price': 2500,
        'image': 'assets/images/bacon_loaded_fries.jpeg'
      },
      {
        'name': 'Menthe au lait',
        'price': 1000,
        'image': 'assets/images/menthe au lait.jpeg'
      },
      {'name': 'bissap', 'price': 500, 'image': 'assets/images/bissap.jpeg'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Tasty Menu')),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.all(12),
            elevation: 6,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: Image.asset(
                    item['image'] as String,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => const SizedBox(
                      width: 120,
                      height: 120,
                      child: Center(child: Icon(Icons.broken_image)),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      item['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${item['price']} FCFA'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(
                            name: item['name'],
                            price: item['price'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
