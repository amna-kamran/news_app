import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/model/news.dart';

class NewsProvider {
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
    const String uri = 'http://newsapi.org/v2/top-headlines?'
        'category=general&'
        'language=en&'
        'pageSize=30&'
        'apiKey=7673b72b5f884a87a39b1e6296506152';
    Response response = await get(Uri.parse(uri));
    Map data = jsonDecode(response.body);
    List newsArticles = data["articles"];
    List<News> newsArticleList =
        newsArticles.map((articleObj) => News.fromMap(articleObj)).toList();
    return newsArticleList;
  }

  static Future<List> fetchTechnologyNews() async {
    const String uri = 'http://newsapi.org/v2/top-headlines?'
        'country=us&'
        'category=technology&'
        'language=en&'
        'pageSize=30&'
        'apiKey=7673b72b5f884a87a39b1e6296506152';
    Response response = await get(Uri.parse(uri));
    Map data = jsonDecode(response.body);
    List newsArticles = data["articles"];
    List<News> newsArticleList =
        newsArticles.map((articleObj) => News.fromMap(articleObj)).toList();
    return newsArticleList;
  }

  static Future<List> fetchEntertainmentNews() async {
    const String uri = 'http://newsapi.org/v2/top-headlines?'
        'category=entertainment&'
        'language=en&'
        'pageSize=30&'
        'apiKey=7673b72b5f884a87a39b1e6296506152';
    Response response = await get(Uri.parse(uri));
    Map data = jsonDecode(response.body);
    List newsArticles = data["articles"];
    List<News> newsArticleList =
        newsArticles.map((articleObj) => News.fromMap(articleObj)).toList();
    return newsArticleList;
  }

  static Future<List> fetchBusinessNews() async {
    const String uri = 'http://newsapi.org/v2/top-headlines?'
        'category=business&'
        'language=en&'
        'pageSize=30&'
        'apiKey=7673b72b5f884a87a39b1e6296506152';
    Response response = await get(Uri.parse(uri));
    Map data = jsonDecode(response.body);
    List newsArticles = data["articles"];
    List<News> newsArticleList =
        newsArticles.map((articleObj) => News.fromMap(articleObj)).toList();
    return newsArticleList;
  }
}
