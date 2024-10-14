import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/parameters/search_parameter.dart';
import 'package:news_app/core/usecases/base_usecase.dart';
import 'package:news_app/feature/News/domain/entities/news.dart';
import 'package:news_app/feature/News/domain/repository/base_news_repository.dart';

class GetSearchUseCase extends BaseUseCase<List<News>, SearchParameter> {
  final BaseNewsRepository baseNewsRepository;

  GetSearchUseCase(this.baseNewsRepository);

  @override
  Future<Either<Failure, List<News>>> call(SearchParameter parameters) async {
    return await baseNewsRepository.getSearch(parameters);
  }
}
