import 'package:flutter/material.dart';
import 'package:news_app/services/news_provider.dart';
import 'package:provider/provider.dart';

class Taptab extends StatelessWidget {
  final bool isSelected;
  final String name;
  final int index;
  const Taptab(
      {required this.index,
      this.isSelected = false,
      required this.name,
      super.key});
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<NewsProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        app.changeTab(index);
      },
      child: Container(
        height: 50,
        width: 115,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 122, 172, 212)
              : const Color.fromARGB(255, 82, 82, 81),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
