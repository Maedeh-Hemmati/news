import 'package:dartz/dartz.dart';

import '../../data/models/requests/breaking_news.dart';
import '../../core/error/failures.dart';
import '../entities/responses/breaking_news_entity.dart';

abstract class NewsRepository {
  Future<Either<Failure, BreakingNews>> getBreakingNewsArticles(BreakingNewsRequest breakingNewsRequest);
}
