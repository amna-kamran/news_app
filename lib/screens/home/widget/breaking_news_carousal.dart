import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home/widget/breaking_news_card.dart';
import 'package:news_app/services/news_provider.dart';

class BreakingNewsCarousal extends StatelessWidget {
  const BreakingNewsCarousal({
    super.key,
    required this.news,
  });

  final Future<List<dynamic>> news;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: NewsProvider.fetchBreakingNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List? newsList = snapshot.data;
          return CarouselSlider.builder(
            itemCount: newsList?.length,
            itemBuilder: (context, index, id) {
              return BreakingNewsCard(news: newsList?[index]);
            },
            options: CarouselOptions(
              aspectRatio: 16 / 11,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
            ),
          );
        }
      },
    );
  }
}
