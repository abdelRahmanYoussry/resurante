import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../../../../core/utils/error/failure.dart';
import '../repositories/BaseAuthRepository.dart';

class StudentRegisterStep2UseCase
    extends BaseUseCase<void, StudentRegisterStep2Parameters> {
  BaseAuthRepository baseAuthRepository;

  StudentRegisterStep2UseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, dynamic>> call(
      StudentRegisterStep2Parameters parameters) {
    return baseAuthRepository.studentRegisterStep2(parameters);
  }
}

class StudentRegisterStep2Parameters {
  int studentGradeId;

  StudentRegisterStep2Parameters({required this.studentGradeId});
}
