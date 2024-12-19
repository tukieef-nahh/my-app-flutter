import 'package:flutter/material.dart';

final mainImage = Image.asset(
  'images/4.jpg',
  width: 160,
  height: 250,
  fit: BoxFit.cover,
);

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: const Color.fromARGB(255, 255, 228, 20)),
    Icon(Icons.star, color: const Color.fromARGB(255, 255, 228, 20)),
    Icon(Icons.star, color: const Color.fromARGB(255, 255, 228, 20)),
    Icon(Icons.star, color: const Color.fromARGB(255, 255, 228, 20)),
    Icon(Icons.star, color: Colors.black),
  ],
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isFavorite = false;
  int _favoriteCount = 15;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _favoriteCount -= 1;
        _isFavorite = false;
      } else {
        _favoriteCount += 1;
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Chi tiết sản phẩm'),
        ),
        body: Center(
          child: Text('Không có dữ liệu sản phẩm.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết sản phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product['tenSP'] ?? 'Tên sản phẩm',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Giá: ${product['giaSP'] ?? 'Giá sản phẩm'}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.red : Colors.black,
                  ),
                  onPressed: _toggleFavorite,
                ),
                Text('$_favoriteCount lượt thích'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
