import 'package:flutter/material.dart';

import 'package:news_app/core/news_tile.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/news_provider.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  List<News>? news;
  NewsList({
    super.key,
    required this.news,
  });

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    List<News>? news = newsProvider.newsArticleList;

    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.only(top: 10),
      height: 1000,
      child: SingleChildScrollView(
        child: Column(
          children: news != null
              ? news.map((e) => NewsTile(news: e)).toList()
              : [const CircularProgressIndicator()],
        ),
      ),
    );
  }
}
