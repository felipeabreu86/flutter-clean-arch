part of 'remote_articles_bloc.dart';

abstract class RemoteArticlesState extends Equatable {
  const RemoteArticlesState();
  
  @override
  List<Object> get props => [];
}

class RemoteArticlesInitial extends RemoteArticlesState {}
