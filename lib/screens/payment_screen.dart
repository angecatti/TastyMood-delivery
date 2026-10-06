import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import '../services/order_service.dart';
import '../models/order.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final total = CartService.totalPrice;

    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amount to pay: $total FCFA',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            const Text('Choose payment mode', style: TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.phone_android, color: Colors.orange),
              title: const Text('Orange Money'),
              onTap: () {
                _showConfirmation(context, 'Orange Money');
                OrderService.addOrder(
                  Order(
                    items: CartService.items.map((e) => e.name).toList(),
                    total: CartService.totalPrice,
                    paymentMethod: "Orange Money",
                    date: DateTime.now(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.phone_android, color: Colors.yellow),
              title: const Text('MTN Mobile Money'),
              onTap: () {
                _showConfirmation(context, 'MTN Mobile Money');
                OrderService.addOrder(
                  Order(
                    items: CartService.items.map((e) => e.name).toList(),
                    total: CartService.totalPrice,
                    paymentMethod: "MTN Mobile Money",
                    date: DateTime.now(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmation(BuildContext context, String method) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Paie'),
        content: Text(
          'Payment made successfully via $method.\n\nThank you for your oder.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              CartService.items.clear();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
