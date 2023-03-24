// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/teacher/domain/entities/get_student_entity.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class GetStudentUseCase
    extends BaseUseCase<GetStudentEntity, StudentParameters> {
  BaseTeacherRepository baseStudentRepository;
  GetStudentUseCase(this.baseStudentRepository);
  @override
  Future<Either<Failure, GetStudentEntity>> call(StudentParameters parameters) {
    return baseStudentRepository.getUserData(parameters);
  }
}

class StudentParameters extends Equatable {
  final String token;
  const StudentParameters({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}
