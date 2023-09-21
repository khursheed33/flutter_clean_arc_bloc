import 'package:flutter_clean_arc_bloc/features/domain/entities/send_otp_entity.dart';
import 'package:flutter_clean_arc_bloc/features/domain/entities/verify_otp_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthenticationRepository {
  /// Get current user token from the local storage.
  Future<Either<Failure, String?>> getToken();

  /// `Login` - Logs in already existing users.
  /// Takes `username` and `password` as required parameters.
  Future<Either<Failure, String>> signIn({
    required String username,
    required String password,
  });

  /// `Signout` - Removes Token from the local strage.
  Future<Either<Failure, void>> signOut();

  /// Gives user by username.
  /// Takes `username` as an argument.
  Future<Either<Failure, UserEntity>> getUser(String username);

  /// Create User expects `UserEntity` as an argument, It creates a new user in the database.
  Future<Either<Failure, void>> createUser(UserEntity userEntity);

  /// It sends OTP on the given mobile number.
  Future<Either<Failure, SendOTPEntity>> sendOTP(String phone);

  /// It will verify OTP.
  /// It takes two parameters as argument [phone] `String` and [otp] `String`
  Future<Either<Failure, VerifyOTPEntity>> verifyOTP({
    required String phone,
    required String otp,
  });
}
