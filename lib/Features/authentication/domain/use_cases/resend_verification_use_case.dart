// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../entities/resend_verification_code_entity.dart';
import '../repositories/BaseAuthRepository.dart';

class ResendVerificationUseCase extends BaseUseCase<ResendVerificationEntity,
    ResendVerificationParameters> {
  BaseAuthRepository baseAuthRepository;

  ResendVerificationUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, ResendVerificationEntity>> call(
      ResendVerificationParameters parameters) {
    return baseAuthRepository.resendVerification(parameters);
  }
}

// ignore: must_be_immutable
class ResendVerificationParameters extends Equatable {
  int userId;
  ResendVerificationParameters({required this.userId});
  @override
  List<Object?> get props => [
        userId,
      ];
}
