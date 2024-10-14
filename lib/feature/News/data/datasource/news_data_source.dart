import 'package:dio/dio.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/network/api_constance.dart';
import 'package:news_app/core/network/error_messages.dart';
import 'package:news_app/core/parameters/search_parameter.dart';
import 'package:news_app/feature/News/data/models/news_model.dart';

abstract class BaseNewsRemoteDataSource {
  Future<List<NewsModel>> getBusiness();
  Future<List<NewsModel>> getSports();
  Future<List<NewsModel>> getScience();
  Future<List<NewsModel>> getSearch(SearchParameter parameters);
}

class NewsRemoteDataSource extends BaseNewsRemoteDataSource {
  @override
  Future<List<NewsModel>> getBusiness() async {
    final response = await Dio().get(ApiConstance.businessPath);
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data['articles'] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<NewsModel>> getScience() async {
    final response = await Dio().get(ApiConstance.sciencePath);
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data['articles'] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<NewsModel>> getSports() async {
    final response = await Dio().get(ApiConstance.sportsPath);
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data['articles'] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<NewsModel>> getSearch(SearchParameter parameters) async {
    final response = await Dio().get(ApiConstance.searchPath(parameters.value));
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data['articles'] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }
}
