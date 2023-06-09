// ignore_for_file: file_names, duplicate_ignore
// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../entities/education_grade_entity.dart';
import '../repositories/BaseAuthRepository.dart';

class GetEducationGradeUseCase
    extends BaseUseCase<void, EducationLevelIdParameters> {
  BaseAuthRepository baseAuthRepository;
  GetEducationGradeUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, EducationGradeEntity>> call(
      EducationLevelIdParameters parameters) {
    return baseAuthRepository.getEducationGrade(parameters);
  }
}

class EducationLevelIdParameters {
  int typeId;

  EducationLevelIdParameters({required this.typeId});
}
