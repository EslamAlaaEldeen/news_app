import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String title;
  final String backdropPath;
  final String author;
  final String date;
  final String url;

  const News(
      {required this.title,
      required this.backdropPath,
      required this.author,
      required this.date,
      required this.url});

  @override
  List<Object> get props => [title, backdropPath, author, date, url];
}
