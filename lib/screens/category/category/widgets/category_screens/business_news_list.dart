import 'package:flutter/material.dart';

import 'package:news_app/core/news_tile.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/news_provider.dart';
import 'package:news_app/services/urls.dart';
import 'package:provider/provider.dart';

class BusinessNewsList extends StatefulWidget {
  const BusinessNewsList({
    super.key,
  });

  @override
  State<BusinessNewsList> createState() => _BusinessNewsListState();
}

class _BusinessNewsListState extends State<BusinessNewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false)
        .fetchNews(URL.businessNews);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    List<News>? businessNews = newsProvider.newsArticleList;

    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.only(top: 10),
      height: 621,
      child: SingleChildScrollView(
        child: Column(
          children: businessNews != null
              ? businessNews.map((e) => NewsTile(news: e)).toList()
              : [const CircularProgressIndicator()],
        ),
      ),
    );
  }
}
