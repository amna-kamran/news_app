import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/screens/home/widget/breaking_news_card.dart';
import 'package:news_app/services/news_provider.dart';
import 'package:news_app/constants/urls.dart';
import 'package:provider/provider.dart';

class BreakingNewsCarousal extends StatefulWidget {
  const BreakingNewsCarousal({
    super.key,
  });

  @override
  State<BreakingNewsCarousal> createState() => _BreakingNewsCarousalState();
}

class _BreakingNewsCarousalState extends State<BreakingNewsCarousal> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false)
        .fetchNews(URL.breakingNews);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    List<News>? breakingNews = newsProvider.newsArticleList;
    return CarouselSlider.builder(
      itemCount: breakingNews.length,
      itemBuilder: (context, index, id) {
        return BreakingNewsCard(news: breakingNews[index]);
      },
      options: CarouselOptions(
        aspectRatio: 16 / 11,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
    );
  }
}
