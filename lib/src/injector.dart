import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/src/core/utils/constants.dart';
import 'package:flutter_clean_arch/src/data/datasources/local/app_database.dart';
import 'package:flutter_clean_arch/src/data/datasources/remote/news_api_service.dart';
import 'package:flutter_clean_arch/src/data/repositories/articles_repository_impl.dart';
import 'package:flutter_clean_arch/src/domain/repositories/articles_repository.dart';
import 'package:flutter_clean_arch/src/domain/usecases/get_articles_usecase.dart';
import 'package:flutter_clean_arch/src/presentation/blocs/remote_articles/remote_articles_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Database
  final database =
      await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  injector.registerSingleton<AppDatabase>(database);

  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<NewsApiService>(
    NewsApiService(injector()),
  );
  injector.registerSingleton<ArticlesRepository>(
    ArticlesRepositoryImpl(injector(), injector()),
  );

  // UseCases
  injector.registerSingleton<GetArticlesUseCase>(
    GetArticlesUseCase(injector()),
  );

  // Blocs
  injector.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(injector()),
  );
}
