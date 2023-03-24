// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/verification_forgetPassword_entity.dart';
import '../repositories/BaseAuthRepository.dart';

class VerificationForgetPasswordUseCase extends BaseUseCase<
    VerificationForgetPasswordEntity, VerificationForgetPasswordParameters> {
  BaseAuthRepository baseAuthRepository;

  VerificationForgetPasswordUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, VerificationForgetPasswordEntity>> call(
      VerificationForgetPasswordParameters parameters) {
    return baseAuthRepository.verificationForgetPassword(parameters);
  }
}

// ignore: must_be_immutable
class VerificationForgetPasswordParameters extends Equatable {
  int userId;
  int verificationCode;

  VerificationForgetPasswordParameters(
      {required this.userId, required this.verificationCode});

  @override
  List<Object?> get props => [userId, verificationCode];
}
