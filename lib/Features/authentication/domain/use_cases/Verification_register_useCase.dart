// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../entities/verification_register_entity.dart';
import '../repositories/BaseAuthRepository.dart';

class VerificationRegisterUseCase extends BaseUseCase<
    VerificationRegisterEntity, VerificationRegisterParameters> {
  BaseAuthRepository baseAuthRepository;

  VerificationRegisterUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, VerificationRegisterEntity>> call(
      VerificationRegisterParameters parameters) {
    return baseAuthRepository.verificationRegister(parameters);
  }
}

// ignore: must_be_immutable
class VerificationRegisterParameters extends Equatable {
  int userId;
  int verificationCode;

  VerificationRegisterParameters(
      {required this.userId, required this.verificationCode});

  @override
  List<Object?> get props => [userId, verificationCode];
}
