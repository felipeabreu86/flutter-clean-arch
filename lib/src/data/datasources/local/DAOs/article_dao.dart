import 'package:floor/floor.dart';
import 'package:flutter_clean_arch/src/core/utils/constants.dart';
import 'package:flutter_clean_arch/src/domain/entities/article.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * FROM $kArticlesTableName')
  Future<List<Article>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);

  @delete
  Future<void> deleteArticle(Article article);
}
