// ignore_for_file: file_names, unused_import, must_be_immutable

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/teacher_update_basic_data_entity.dart';

class UpdateUserBasicDataUseCase extends BaseUseCase<UpdateBasicUserDataEntity,
    UpdateUserBasicDataParameters> {
  BaseTeacherRepository baseTeacherRepository;

  UpdateUserBasicDataUseCase(this.baseTeacherRepository);

  @override
  Future<Either<Failure, UpdateBasicUserDataEntity>> call(
      UpdateUserBasicDataParameters parameters) async {
    return await baseTeacherRepository.teacherUpdateBasicData(parameters);
  }
}

class UpdateUserBasicDataParameters extends Equatable {
  final String name;
  final String address;
  final String birthDate;
  final String email;
  final String token;
  const UpdateUserBasicDataParameters({
    required this.token,
    required this.name,
    required this.address,
    required this.birthDate,
    required this.email,
  });

  @override
  List<Object?> get props => [
        token,
        name,
        address,
        birthDate,
        email,
      ];
}
