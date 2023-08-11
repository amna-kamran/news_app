import 'package:flutter/material.dart';
import 'package:news_app/screens/news_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Center(
            child: NewsContainer(
              imgURL:
                  "https://images.unsplash.com/photo-1557992260-ec58e38d363c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1674&q=80",
              newsTitle: "newsTitle",
              newsBody: "newsBody",
              datePublished: "datePublished",
              publishedBy: "publishedBy",
            ),
          );
        },
      ),
    );
  }
}
