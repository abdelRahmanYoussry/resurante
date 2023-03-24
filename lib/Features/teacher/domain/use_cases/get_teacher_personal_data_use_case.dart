// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/teacher/domain/entities/get_teacher_personal_data_entity.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class GetTeacherPersonalDataUseCase
    extends BaseUseCase<GetTeacherPersonalEntity, TeacherPersonalParameters> {
  BaseTeacherRepository baseTeacherRepository;
  GetTeacherPersonalDataUseCase(this.baseTeacherRepository);
  @override
  Future<Either<Failure, GetTeacherPersonalEntity>> call(
      TeacherPersonalParameters parameters) {
    return baseTeacherRepository.getTeacherPersonalData(parameters);
  }
}

class TeacherPersonalParameters extends Equatable {
  final String token;
  const TeacherPersonalParameters({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}
