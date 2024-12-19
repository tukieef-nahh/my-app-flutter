import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/ui/login.dart';
import 'package:my_app/ui/signup.dart';

void main() async {
    await _initHive();
    runApp(const MainApp());
}
Future<void> _initHive() async {
    await Hive.initFlutter();
    await Hive.openBox("login");
    await Hive.openBox("accounts");
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Login(),
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
      },
    );
  }
}