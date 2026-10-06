import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const TastyMoodApp(startRoute: '/register'));
}

class TastyMoodApp extends StatelessWidget {
  final String startRoute;
  const TastyMoodApp({super.key, required this.startRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasty Mood Food Delivery',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: startRoute,
      routes: {
        '/login': (ctx) => const LoginScreen(),
        '/register': (ctx) => const SignInScreen(),
        '/menu': (ctx) => const MenuScreen(),
        '/home': (ctx) => const HomeScreen(),
        '/profile': (ctx) => const ProfileScreen(),
        '/cart': (ctx) => const CartScreen(),
        '/payment': (ctx) => const PaymentScreen(),
      },
    );
  }
}
