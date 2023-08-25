import 'package:flutter/material.dart';
import 'package:news_app/constants/spaces.dart';
import 'package:news_app/model/news.dart';

class NewsContainer extends StatelessWidget {
  final News news;
  const NewsContainer({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spaces.h80,
          Text(
            news.newsTitle,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(news.datePublished),
              Text(news.publishedBy),
            ],
          ),
          Spaces.h20,
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              news.imgURL,
            ),
          ),
          Spaces.h15,
          Text(news.newsBody),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Read More"),
          ),
        ],
      ),
    );
  }
}
