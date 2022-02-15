import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arch/src/domain/entities/article.dart';
import 'package:flutter_clean_arch/src/domain/usecases/get_saved_articles_usecase.dart';
import 'package:flutter_clean_arch/src/domain/usecases/remove_article_usecase.dart';
import 'package:flutter_clean_arch/src/domain/usecases/save_article_usecase.dart';

part 'local_articles_event.dart';
part 'local_articles_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  LocalArticlesBloc(
    this._getSavedArticlesUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetAllSavedArticles>(
      _getAllSavedArticles,
      transformer: sequential(),
    );
    on<RemoveArticle>(
      _removeArticle,
      transformer: sequential(),
    );
    on<SaveArticle>(
      _saveArticle,
      transformer: sequential(),
    );
  }

  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  FutureOr<void> _getAllSavedArticles(
    LocalArticlesEvent event,
    Emitter<LocalArticlesState> emit,
  ) async {
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }

  FutureOr<void> _removeArticle(
    LocalArticlesEvent event,
    Emitter<LocalArticlesState> emit,
  ) async {
    if (event.article != null) {
      await _removeArticleUseCase(params: event.article!);
      _getAllSavedArticles(event, emit);
    }
  }

  FutureOr<void> _saveArticle(
    LocalArticlesEvent event,
    Emitter<LocalArticlesState> emit,
  ) async {
    if (event.article != null) {
      await _saveArticleUseCase(params: event.article!);
      _getAllSavedArticles(event, emit);
    }
  }
}
