import 'package:flutter/material.dart';

import 'package:news_app/core/news_tile.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/news_provider.dart';
import 'package:news_app/services/urls.dart';
import 'package:provider/provider.dart';

class GeneralNewsList extends StatefulWidget {
  const GeneralNewsList({
    super.key,
  });

  @override
  State<GeneralNewsList> createState() => _GeneralNewsListState();
}

class _GeneralNewsListState extends State<GeneralNewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false)
        .fetchNews(URL.technologyNews);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    List<News>? techNews = newsProvider.newsArticleList;

    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.only(top: 10),
      height: 621,
      child: SingleChildScrollView(
        child: Column(
          children: techNews != null
              ? techNews.map((e) => NewsTile(news: e)).toList()
              : [const CircularProgressIndicator()],
        ),
      ),
    );
  }
}
