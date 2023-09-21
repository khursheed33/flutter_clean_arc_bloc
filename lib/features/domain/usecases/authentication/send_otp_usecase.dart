import 'package:flutter_clean_arc_bloc/features/domain/entities/send_otp_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../repositories/authentication_repository.dart';

class SendOTPUsecase extends BaseUsecase<SendOTPEntity, String> {
  final AuthenticationRepository repository;
  SendOTPUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, SendOTPEntity>> call(params) async {
    return await repository.sendOTP(params);
  }
}
