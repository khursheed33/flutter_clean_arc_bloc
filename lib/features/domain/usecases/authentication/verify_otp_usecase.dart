import 'package:flutter_clean_arc_bloc/core/params/verify_otp_params.dart';
import 'package:flutter_clean_arc_bloc/features/domain/entities/verify_otp_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../repositories/authentication_repository.dart';

class VerifyOTPUsecase extends BaseUsecase<VerifyOTPEntity, VerifyOTPParams> {
  final AuthenticationRepository repository;
  VerifyOTPUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, VerifyOTPEntity>> call(params) async {
    return await repository.verifyOTP(
      phone: params.phone,
      otp: params.otp,
    );
  }
}
