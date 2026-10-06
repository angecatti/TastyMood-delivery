import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../services/cart_service.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final int price;

  const DetailsScreen({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.fastfood, size: 80, color: Colors.orange),
            ),

            const SizedBox(height: 20),

            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              '$price FCFA',
              style: const TextStyle(fontSize: 18, color: Colors.orange),
            ),

            const SizedBox(height: 20),

            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              'Delicious dish prepared with fresh and quality ingredients.',
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  CartService.addItem(CartItem(name: name, price: price));
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Add to cart')));
                },
                child: const Text('Add to cart '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
