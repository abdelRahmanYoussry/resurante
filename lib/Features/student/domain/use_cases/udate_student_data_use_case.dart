import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:hassy/Features/student/domain/repositories/BaseStudentRepository.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../../../../core/utils/error/failure.dart';

class UpdateStudentDataUseCase
    extends BaseUseCase<void, UpdateStudentDataParameters> {
  BaseStudentRepository baseStudentRepository;

  UpdateStudentDataUseCase(this.baseStudentRepository);

  @override
  Future<Either<Failure, dynamic>> call(
      UpdateStudentDataParameters parameters) {
    return baseStudentRepository.updateStudentData(parameters);
  }
}

class UpdateStudentDataParameters {
  int updateStudentIdGrade;

  UpdateStudentDataParameters({required this.updateStudentIdGrade});
}
