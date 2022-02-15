part of 'local_articles_bloc.dart';

abstract class LocalArticlesEvent extends Equatable {
  const LocalArticlesEvent({this.article});

  final Article? article;

  @override
  List<Object?> get props => [article];
}

class GetAllSavedArticles extends LocalArticlesEvent {
  const GetAllSavedArticles();
}

class RemoveArticle extends LocalArticlesEvent {
  const RemoveArticle(Article article) : super(article: article);
}

class SaveArticle extends LocalArticlesEvent {
  const SaveArticle(Article article) : super(article: article);
}
