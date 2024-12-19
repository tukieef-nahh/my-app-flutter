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
      home: const ProductListPage(),
      routes: {
        '/cart': (context) => CartPage(),
        '/payment': (context) => PaymentPage(),
      },
    );
  }
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'id': 1, 'tenSP': 'Áo sơ mi xanh', 'giaSP': '100.000đ'},
      {'id': 2, 'tenSP': 'Quần jean đen', 'giaSP': '200.000đ'},
      {'id': 3, 'tenSP': 'Áo thun trắng', 'giaSP': '150.000đ'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sản phẩm'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: const Icon(
              Icons.shopping_bag,
              size: 30,
            ),
            title: Text(product['tenSP'] as String),
            subtitle: Text('Giá: ${product['giaSP']}'),
            trailing: const Icon(
              Icons.star,
              color: Colors.grey,
            ),
            onTap: () {
              // Khi nhấn vào sản phẩm, truyền dữ liệu qua RouteSettings
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                  settings: RouteSettings(
                    arguments: product,  // Truyền dữ liệu ở đây
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}