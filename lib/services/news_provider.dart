//https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=7673b72b5f884a87a39b1e6296506152
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NewsProvider {
  static fetchNews() async {
    final String uri =
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=7673b72b5f884a87a39b1e6296506152";
    Response response = await get(Uri.parse(uri));
    Map data = jsonDecode(response.body);
    debugPrint(data.toString());
  }
}
