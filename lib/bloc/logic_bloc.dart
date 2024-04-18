import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:public_api_bloc/models/post_data_ui_model.dart';
import 'package:public_api_bloc/repository/posts_repo.dart';

part 'logic_event.dart';
part 'logic_state.dart';

class LogicBloc extends Bloc<LogicEvent, LogicState> {
  LogicBloc() : super(LogicInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }
  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<LogicState> emit) async {
    emit(PostFetchingLoadingState());
    List<PostDataUiModel> posts = await PostRepo.fecthPosts();

    emit(PostFetchingSuccessfullState(posts: posts));
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<LogicState> emit) async {
    bool success = await PostRepo.AddPosts();
    if (success) {
      print(success);
      emit(PostAdditionSuccessState());
    } else {
      emit(PostFetchingErrorState());
    }
  }
}
