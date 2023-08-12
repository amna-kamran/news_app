import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';

class BreakingNewsCard extends StatefulWidget {
  const BreakingNewsCard({super.key, required this.news});
  final News news;
  @override
  State<BreakingNewsCard> createState() => _BreakingNewsCardState();
}

class _BreakingNewsCardState extends State<BreakingNewsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage(widget.news.imgURL),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: const LinearGradient(colors: [
            Colors.transparent,
            Colors.black,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
    );
  }
}
