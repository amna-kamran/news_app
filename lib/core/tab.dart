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
        width: 110,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 186, 82, 8)
              : const Color.fromARGB(255, 109, 105, 81),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
