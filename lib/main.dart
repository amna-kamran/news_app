import 'package:flutter/material.dart';
import 'package:news_app/screens/bottom_navbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomNavBar(),
      ),
    );
  }
}
