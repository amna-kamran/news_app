import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/constants/spaces.dart';
import 'package:news_app/screens/category/category/category_screen.dart';
import 'package:news_app/screens/home/home.dart';

class FloatingBar extends StatefulWidget {
  const FloatingBar({super.key});

  @override
  State<FloatingBar> createState() => _FloatingBarState();
}

class _FloatingBarState extends State<FloatingBar> {
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
                padding: const EdgeInsets.all(20.0),
                height: 65.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: icons.length,
                  separatorBuilder: (context, index) => Spaces.w30,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => setState(() {
                        currentIndex = index;
                      }),
                      child: SvgPicture.asset(
                        icons[index],
                        color: currentIndex == index
                            ? Colors.black
                            : const Color.fromARGB(255, 126, 126, 126),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
