import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../entities/user_entity.dart';
import '../../repositories/authentication_repository.dart';

class GetUserUsecase extends BaseUsecase<UserEntity, String> {
  final AuthenticationRepository repository;
  GetUserUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return await repository.getUser(params);
  }
}
