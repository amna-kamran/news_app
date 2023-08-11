// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app/constants/spaces.dart';

class NewsContainer extends StatelessWidget {
  final String imgURL;
  final String newsTitle;
  final String newsBody;
  final String datePublished;
  final String publishedBy;
  const NewsContainer({
    Key? key,
    required this.imgURL,
    required this.newsTitle,
    required this.newsBody,
    required this.datePublished,
    required this.publishedBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spaces.h80,
          Text(
            newsTitle,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(datePublished),
              Text(publishedBy),
            ],
          ),
          Spaces.h20,
          Image.network(imgURL),
          Text(newsBody),
          ElevatedButton(
            onPressed: () {},
            child: Text("Read More"),
          ),
        ],
      ),
    );
  }
}
