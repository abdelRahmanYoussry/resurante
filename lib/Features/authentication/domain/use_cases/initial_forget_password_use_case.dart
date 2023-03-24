// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:hassy/Features/authentication/domain/entities/initial_forget_password_entity.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../repositories/BaseAuthRepository.dart';

class InitialForgetPasswordUseCase extends BaseUseCase<
    InitialForgetPasswordEntity, InitialForgetPasswordParameters> {
  BaseAuthRepository baseAuthRepository;

  InitialForgetPasswordUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, InitialForgetPasswordEntity>> call(
      InitialForgetPasswordParameters parameters) async {
    return await baseAuthRepository.initialForgetPassword(parameters);
  }
}

class InitialForgetPasswordParameters {
  String userName;

  InitialForgetPasswordParameters({
    required this.userName,
  });
}
