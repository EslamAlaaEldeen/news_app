import 'package:news_app/feature/News/domain/entities/news.dart';

class NewsModel extends News {
  const NewsModel(
      {required super.title,
      required super.backdropPath,
      required super.date,
      required super.url,
      required super.author});
  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
      title: json['title'] ?? 'No Title',
      backdropPath: json['urlToImage'] ?? '',
      date: json['publishedAt'] ?? 'Unknown Date',
      url: json['url'] ?? '',
      author: json['author'] ?? 'UnKnown');
}
