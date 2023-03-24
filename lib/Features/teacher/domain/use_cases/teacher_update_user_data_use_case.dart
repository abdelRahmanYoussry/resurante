// ignore_for_file: file_names, unused_import, must_be_immutable

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hassy/Features/teacher/domain/entities/teacher_update_user_data_entity.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class TeacherUpdateUserDataUseCase extends BaseUseCase<
    TeacherUpdateUserDataEntity, TeacherUpdateUserDataParameters> {
  BaseTeacherRepository baseTeacherRepository;

  TeacherUpdateUserDataUseCase(this.baseTeacherRepository);

  @override
  Future<Either<Failure, TeacherUpdateUserDataEntity>> call(
      TeacherUpdateUserDataParameters parameters) async {
    return await baseTeacherRepository.teacherUpdateUserData(parameters);
  }
}

class TeacherUpdateUserDataParameters extends Equatable {
  final String certificateName;
  final int certificateYear;
  final List materials;
  File? idImage;
  final List<File> attachments;
  final List<int> deleteFiles;
  final String token;
  TeacherUpdateUserDataParameters({
    required this.token,
    required this.certificateName,
    required this.certificateYear,
    required this.materials,
    required this.attachments,
    this.idImage,
    required this.deleteFiles,
  });

  @override
  List<Object?> get props => [
        token,
        certificateYear,
        certificateYear,
        materials,
        attachments,
        deleteFiles
      ];
}
