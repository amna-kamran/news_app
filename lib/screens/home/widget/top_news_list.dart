import 'package:flutter/material.dart';
import 'package:news_app/core/news_tile.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/news_provider.dart';
import 'package:news_app/constants/urls.dart';
import 'package:provider/provider.dart';

class TopNewsList extends StatefulWidget {
  const TopNewsList({
    super.key,
  });

  @override
  State<TopNewsList> createState() => _TopNewsListState();
}

class _TopNewsListState extends State<TopNewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchNews(
      URL.getURL("general"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    List<News>? topNews = newsProvider.newsArticleList;

    return Column(
      children: topNews != null
          ? topNews.map((e) => NewsTile(news: e)).toList()
          : [const CircularProgressIndicator()],
    );
  }
}
