import 'package:flutter_clean_arch/src/core/usecases/usecase.dart';
import 'package:flutter_clean_arch/src/domain/entities/article.dart';
import 'package:flutter_clean_arch/src/domain/repositories/articles_repository.dart';

class GetSavedArticlesUseCase implements UseCase<List<Article>, void> {
  GetSavedArticlesUseCase(this._articlesRepository);

  final ArticlesRepository _articlesRepository;

  @override
  Future<List<Article>> call({void params}) {
    return _articlesRepository.getSavedArticles();
  }
}
