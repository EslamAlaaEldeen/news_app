import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/usecases/base_usecase.dart';
import 'package:news_app/feature/News/domain/entities/news.dart';
import 'package:news_app/feature/News/domain/repository/base_news_repository.dart';

class GetBusinessUseCase extends BaseUseCase<List<News>, NoParameters> {
  final BaseNewsRepository baseNewsRepository;

  GetBusinessUseCase(this.baseNewsRepository);

  @override
  Future<Either<Failure, List<News>>> call(NoParameters parameters) async {
    return await baseNewsRepository.getBusiness();
  }
}
