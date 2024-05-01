import 'package:flutter_clean_arc_bloc/features/presentation/providers/preferences/app_preferences_bloc.dart';
import 'package:flutter_clean_arc_bloc/index.dart';

class DiViewModels {
  final GetIt locator;
  DiViewModels({required this.locator}) {
    locator.registerLazySingleton<AppPreferencesBloc>(
      () => AppPreferencesBloc(),
    );
  }
}
