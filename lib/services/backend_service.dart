import 'dart:async';

import '../models/menu_item.dart';

/// A tiny in-app backend simulator. Returns hard-coded menu items with a
/// small artificial delay to simulate network latency.
class BackendService {
  static Future<List<MenuItem>> fetchMenu() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return [
      MenuItem(
          name: 'Tacos Chiken',
          price: 3000,
          imagePath: 'assets/images/chicken tacos.jpeg'),
      MenuItem(
          name: 'Tacos Beef',
          price: 2500,
          imagePath: 'assets/images/beef tacos.jpeg'),
      MenuItem(
          name: 'Tacos Chiken',
          price: 3000,
          imagePath: 'assets/images/chicken tacos.jpeg'),
      MenuItem(
          name: '2 Mini Tacos Beef',
          price: 1500,
          imagePath: 'assets/images/mini tacos B.jpeg'),
      MenuItem(
          name: '2 Mini Tacos Chicken',
          price: 2000,
          imagePath: 'assets/images/mini tacos C.jpeg'),
      MenuItem(
          name: '3 crepes Beef',
          price: 3000,
          imagePath: 'assets/images/crepes beef.jpeg'),
      MenuItem(
          name: '3 crepes Chicken',
          price: 3500,
          imagePath: 'assets/images/crepes chicken.jpeg'),
      MenuItem(
          name: 'Loaded Fries Beef',
          price: 2500,
          imagePath: 'assets/images/beef fries.jpeg'),
      MenuItem(
          name: 'Loaded Fries Chicken',
          price: 2500,
          imagePath: 'assets/images/chicken fries.jpeg'),
      MenuItem(
          name: 'Loaded Fries Bacon',
          price: 2500,
          imagePath: 'assets/images/bacon_loaded_fries.jpeg'),
      MenuItem(
          name: 'Menthe au lait',
          price: 1000,
          imagePath: 'assets/images/menthe au lait.jpeg'),
      MenuItem(
          name: "bissap", price: 500, imagePath: "assets/images/bissap.jpeg"),
      MenuItem(
        name: '2 Mini Tacos Chicken',
        price: 2000,
        imagePath: 'assets/images/mini tacos C.jpeg',
      ),
      MenuItem(
        name: '3 crepes Beef',
        price: 3000,
        imagePath: 'assets/images/crepes beef.jpeg',
      ),
      MenuItem(
        name: '3 crepes Chicken',
        price: 3500,
        imagePath: 'assets/images/crepes chicken.jpeg',
      ),
      MenuItem(
        name: 'Loaded Fries Beef',
        price: 2500,
        imagePath: 'assets/images/beef fries.jpeg',
      ),
      MenuItem(
        name: 'Loaded Fries Chicken',
        price: 2500,
        imagePath: 'assets/images/chicken fries.jpeg',
      ),
      MenuItem(
        name: 'Loaded Fries Bacon',
        price: 2500,
        imagePath: 'assets/images/bacon_loaded_fries.jpeg',
      ),
      MenuItem(
        name: 'Menthe au lait',
        price: 1000,
        imagePath: 'assets/images/menthe au lait.jpeg',
      ),
      MenuItem(
        name: 'bissap',
        price: 500,
        imagePath: 'assets/images/bissap.jpeg',
      ),
      MenuItem(
          name: 'Cheesy Burger',
          price: 3000,
          imagePath: 'assets/images/burger.jpg')
    ];
  }
}
