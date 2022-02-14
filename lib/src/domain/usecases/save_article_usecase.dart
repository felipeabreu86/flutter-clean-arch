import 'package:flutter_clean_arch/src/core/usecases/usecase.dart';
import 'package:flutter_clean_arch/src/domain/entities/article.dart';
import 'package:flutter_clean_arch/src/domain/repositories/articles_repository.dart';

class SaveArticleUseCase implements UseCase<void, Article> {
  SaveArticleUseCase(this._articlesRepository);

  final ArticlesRepository _articlesRepository;

  @override
  Future<void> call({required Article params}) {
    return _articlesRepository.saveArticle(params);
  }
}
