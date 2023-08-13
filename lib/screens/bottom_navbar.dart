import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/constants/spaces.dart';
import 'package:news_app/screens/category/category/category_screen.dart';
import 'package:news_app/screens/home/home.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> views = [
    const HomeScreen(),
    const CategoryScreen(),
  ];
  final List<String> icons = [
    'assets/svgs/home.svg',
    'assets/svgs/Search.svg',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            views[currentIndex],
            Positioned(
              bottom: 40,
              left: 50,
              right: 50,
              child: Container(
                height: 65.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateIconsWithSeparator(icons, Spaces.w30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateIconsWithSeparator(
      List<String> icons, Widget separator) {
    List<Widget> iconWidgets = icons
        .asMap()
        .entries
        .map((entry) => GestureDetector(
              onTap: () => setState(() {
                currentIndex = entry.key;
              }),
              child: SvgPicture.asset(
                entry.value,
                color: currentIndex == entry.key
                    ? Colors.black
                    : Color.fromARGB(255, 126, 126, 126),
              ),
            ))
        .toList();
    List<Widget> widgetsWithSeparator =
        iconWidgets.expand((widget) => [widget, separator]).toList();
    widgetsWithSeparator.removeLast();
    return widgetsWithSeparator;
  }
}
