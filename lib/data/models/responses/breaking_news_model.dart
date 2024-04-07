import 'dart:convert';

import '../../../domain/entities/responses/breaking_news_entity.dart';
import 'article_model.dart';

class BreakingNewsModel extends BreakingNews {
  const BreakingNewsModel({
    required String status,
    required int totalResults,
    required List<ArticleModel> articles,
  }) : super(
    status: status,
    totalResults: totalResults,
    articles: articles,
  );

  factory BreakingNewsModel.fromJson(Map<String, dynamic> json) {

    List<ArticleModel> articles = List<ArticleModel>.from(
      json["articles"].map((x) => ArticleModel.fromJson(x)),
    );
    return BreakingNewsModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: articles,
    );
  }
}

BreakingNewsModel sourceModelFromJson(String str) =>
    BreakingNewsModel.fromJson(json.decode(str));

