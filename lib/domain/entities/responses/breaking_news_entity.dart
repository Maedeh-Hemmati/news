import 'package:equatable/equatable.dart';

import 'article_entity.dart';

class BreakingNews extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;

  const BreakingNews({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  @override
  List<Object> get props => [status, totalResults, articles];
}
