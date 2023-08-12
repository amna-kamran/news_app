import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/model/news.dart';

class BreakingNewsProvider {
  static Future<List> fetchBreakingNews() async {
    const String uri =
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=7673b72b5f884a87a39b1e6296506152";
    Response response = await get(Uri.parse(uri));
    Map data = jsonDecode(response.body);
    List newsArticles = data["articles"];
    List<News> newsArticleList =
        newsArticles.map((articleObj) => News.fromMap(articleObj)).toList();
    return newsArticleList;
  }

  static Future<List> fetchTopNews() async {
    const String uri =
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=7673b72b5f884a87a39b1e6296506152";
    Response response = await get(Uri.parse(uri));
    Map data = jsonDecode(response.body);
    List newsArticles = data["articles"];
    List<News> newsArticleList =
        newsArticles.map((articleObj) => News.fromMap(articleObj)).toList();
    return newsArticleList;
  }
}
