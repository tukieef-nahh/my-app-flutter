import 'package:flutter/material.dart';
import 'package:my_app/cart_page.dart';
import 'package:my_app/my_home_page.dart';
import 'package:my_app/payment_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Fashion store | HTK',
      home: const MyHomePage(),
      routes: {
        '/cart': (context) => CartPage(),
        '/payment': (context) => PaymentPage(),
      },
    );
  }
}