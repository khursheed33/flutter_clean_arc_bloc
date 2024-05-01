import 'package:flutter_clean_arc_bloc/features/data/sources/remote/preferences/user_preferences_remote_ds_impl.dart';
import 'package:flutter_clean_arc_bloc/index.dart';

/// `DiDatasources` class responsible to register and inject all types of datasources and their implementations.
class DiDatasources {
  final GetIt locator;
  DiDatasources({required this.locator}) {
    locator.registerLazySingleton<SafeApiCall>(
      () => SafeApiCallImpl(
        isConnectedUsecase: locator.call(),
      ),
    );
    locator.registerLazySingleton<ConnectivityLocalDatasource>(
      () => ConnectivityLocalDatasourceImpl(
        connectivity: locator.call(),
      ),
    );
    locator.registerLazySingleton<UserPreferenceRemoteDatasource>(
      () => UserPreferencesRemoteDatasourceImpl(
        hiveBox: locator.call(),
      ),
    );
  }
}
