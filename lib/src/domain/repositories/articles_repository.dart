import 'package:flutter_clean_arch/src/core/params/article_request.dart';
import 'package:flutter_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_clean_arch/src/domain/entities/article.dart';

abstract class ArticlesRepository {
  // API Methods
  Future<DataState<List<Article>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  );

  // Database methods
  Future<List<Article>> getSavedArticles();

  Future<void> saveArticle(Article article);

  Future<void> removeArticle(Article article);
}
