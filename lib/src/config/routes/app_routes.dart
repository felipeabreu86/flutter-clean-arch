import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/src/domain/entities/article.dart';
import 'package:flutter_clean_arch/src/presentation/views/article_details_view.dart';
import 'package:flutter_clean_arch/src/presentation/views/breaking_news_view.dart';
import 'package:flutter_clean_arch/src/presentation/views/saved_articles_view.dart';

class AppRoutes {
  Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(
          const BreakingNewsView(),
        );
      case '/ArticleDetailsView':
        return _materialRoute(
          ArticleDetailsView(article: settings.arguments! as Article),
        );
      case '/SavedArticlesView':
        return _materialRoute(
          const SavedArticlesView(),
        );
    }
    throw Exception("Page not found.");
  }

  Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
