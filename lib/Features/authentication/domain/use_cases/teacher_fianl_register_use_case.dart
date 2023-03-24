// ignore_for_file: file_names, unused_import, must_be_immutable

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/Register_Step2_entity.dart';
import '../entities/Register_initial_entitiy.dart';
import '../entities/teacher_fianl_register_entity.dart';
import '../repositories/BaseAuthRepository.dart';

class TeacherFinalRegisterUseCase extends BaseUseCase<
    TeacherFinalRegisterEntity, TeacherFinalRegisterParameters> {
  BaseAuthRepository baseAuthRepository;

  TeacherFinalRegisterUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, TeacherFinalRegisterEntity>> call(
      TeacherFinalRegisterParameters parameters) async {
    return await baseAuthRepository.teacherFinalRegister(parameters);
  }
}

class TeacherFinalRegisterParameters extends Equatable {
  final String certificateName;
  final int certificateYear;
  final List materials;
  final File idImage;
  final List<File> attachments;
  final String token;
  const TeacherFinalRegisterParameters(
      {required this.token,
      required this.certificateName,
      required this.certificateYear,
      required this.materials,
      required this.attachments,
      required this.idImage});

  @override
  List<Object?> get props => [
        token,
        certificateYear,
        certificateYear,
        materials,
        attachments,
      ];
}
