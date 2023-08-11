//https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=7673b72b5f884a87a39b1e6296506152
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:news_app/model/news.dart';

class NewsProvider {
  static Future<News> fetchNews() async {
    final String uri =
        "https://newsapi.org/v2/top-headlines/sources?apiKey=7673b72b5f884a87a39b1e6296506152";
    Response response = await get(Uri.parse(uri));
    Map data = jsonDecode(response.body);
    List articles = data["articles"];
    final newRandom = Random();
    var article = articles[newRandom.nextInt(articles.length)];
    News news = News.fromMap(article);
    return news;
  }
}
