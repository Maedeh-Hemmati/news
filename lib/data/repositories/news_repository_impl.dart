import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/responses/breaking_news_entity.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/remote/news_api_service.dart';
import '../models/requests/breaking_news.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService remoteDataSource;

  NewsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, BreakingNews>> getBreakingNewsArticles(BreakingNewsRequest breakingNewsRequest) async {
    try {
      final remoteNews = await remoteDataSource.getBreakingNewsArticles
        (apiKey: breakingNewsRequest.apiKey,
          country: breakingNewsRequest.country,
          category: breakingNewsRequest.category,
          page: breakingNewsRequest.page,
          pageSize: breakingNewsRequest.pageSize);

      //TODO: check it with out if
      if (remoteNews.response.statusCode == HttpStatus.ok) {
        return Right(remoteNews.data);
      } else {
        throw Left(remoteNews.response);
      }
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
