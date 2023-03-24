// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/get_country_entity.dart';

class GetCountryUseCase
    extends BaseUseCase<GetCountryEntity, GetCountryParameters> {
  BaseTeacherRepository baseStudentRepository;
  GetCountryUseCase(this.baseStudentRepository);
  @override
  Future<Either<Failure, GetCountryEntity>> call(
      GetCountryParameters parameters) {
    return baseStudentRepository.getCountry(parameters);
  }
}

class GetCountryParameters extends Equatable {
  final String token;
  const GetCountryParameters({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}
