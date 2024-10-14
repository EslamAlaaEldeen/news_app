import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/parameters/search_parameter.dart';
import 'package:news_app/feature/News/data/datasource/news_data_source.dart';
import 'package:news_app/feature/News/domain/entities/news.dart';
import 'package:news_app/feature/News/domain/repository/base_news_repository.dart';

class NewsRepository extends BaseNewsRepository {
  final BaseNewsRemoteDataSource baseNewsRemoteDataSource;

  NewsRepository(this.baseNewsRemoteDataSource);

  @override
  Future<Either<Failure, List<News>>> getBusiness() async {
    final result = await baseNewsRemoteDataSource.getBusiness();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<News>>> getScience() async {
    final result = await baseNewsRemoteDataSource.getScience();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<News>>> getSports() async {
    final result = await baseNewsRemoteDataSource.getSports();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<News>>> getSearch(
      SearchParameter parameters) async {
    final result = await baseNewsRemoteDataSource.getSearch(parameters);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
