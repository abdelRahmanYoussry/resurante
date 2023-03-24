// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/get_lesson_type_entity.dart';

class GetLessonTypeUseCase
    extends BaseUseCase<GetLessonTypeEntity, GetLessonTypeParameters> {
  BaseTeacherRepository baseStudentRepository;
  GetLessonTypeUseCase(this.baseStudentRepository);
  @override
  Future<Either<Failure, GetLessonTypeEntity>> call(
      GetLessonTypeParameters parameters) {
    return baseStudentRepository.getLessonType(parameters);
  }
}

class GetLessonTypeParameters extends Equatable {
  final String token;
  const GetLessonTypeParameters({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}
