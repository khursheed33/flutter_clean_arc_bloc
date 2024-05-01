import 'package:flutter_clean_arc_bloc/features/presentation/providers/preferences/app_preferences_bloc.dart';
import 'package:flutter_clean_arc_bloc/index.dart';

/// The class AppProviders provides a list of providers for the app

abstract class AppBlocs {
  static final appBlocs = [
    BlocProvider<AppPreferencesBloc>(
      create: (_) => locator<AppPreferencesBloc>(),
    ),
  ];
}
