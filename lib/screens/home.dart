import 'package:flutter/material.dart';
import 'package:news_app/screens/news_container.dart';
import 'package:news_app/services/news_provider.dart';
import '../model/news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late News news;
getNews() async {
  news = await NewsProvider.fetchNews();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          getNews();
          return Center(
            child: NewsContainer(
              imgURL: news.imgURL,
              newsTitle: news.newsTitle,
              newsBody: news.newsBody,
              datePublished: news.datePublished,
              publishedBy: news.publishedBy,
            ),
          );
        },
      ),
    );
  }
}
