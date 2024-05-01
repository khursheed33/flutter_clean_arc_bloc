import 'package:flutter_bloc/flutter_bloc.dart';

/// An abstract class that serves as the base for Bloc classes.
///
/// A Bloc is responsible for holding the state and business logic for a specific view in your app.
/// It extends [Bloc] from the flutter_bloc package to manage the state and events.
/// To create a custom Bloc, extend this [BaseBloc] class and implement its abstract methods.
///
/// Example:
/// ```dart
/// class CounterBloc extends BaseBloc<CounterEvent, CounterState> {
///   CounterBloc() : super(CounterState());
///
///   @override
///   Stream<CounterState> mapEventToState(CounterEvent event) async* {
///     if (event is IncrementEvent) {
///       yield state.copyWith(counter: state.counter + 1);
///     }
///   }
/// }
/// ```
abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(super.initialState);

  @override
  void onEvent(Event event) {
    super.onEvent(event);
    // Handle any global event logging here
  }

  @override
  void onChange(Change<State> change) {
    super.onChange(change);
    // Handle any global state changes here
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    // Handle any global error logging here
  }
}
