import 'package:flutter_clean_arc_bloc/features/data/constants/app_api_endpoints.dart';
import 'package:flutter_clean_arc_bloc/features/data/models/authentication/send_otp_model.dart';
import 'package:flutter_clean_arc_bloc/features/data/models/authentication/verify_otp_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/user/current_user.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../models/user/user_model.dart';
import 'auth_remote_ds.dart';

class AuthRemoteDatasourceImpl implements AuthenticationRemoteDatasource {
  final Dio dio;
  final Box hiveBox;
  final SharedPreferences sharedPreferences;

  AuthRemoteDatasourceImpl({
    required this.dio,
    required this.hiveBox,
    required this.sharedPreferences,
  });

  @override
  Future<UserModel> getUser(String username) {
    return Future.delayed(const Duration(seconds: 1), () {
      return UserModel(
        name: "Khursheed",
        surname: "Gaddi",
        username: username,
        email: "khursheed@gmail.com",
      );
    });
  }

  @override
  Future<void> createUser(UserEntity userEntity) async {
    return;
  }

  @override
  Future<String> signIn({
    required String username,
    required String password,
  }) async {
    const String token = "ljfaljsd93i034343";
    await sharedPreferences.setString(AppKeys.authToken, token);
    currentToken = token;
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return token;
      },
    );
  }

  @override
  Future<void> signOut() async {
    await sharedPreferences.remove(AppKeys.authToken);
    currentToken = null;
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString(AppKeys.authToken);
  }

  @override
  Future<SendOTPModel> sendOTP(String phone) async {
    final payload = {"mobile": phone};
    final resp = await dio.post(AppAPIEndpoints.sendOtpUrl, data: payload);
    final otp = resp.data as Map<String, dynamic>;
    final sendOTPModel = SendOTPModel.fromJson(otp);
    return sendOTPModel;
  }

  @override
  Future<VerifyOTPModel> verifyOTP({
    required String phone,
    required String otp,
  }) async {
    final payload = {"mobile": phone, "otp": otp};
    final resp = await dio.post(AppAPIEndpoints.verifyOtpUrl, data: payload);
    final verifyRes = resp.data as Map<String, dynamic>;
    final verifyModel = VerifyOTPModel.fromJson(verifyRes);
    return verifyModel;
  }
}
