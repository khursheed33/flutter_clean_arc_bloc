import 'package:get_it/get_it.dart';

import '../../core/async/safe_api_call_impl.dart';
import '../../core/async/safe_api_repo.dart';
import '../data/sources/local/connectivity/connectivity_local_ds.dart';
import '../data/sources/local/connectivity/connectivity_local_ds_impl.dart';
import '../data/sources/remote/auth/auth_remote_ds.dart';
import '../data/sources/remote/auth/auth_remote_ds_impl.dart';

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

    locator.registerLazySingleton<AuthenticationRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(
        hiveBox: locator.call(),
        sharedPreferences: locator.call(),
        dio: locator.call(),
      ),
    );
  }
}
