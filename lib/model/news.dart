// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class News {
  final String imgURL;
  final String newsTitle;
  final String newsBody;
  final String datePublished;
  final String publishedBy;
  News({
    required this.imgURL,
    required this.newsTitle,
    required this.newsBody,
    required this.datePublished,
    required this.publishedBy,
  });

  News copyWith({
    String? imgURL,
    String? newsTitle,
    String? newsBody,
    String? datePublished,
    String? publishedBy,
  }) {
    return News(
      imgURL: imgURL ?? this.imgURL,
      newsTitle: newsTitle ?? this.newsTitle,
      newsBody: newsBody ?? this.newsBody,
      datePublished: datePublished ?? this.datePublished,
      publishedBy: publishedBy ?? this.publishedBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imgURL': imgURL,
      'newsTitle': newsTitle,
      'newsBody': newsBody,
      'datePublished': datePublished,
      'publishedBy': publishedBy,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      imgURL: map['imgURL'] as String,
      newsTitle: map['newsTitle'] as String,
      newsBody: map['newsBody'] as String,
      datePublished: map['datePublished'] as String,
      publishedBy: map['publishedBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) =>
      News.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'News(imgURL: $imgURL, newsTitle: $newsTitle, newsBody: $newsBody, datePublished: $datePublished, publishedBy: $publishedBy)';
  }

  @override
  bool operator ==(covariant News other) {
    if (identical(this, other)) return true;

    return other.imgURL == imgURL &&
        other.newsTitle == newsTitle &&
        other.newsBody == newsBody &&
        other.datePublished == datePublished &&
        other.publishedBy == publishedBy;
  }

  @override
  int get hashCode {
    return imgURL.hashCode ^
        newsTitle.hashCode ^
        newsBody.hashCode ^
        datePublished.hashCode ^
        publishedBy.hashCode;
  }
}
