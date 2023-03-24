// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:hassy/Features/authentication/domain/repositories/BaseAuthRepository.dart';
import 'package:hassy/core/utils/error/failure.dart';

import '../../../../core/utils/usecase/base_use_case.dart';
import '../entities/education_systems_entitiy.dart';

class GetEducationSystemUseCase extends BaseUseCase<void, NoParameters> {
  BaseAuthRepository baseAuthRepository;
  GetEducationSystemUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, EducationSystemsEntity>> call(
      NoParameters parameters) {
    return baseAuthRepository.getEducationSystem();
  }
}
