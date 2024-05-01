import 'package:flutter_clean_arc_bloc/features/data/repositories/user_preferences_repo_impl.dart';
import 'package:flutter_clean_arc_bloc/index.dart';

/// `DiRepositories` class responsible to register and inject all types of repositories and their implementations.

class DiRepositories {
  final GetIt locator;
  DiRepositories({required this.locator}) {
    locator.registerFactory<ConnectivityRepository>(
      () => ConnectivityRepositoryImpl(
        datasource: locator.call(),
      ),
    );

    locator.registerFactory<UserPreferencesRepository>(
      () => UserPreferencesRepositoryImpl(
        datasource: locator.call(),
        safeApiCall: locator.call(),
      ),
    );
  }
}
