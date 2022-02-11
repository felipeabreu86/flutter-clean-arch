import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'remote_articles_event.dart';
part 'remote_articles_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  RemoteArticlesBloc() : super(RemoteArticlesInitial()) {
    on<RemoteArticlesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
