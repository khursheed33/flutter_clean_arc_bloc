import 'package:flutter_clean_arc_bloc/features/data/models/authentication/send_otp_model.dart';
import 'package:flutter_clean_arc_bloc/features/data/models/authentication/verify_otp_model.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../models/user/user_model.dart';

abstract class AuthenticationRemoteDatasource {
  /// Get current user token from the local storage.
  Future<String?> getToken();

  /// `Login` - Logs in already existing users.
  /// Takes `username` and `password` as required parameters.
  Future<String> signIn({
    required String username,
    required String password,
  });

  /// `Signout` - Removes Token from the local strage.
  Future<void> signOut();

  /// Gives user by username.
  /// Takes `username` as an argument.
  Future<UserModel> getUser(String username);

  /// Creates new user in the database.
  /// Takes `UserEntity` as an argument.
  Future<void> createUser(UserEntity userEntity);

  /// It sends OTP on the given mobile number.
  Future<SendOTPModel> sendOTP(String phone);

  /// It will verify OTP.
  /// It takes two parameters as argument [phone] `String` and [otp] `String`
  Future<VerifyOTPModel> verifyOTP({
    required String phone,
    required String otp,
  });
}
