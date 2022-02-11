import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'local_articles_event.dart';
part 'local_articles_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  LocalArticlesBloc() : super(LocalArticlesInitial()) {
    on<LocalArticlesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
