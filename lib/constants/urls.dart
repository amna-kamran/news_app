class URL {
  static String getURL(String name) {
    return 'http://newsapi.org/v2/top-headlines?'
        'category=$name&'
        'language=en&'
        'apiKey=7673b72b5f884a87a39b1e6296506152';
  }

  static const breakingNews =
      "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=7673b72b5f884a87a39b1e6296506152";
}
