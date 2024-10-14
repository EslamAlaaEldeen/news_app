import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/parameters/search_parameter.dart';
import 'package:news_app/feature/News/domain/entities/news.dart';

abstract class BaseNewsRepository {
  Future<Either<Failure, List<News>>> getBusiness();
  Future<Either<Failure, List<News>>> getSports();
  Future<Either<Failure, List<News>>> getScience();
  Future<Either<Failure, List<News>>> getSearch(SearchParameter parameters);
}
