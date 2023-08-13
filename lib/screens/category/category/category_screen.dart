import 'package:flutter/material.dart';
import 'package:news_app/services/news_provider.dart';
import 'widgets/category_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Future<List> getGeneralNews() async {
    return await NewsProvider.fetchGeneralNews();
  }

  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "News from all over the world.",
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
            CategoryBar(),
          ],
        ),
      )),
    );
  }
}
