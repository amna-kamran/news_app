import 'package:flutter/material.dart';
import 'package:news_app/constants/urls.dart';
import 'package:news_app/core/news_list.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/news_provider.dart';
import 'package:provider/provider.dart';

class TechnologyNews extends StatefulWidget {
  const TechnologyNews({super.key});

  @override
  State<TechnologyNews> createState() => _TechnologyNewsState();
}

class _TechnologyNewsState extends State<TechnologyNews> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchNews(
      URL.getURL("technology"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    List<News>? news = newsProvider.newsArticleList;
    return NewsList(
      news: news,
    );
  }
}
