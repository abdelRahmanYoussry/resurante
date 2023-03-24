// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/teacher/domain/entities/get_complaints_entity.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class GetComplaintsUseCase
    extends BaseUseCase<GetComplaintsEntity, GetComplaintsParameters> {
  BaseTeacherRepository baseStudentRepository;
  GetComplaintsUseCase(this.baseStudentRepository);
  @override
  Future<Either<Failure, GetComplaintsEntity>> call(
      GetComplaintsParameters parameters) {
    return baseStudentRepository.getComplaints(parameters);
  }
}

class GetComplaintsParameters extends Equatable {
  final String token;
  const GetComplaintsParameters({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}
