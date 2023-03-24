// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/forget_password_entity.dart';
import '../repositories/BaseAuthRepository.dart';

class ForgetPasswordUseCase
    extends BaseUseCase<ForgetPasswordEntity, ForgetPasswordParameters> {
  BaseAuthRepository baseAuthRepository;

  ForgetPasswordUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, ForgetPasswordEntity>> call(
      ForgetPasswordParameters parameters) async {
    return await baseAuthRepository.forgetPassword(parameters);
  }
}

class ForgetPasswordParameters {
  String token;
  String password;
  String passwordConfirmed;
  String userId;

  ForgetPasswordParameters(
      {required this.token,
      required this.password,
      required this.passwordConfirmed,
      required this.userId});
}
