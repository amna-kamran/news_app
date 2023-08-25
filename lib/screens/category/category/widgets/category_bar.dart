import 'package:flutter/material.dart';
import 'package:news_app/constants/spaces.dart';
import 'package:news_app/core/tab.dart';
import 'package:news_app/services/news_provider.dart';
import 'package:provider/provider.dart';
import 'category_screens/business_news_list.dart';
import 'category_screens/entertainment_news_list.dart';
import 'category_screens/technology_news_list.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({Key? key}) : super(key: key);

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  static const List<String> titles = [
    "Technology",
    "Entertainment",
    "Business",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appState = NewsProvider.s(context);
    final app = Provider.of<NewsProvider>(context, listen: true);

    Widget selectedNewsScreen() {
      if (app.selectedTabIndex == 0) {
        return const TechnologyNews();
      } else if (app.selectedTabIndex == 1) {
        return const EntertainmentNews();
      } else if (app.selectedTabIndex == 2) {
        return const BusinessNews();
      }
      return Container();
    }

    Spaces.w5;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final e in titles)
                  Taptab(
                    name: e,
                    isSelected: titles.indexOf(e) == appState.selectedTabIndex,
                    index: titles.indexOf(e),
                  ),
              ],
            ),
          ),
        ),
        selectedNewsScreen()
      ],
    );
  }
}
