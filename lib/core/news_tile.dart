import 'package:flutter/material.dart';
import 'package:news_app/core/page.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/constants/spaces.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsPage(
              news: news,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                      image: NetworkImage(news.imgURL), fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Spaces.w15,
            Flexible(
              flex: 5,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 75,
                    child: Text(
                      news.newsTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Spaces.h5,
                  Text(
                    news.newsBody,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
