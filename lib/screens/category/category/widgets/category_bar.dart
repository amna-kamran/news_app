import 'package:flutter/material.dart';
import '../../../../constants/urls.dart';
import '../../../../core/news_list.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({super.key});

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  static const List<String> titles = [
    "General",
    "Entertainment",
    "Business",
  ];
  static const List<Widget> views = [
    NewsList(url: URL.technologyNews),
    NewsList(url: URL.entertainmentNews),
    NewsList(
      url: URL.businessNews,
    ),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const smallWidth = SizedBox(
      width: 5,
    );
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: buildCardRow(smallWidth),
            ),
          ),
        ),
        views[currentIndex],
      ],
    );
  }

  List<Widget> buildCardRow(Widget separator) {
    List<Widget> columns = titles
        .asMap()
        .entries
        .map((entry) => GestureDetector(
              onTap: () => setState(() {
                currentIndex = entry.key;
              }),
              child: currentIndex == entry.key
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF535357),
                      ),
                      child: Text(
                        entry.value,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                      ),
                      child: Text(
                        entry.value,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ))
        .toList();

    return columns;
  }
}
