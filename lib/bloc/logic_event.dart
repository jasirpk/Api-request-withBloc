part of 'logic_bloc.dart';

@immutable
abstract class LogicEvent {}

class PostInitialFetchEvent extends LogicEvent {}

class PostAddEvent extends LogicEvent {}
