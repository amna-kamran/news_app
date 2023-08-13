import 'package:flutter/material.dart';

import 'package:news_app/core/news_tile.dart';
import 'package:news_app/services/news_provider.dart';

class GeneralNewsList extends StatefulWidget {
  const GeneralNewsList({
    super.key,
  });
  @override
  State<GeneralNewsList> createState() => _GeneralNewsListState();
}

class _GeneralNewsListState extends State<GeneralNewsList> {
  Future<List> getTechNews() async {
    return await NewsProvider.fetchTechnologyNews();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      margin: EdgeInsets.only(top: 10),
      height: 621,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List>(
              future: getTechNews(),
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
