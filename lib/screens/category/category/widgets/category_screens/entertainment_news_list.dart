import 'package:flutter/material.dart';

import 'package:news_app/core/news_tile.dart';
import 'package:news_app/services/news_provider.dart';

class EntertainmentNewsList extends StatefulWidget {
  const EntertainmentNewsList({
    super.key,
  });
  @override
  State<EntertainmentNewsList> createState() => _EntertainmentNewsListState();
}

class _EntertainmentNewsListState extends State<EntertainmentNewsList> {
  Future<List> getEntertainmentNews() async {
    return await NewsProvider.fetchEntertainmentNews();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.only(top: 10),
      height: 621,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List>(
              future: getEntertainmentNews(),
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
        ),
      ),
    );
  }
}
