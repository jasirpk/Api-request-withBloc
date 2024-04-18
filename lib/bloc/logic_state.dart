part of 'logic_bloc.dart';

@immutable
sealed class LogicState {}

abstract class PostActionState extends LogicState {}

final class LogicInitial extends LogicState {}

class PostFetchingLoadingState extends LogicState {}

class PostFetchingErrorState extends LogicState {}

class PostFetchingSuccessfullState extends LogicState {
  final List<PostDataUiModel> posts;

  PostFetchingSuccessfullState({required this.posts});
}

class PostAdditionSuccessState extends PostActionState {}

class PostAdditionErrorState extends PostActionState {}
