import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_bloc/index.dart';

abstract class ConnectivityRepository {
  Future<Either<Failure, bool>> isConnected();
}
