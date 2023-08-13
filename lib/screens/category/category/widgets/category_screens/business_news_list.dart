import 'package:flutter/material.dart';

import 'package:news_app/core/news_tile.dart';
import 'package:news_app/services/news_provider.dart';

class BusinessNewsList extends StatefulWidget {
  const BusinessNewsList({
    super.key,
  });
  @override
  State<BusinessNewsList> createState() => _BusinessNewsListState();
}

class _BusinessNewsListState extends State<BusinessNewsList> {
  Future<List> getBusinessNews() async {
    return await NewsProvider.fetchBusinessNews();
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
              future: getBusinessNews(),
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
