part of 'local_articles_bloc.dart';

abstract class LocalArticlesState extends Equatable {
  const LocalArticlesState();
  
  @override
  List<Object> get props => [];
}

class LocalArticlesInitial extends LocalArticlesState {}
