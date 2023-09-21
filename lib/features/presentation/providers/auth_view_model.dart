import 'dart:async';

import 'package:flutter_clean_arc_bloc/features/domain/usecases/authentication/send_otp_usecase.dart';
import 'package:flutter_clean_arc_bloc/features/domain/usecases/authentication/verify_otp_usecase.dart';

import '../../../core/constants/app_durations.dart';
import '../../../core/enums/auth_type.dart';
import '../../../core/enums/gender_type.dart';
import '../../../core/enums/login_step.dart';
import '../../../core/enums/view_state.dart';
import 'package:flutter/material.dart';

import '../../../core/params/sign_in_params.dart';
import '../../../core/utils/response_message.dart';
import '../../domain/usecases/authentication/create_user_usecase.dart';
import '../../domain/usecases/authentication/get_token_usecase.dart';
import '../../domain/usecases/authentication/get_user_usecase.dart';
import '../../domain/usecases/authentication/sign_in_usecase.dart';
import '../../domain/usecases/authentication/sign_out_usecase.dart';

import '../../../core/params/no_params.dart';
import '../base/base_model.dart';

class AuthViewModel extends BaseModel {
  final CreateUserUsecase createUserUsecase;
  final GetTokenUsecase getTokenUsecase;
  final GetUserUsecase getUserUsecase;
  final SignOutUsecase signOutUsecase;
  final SignInUsecase signInUsecase;
  final SendOTPUsecase sendOTPUsecase;
  final VerifyOTPUsecase verifyOTPUsecase;

  AuthViewModel({
    required this.createUserUsecase,
    required this.getTokenUsecase,
    required this.signOutUsecase,
    required this.getUserUsecase,
    required this.signInUsecase,
    required this.sendOTPUsecase,
    required this.verifyOTPUsecase,
  });

  bool _isLogin = true;
  bool get isogin => _isLogin;

  void toggleIsLogin() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  LoginStep _loginStep = LoginStep.login;
  LoginStep get loginStep => _loginStep;

  void setLoginStep(LoginStep step) {
    _loginStep = step;
    notifyListeners();
  }

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  AuthType _authType = AuthType.email;
  AuthType get authType => _authType;

  void toggleAuthType(AuthType aT) {
    _authType = aT;
    notifyListeners();
  }

  GenderType _genderType = GenderType.male;
  GenderType get genderType => _genderType;

  void setGenderType(GenderType gType) {
    _genderType = gType;
    notifyListeners();
  }

  bool _isVerified = false;
  bool get isVerified => _isVerified;

  void setIsVerified(bool flag) {
    _isVerified = flag;
    notifyListeners();
  }

  DateTime _dob = DateTime.now();
  DateTime get dob => _dob;
  void setDOB(DateTime dateTime) {
    _dob = dateTime;
    notifyListeners();
  }

  final mobileNumberController = TextEditingController();
  final fullNameController = TextEditingController();
  final dobController = TextEditingController();
  final otpController = TextEditingController();
  final mobileNumberFocusNode = FocusNode();
  final FocusNode otpFocusNode = FocusNode();
  final loginFormKey = GlobalKey<FormState>();
  late AnimationController animationController;
  late Animation<Duration> animation;

  void initializeAnimations(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(milliseconds: AppDurations.d30000),
      vsync: vsync,
    );
    animation = Tween<Duration>(
      end: Duration.zero,
      begin: const Duration(milliseconds: AppDurations.d30000),
    ).animate(animationController);
    animationController.addStatusListener((status) {});
  }

  String? _token;
  String? get token => _token;

  setToken(String? newToken) {
    _token = newToken;
    notifyListeners();
  }

  Future<String?> isTokenExists() async {
    final response = await getTokenUsecase.call(NoParams());
    if (response.isRight()) {
      final token = FunctionalResponse.success<String?>(response);
      setToken(token);
    }
    return null;
  }

  final _userController = StreamController<String?>.broadcast();
  Stream<String?> get userStream => _userController.stream;

  Future<void> login() async {
    // Save the auth token to shared preferences
    final singInParam = SignInParams(
      username: "khursheed33",
      password: "12345",
    );
    setViewState(ViewState.Loading);
    final response = await signInUsecase.call(singInParam);
    setViewState(ViewState.Done);
    if (response.isRight()) {
      final token = FunctionalResponse.success<String?>(response);
      setToken(token);
      _userController.sink.add(token);
    }
  }

  Future<void> logout() async {
    final response = await signOutUsecase.call(NoParams());
    if (response.isRight()) {
      // Emit null to indicate user is logged out
      _userController.sink.add(null);
    }
  }

  @override
  void disposeModel() {
    _userController.close();
  }
}
