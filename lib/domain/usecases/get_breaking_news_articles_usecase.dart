import 'package:dartz/dartz.dart';
import '../../data/models/requests/breaking_news.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/responses/breaking_news_entity.dart';
import '../repositories/news_repository.dart';

class GetBreakingNewsArticlesUseCase implements UseCase<BreakingNews, BreakingNewsRequest> {
  final NewsRepository repository;
  GetBreakingNewsArticlesUseCase(this.repository);

  @override
  Future<Either<Failure, BreakingNews>> call(BreakingNewsRequest breakingNewsRequest) async {
    return await repository.getBreakingNewsArticles(breakingNewsRequest);
  }
}
