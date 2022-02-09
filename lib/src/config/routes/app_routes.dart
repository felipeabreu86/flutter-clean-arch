import 'package:flutter/material.dart';

class AppRoutes {
  Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const Home());
      case '/ArticleDetailsView':
        return _materialRoute(
          ArticleDetailsView(article: settings.arguments! as Article),
        );
      case '/SavedArticlesView':
        return _materialRoute(const SavedArticlesView());
    }
    throw Exception("Page not found.");
  }

  Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

/// TODO : REMOVE

class Article {}

class ArticleDetailsView extends StatefulWidget {
  const ArticleDetailsView({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  _ArticleDetailsViewState createState() => _ArticleDetailsViewState();
}

class _ArticleDetailsViewState extends State<ArticleDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SavedArticlesView extends StatefulWidget {
  const SavedArticlesView({Key? key}) : super(key: key);

  @override
  _SavedArticlesViewState createState() => _SavedArticlesViewState();
}

class _SavedArticlesViewState extends State<SavedArticlesView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
