import 'package:flutter/material.dart';

final mainImage = Image.asset(
  'images/4.jpg',
  width: 200,
  height: 300,
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

//Stateful có trạng thái, có thể tương tác với nó
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isFavorite = false;
  int _favoriteCount = 15;

  //Phương thức cho favorite
  //Hàm đặc danh không tên anonymous function
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
    return MaterialApp(
      title: 'Welcome to Fashion store | HTK',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'HTK-Store',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              width: 800,
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: mainImage,
                  ),
                  const Text(
                    'Áo sơ mi xanh phong cách Hàn Quốc',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      stars,
                      const Text(
                        '100 đánh giá',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  // Button và Favorite
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Button
                      MyButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              _isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: _isFavorite ? Colors.red : Colors.black,
                            ),
                            onPressed: _toggleFavorite,
                          ),
                          SizedBox(
                            width: 18,
                            child: Text('$_favoriteCount'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    'Bình luận:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildComment('images/z5202028951564_c929a8e9d5e653f162e4bde7b318e2e1.jpg', 'Thanh Kiều', 'Áo đẹp lắm!'),
                        _buildComment('images/126899275_10207700716511446_8507893075090382398_n.jpg', 'Thu Huệ', 'Chất lượng vải rất tốt.'),
                        _buildComment('images/4.jpg', 'Triểu Hán', 'Mặc rất vừa vặn.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

  Widget _buildComment(String avatar, String name, String comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              avatar,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  comment,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;

  //const MyButton({Key? key}) : super(key: key);
  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 17, 70, 113),
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // bo góc của button
        ),
      ),
      onPressed: onPressed,
      child: const Center(
        child: Text(
          'Thêm vào giỏ hàng',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}