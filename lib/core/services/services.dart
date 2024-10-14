import 'package:get_it/get_it.dart';
import 'package:news_app/feature/News/data/datasource/news_data_source.dart';
import 'package:news_app/feature/News/data/repository/news_repository.dart';
import 'package:news_app/feature/News/domain/repository/base_news_repository.dart';
import 'package:news_app/feature/News/domain/usecase/get_business_usecase.dart';
import 'package:news_app/feature/News/domain/usecase/get_science_usecase.dart';
import 'package:news_app/feature/News/domain/usecase/get_search_usecase.dart';
import 'package:news_app/feature/News/domain/usecase/get_sports_usecase.dart';
import 'package:news_app/feature/News/presentation/controller/business/business_bloc.dart';
import 'package:news_app/feature/News/presentation/controller/science/science_bloc.dart';
import 'package:news_app/feature/News/presentation/controller/search/search_bloc.dart';
import 'package:news_app/feature/News/presentation/controller/sports/sports_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Data Source
    sl.registerLazySingleton<BaseNewsRemoteDataSource>(
        () => NewsRemoteDataSource());

    /// Repository
    sl.registerLazySingleton<BaseNewsRepository>(() => NewsRepository(sl()));

    ///Use Cases
    sl.registerLazySingleton(() => GetBusinessUseCase(sl()));
    sl.registerLazySingleton(() => GetSportsUseCase(sl()));
    sl.registerLazySingleton(() => GetScienceUseCase(sl()));
    sl.registerLazySingleton(() => GetSearchUseCase(sl()));

    ///Bloc
    sl.registerFactory(() => BusinessBloc(sl()));
    sl.registerFactory(() => SportsBloc(sl()));
    sl.registerFactory(() => ScienceBloc(sl()));
    sl.registerFactory(() => SearchBloc(sl()));
  }
}
