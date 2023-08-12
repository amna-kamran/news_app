import 'package:flutter/material.dart';
import 'package:news_app/screens/home/widget/top_news_tile.dart';

class TopNewsList extends StatefulWidget {
  const TopNewsList({super.key, required this.news});
  final Future<List<dynamic>> news;
  @override
  State<TopNewsList> createState() => _TopNewsListState();
}

class _TopNewsListState extends State<TopNewsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List>(
          future: widget.news,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List newsList = snapshot.data!;
              return Column(
                children: newsList.map((e) => TopNewsTile(news: e)).toList(),
              );
            }
          },
        ),
      ],
    );
  }
}
