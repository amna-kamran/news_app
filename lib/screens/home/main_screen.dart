import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants/spaces.dart';

import 'package:news_app/screens/home/widget/breaking_news_carousal.dart';
import 'package:news_app/services/news_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final date = DateTime.now();

  Future<List> getNews() async {
    return await NewsProvider.fetchBreakingNews();
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE, d MMM, yyyy').format(date).toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                Spaces.h5,
                const Text(
                  "Breaking News",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                ),
                Spaces.h15,
                BreakingNewsCarousal(
                  news: getNews(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
