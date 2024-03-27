import 'package:dartz/dartz.dart';

import '../../data/models/requests/breaking_news.dart';
import '../../utils/resources/error/failures.dart';
import '../entities/responses/breaking_news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<BreakingNews>>> getBreakingNewsArticles(BreakingNewsRequest breakingNewsRequest);
}
