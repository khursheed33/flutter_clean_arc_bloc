import 'package:flutter_clean_arc_bloc/index.dart';

/// `DiRepositories` class responsible to register and inject all types of repositories and their implementations.

class DiUsecases {
  final GetIt locator;
  DiUsecases({required this.locator}) {
    // Safe API call Usecase
    locator.registerLazySingleton<SafeApiCallUsecase>(() => SafeApiCallUsecase(
          safeApiCall: locator.call(),
        ));

    // Is Connected Usecase
    locator.registerLazySingleton<IsConnectedUsecase>(() => IsConnectedUsecase(
          repository: locator.call(),
        ));
    // Get Token Usecase
    locator.registerLazySingleton<CreateUserPreferencesUsecase>(
      () => CreateUserPreferencesUsecase(
        repository: locator.call(),
      ),
    );
    // Get Token Usecase
    locator.registerLazySingleton<UpdateUserPreferencesUsecase>(
      () => UpdateUserPreferencesUsecase(
        repository: locator.call(),
      ),
    );
    // Get Token Usecase
    locator.registerLazySingleton<GetUserPreferencesUsecase>(
      () => GetUserPreferencesUsecase(
        repository: locator.call(),
      ),
    );
    locator.registerLazySingleton<GetUserPreferencesStreamUsecase>(
      () => GetUserPreferencesStreamUsecase(
        repository: locator.call(),
      ),
    );
  }
}
