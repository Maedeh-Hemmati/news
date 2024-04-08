import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/requests/breaking_news.dart';
import '../../domain/entities/responses/article_entity.dart';
import '../../domain/usecases/get_breaking_news_articles_usecase.dart';
import '../../core/constants/nums.dart';
import '../../core/error/failures.dart';

part 'remote_articles_state.dart';

class RemoteArticleCubit extends Cubit<RemoteArticlesState> {
  final GetBreakingNewsArticlesUseCase _getBreakingNewsArticlesUseCase;

  RemoteArticleCubit(this._getBreakingNewsArticlesUseCase) : super(const RemoteArticlesLoading());

  static RemoteArticleCubit get(BuildContext context) => BlocProvider.of(context);

  int _page = 1;

  Future<void> getBreakingNewsArticles() async {
    emit(const RemoteArticlesLoading());
    try {
      final result = await _getBreakingNewsArticlesUseCase.call(BreakingNewsRequest(page: _page));
      result.fold(
              (failure) => emit(RemoteArticlesFailed(error: failure)),
              (news) {
        final noMoreData = news.articles.length < defaultPageSize;
        _page++;
        emit(RemoteArticlesSuccess(articles: news.articles, noMoreData: noMoreData));
      });
    } catch (e) {
      emit(RemoteArticlesFailed(error: ExceptionFailure()));
    }
  }
}
