part of 'app_preferences_bloc.dart';

sealed class AppPreferencesState extends Equatable {
  const AppPreferencesState();
  
  @override
  List<Object> get props => [];
}

final class AppPreferencesInitial extends AppPreferencesState {}
