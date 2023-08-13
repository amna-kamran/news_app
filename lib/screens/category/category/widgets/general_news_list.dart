import 'package:flutter/material.dart';
import 'package:news_app/core/news_tile.dart';

class GeneralNewsList extends StatefulWidget {
  const GeneralNewsList({super.key, required this.news});
  final Future<List<dynamic>> news;
  @override
  State<GeneralNewsList> createState() => _GeneralNewsListState();
}

class _GeneralNewsListState extends State<GeneralNewsList> {
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
                children: newsList.map((e) => NewsTile(news: e)).toList(),
              );
            }
          },
        ),
      ],
    );
  }
}
