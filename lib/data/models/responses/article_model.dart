import 'dart:convert';

import '../../../domain/entities/responses/article_entity.dart';
import 'source_model.dart';

class ArticleModel extends Article {
  const ArticleModel({
    String? id,
    String? author,
    SourceModel? source,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) : super(
          id: id,
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json["id"],
      author: json["author"],
      source: json["source"].map((x) => SourceModel.fromJson(x)),
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: DateTime.tryParse(json["publishedAt"]),
      content: json["content"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "author": author,
      "source": source,
      "title": title,
      "description": description,
      "url": url,
      "urlToImage": urlToImage,
      "publishedAt": publishedAt?.toIso8601String(),
      "content": content,
    };
  }
}

ArticleModel articleModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());
