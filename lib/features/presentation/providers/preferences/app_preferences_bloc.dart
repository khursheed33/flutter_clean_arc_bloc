import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arc_bloc/features/presentation/base/base_states.dart';

import '../../base/base_model.dart';

part 'app_preferences_event.dart';
part 'app_preferences_state.dart';

class AppPreferencesBloc extends BaseBloc<dynamic, BaseState> {
  AppPreferencesBloc() : super(InitialState("Initial message"));
}
