// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:hassy/Features/authentication/domain/entities/education_level_entity.dart';
import 'package:hassy/Features/authentication/domain/repositories/BaseAuthRepository.dart';
import 'package:hassy/core/utils/error/failure.dart';

import '../../../../core/utils/usecase/base_use_case.dart';

class GetEducationLevelUseCase
    extends BaseUseCase<void, EducationSystemIdParameters> {
  BaseAuthRepository baseAuthRepository;
  GetEducationLevelUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, EducationLevelEntity>> call(
      EducationSystemIdParameters parameters) {
    return baseAuthRepository.getEducationLevel(parameters);
  }
}

class EducationSystemIdParameters {
  int typeId;

  EducationSystemIdParameters({required this.typeId});
}
