import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State>
    implements StateStreamable<State> {
  BaseBloc(super.initialState);
}
