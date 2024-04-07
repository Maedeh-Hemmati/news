import 'package:equatable/equatable.dart';

import 'source.dart';

class Article extends Equatable {
  final String? id;
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  const Article({this.id, this.author, this.source, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

  @override
  List<Object?> get props => [
        id,
        author,
        source,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
