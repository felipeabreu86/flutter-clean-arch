import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/src/core/bloc/block_with_state.dart';
import 'package:flutter_clean_arch/src/core/params/article_request.dart';
import 'package:flutter_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_clean_arch/src/domain/entities/article.dart';
import 'package:flutter_clean_arch/src/domain/usecases/get_articles_usecase.dart';

part 'remote_articles_event.dart';
part 'remote_articles_state.dart';

class RemoteArticlesBloc
    extends BlocWithState<RemoteArticlesEvent, RemoteArticlesState> {
  RemoteArticlesBloc(this._getArticlesUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(
      _getBreakingNewsArticle,
      transformer: sequential(),
    );
  }

  final GetArticlesUseCase _getArticlesUseCase;

  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 20;

  FutureOr<void> _getBreakingNewsArticle(
    RemoteArticlesEvent event,
    Emitter<RemoteArticlesState> emit,
  ) async {
    final dataState =
        await _getArticlesUseCase(params: ArticlesRequestParams(page: _page));

    if (dataState is DataSuccess && (dataState.data?.isNotEmpty ?? false)) {
      final articles = dataState.data;
      final noMoreData = articles!.length < _pageSize;
      _articles.addAll(articles);
      _page++;
      emit(RemoteArticlesDone(_articles, noMoreData: noMoreData));
    } else if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error));
    }
  }
}
