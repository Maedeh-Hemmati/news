import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../domain/entities/responses/breaking_news.dart';
import '../../domain/repositories/news_repository.dart';
import '../../utils/network/network_info.dart';
import '../../utils/resources/error/failures.dart';
import '../datasources/remote/news_api_service.dart';
import '../models/requests/breaking_news.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService remoteDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, BreakingNews>> getBreakingNewsArticles(BreakingNewsRequest breakingNewsRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteNews = await remoteDataSource.getBreakingNewsArticles(
            apiKey: breakingNewsRequest.apiKey,
            country: breakingNewsRequest.category,
            category: breakingNewsRequest.category,
            page: breakingNewsRequest.page,
            pageSize: breakingNewsRequest.pageSize);

        //TODO: check it with out if
        if(remoteNews.response.statusCode == HttpStatus.ok) {
          return Right(remoteNews.data);
        } else {
          throw Left(remoteNews.response);
        }
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
