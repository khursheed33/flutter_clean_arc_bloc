import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_bloc/index.dart';

/// The `FunctionalResponse` class provides static methods to handle success and failure responses using
/// the `Either` type.

abstract class FunctionalResponse {
  static String? failure(Either<Failure, void> either) {
    return either.fold((l) => l.message, (r) => null);
  }

  static X? success<X>(Either<Failure, X> either) {
    return either.fold((l) => null, (r) => r);
  }
}
