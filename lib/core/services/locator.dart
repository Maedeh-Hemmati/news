import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/datasources/remote/news_api_service.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../../domain/repositories/news_repository.dart';
import '../../domain/usecases/get_breaking_news_articles_usecase.dart';


final locator = GetIt.instance;

Future<void> initializeDependencies() async {

  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
      requestBody: true));

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<NewsApiService>(
    NewsApiService(locator<Dio>()),
  );

  locator.registerSingleton<NewsRepository>(
   NewsRepositoryImpl (remoteDataSource: locator<NewsApiService>(),),
  );

  locator.registerSingleton<GetBreakingNewsArticlesUseCase>(
    GetBreakingNewsArticlesUseCase(locator<NewsRepository>()),
  );

}

