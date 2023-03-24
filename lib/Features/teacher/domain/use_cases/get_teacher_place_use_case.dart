// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/get_teacher_places_entity.dart';

class GetTeacherPlaceUseCase
    extends BaseUseCase<GetTeacherPlaceEntity, GetTeacherPlaceParameters> {
  BaseTeacherRepository baseStudentRepository;
  GetTeacherPlaceUseCase(this.baseStudentRepository);
  @override
  Future<Either<Failure, GetTeacherPlaceEntity>> call(
      GetTeacherPlaceParameters parameters) {
    return baseStudentRepository.getTeacherPlaces(parameters);
  }
}

class GetTeacherPlaceParameters extends Equatable {
  final String token;
  const GetTeacherPlaceParameters({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}
