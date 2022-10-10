import 'package:flutter_application_new/source.dart';

class News {
  late Source source;
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  News.fromMap(Map<String, dynamic> map) {
    source = Source.fromMap(map['source']);
    author = map['author'];
    title = map['title'];
    description = map['description'];
    url = map['url'];
    urlToImage = map['urlToImage'];
    publishedAt = map['publishedAt'];
    content = map['content'];
  }
}
