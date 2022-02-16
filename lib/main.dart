import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/src/config/routes/app_routes.dart';
import 'package:flutter_clean_arch/src/config/themes/app_theme.dart';
import 'package:flutter_clean_arch/src/core/utils/constants.dart';
import 'package:flutter_clean_arch/src/injector.dart';
import 'package:flutter_clean_arch/src/presentation/blocs/remote_articles/remote_articles_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(ArticlesApp());
}

class ArticlesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (_) => injector()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        onGenerateRoute: onGenerateRoutes,
        theme: AppTheme().light,
      ),
    );
  }
}
