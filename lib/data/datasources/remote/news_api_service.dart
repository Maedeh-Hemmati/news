import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/constants/strings.dart';
import '../../models/responses/breaking_news_model.dart';
part 'news_api_service.g.dart';
@RestApi(baseUrl: baseUrl, parser: Parser.JsonSerializable)
abstract class NewsApiService{
  factory NewsApiService(Dio dio,{String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<BreakingNewsModel>> getBreakingNewsArticles({
 @Query('apiKey') String? apiKey,
 @Query('country') String? country,
 @Query('category') String? category,
 @Query('page') int? page,
 @Query('pageSize') int? pageSize,
});
}