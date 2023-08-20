import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/model/news.dart';

class NewsProvider with ChangeNotifier {
  List<News>? newsArticleList;
  Future<void> fetchNews(String uri) async {
    try {
      Response response = await get(Uri.parse(uri));
      Map data = jsonDecode(response.body);
      List newsArticles = data["articles"];
      newsArticleList =
          newsArticles.map((articleObj) => News.fromMap(articleObj)).toList();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
