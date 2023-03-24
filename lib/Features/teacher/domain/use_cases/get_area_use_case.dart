// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/teacher/domain/entities/get_cities_entity.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class GetAreaUseCase extends BaseUseCase<GetCitiesEntity, GetAreasParameters> {
  BaseTeacherRepository baseStudentRepository;
  GetAreaUseCase(this.baseStudentRepository);
  @override
  Future<Either<Failure, GetCitiesEntity>> call(GetAreasParameters parameters) {
    return baseStudentRepository.getAreas(parameters);
  }
}

class GetAreasParameters extends Equatable {
  final String token;
  final int cityId;
  const GetAreasParameters({
    required this.token,
    required this.cityId,
  });

  @override
  List<Object?> get props => [
        token,
        cityId,
      ];
}
