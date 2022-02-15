part of 'local_articles_bloc.dart';

abstract class LocalArticlesState extends Equatable {
  const LocalArticlesState({this.articles});

  final List<Article>? articles;

  @override
  List<Object?> get props => [articles];
}

class LocalArticlesLoading extends LocalArticlesState {
  const LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticlesState {
  const LocalArticlesDone(List<Article> articles) : super(articles: articles);
}
