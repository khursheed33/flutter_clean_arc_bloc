import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends BaseState {
  final String message;
  InitialState(this.message);
}

class LoadingState extends BaseState {}

class ErrorState extends BaseState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class DataState<T> extends BaseState {
  final T data;

  DataState(this.data);

  @override
  List<Object?> get props => [data];
}
