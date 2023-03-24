// ignore_for_file: file_names, unused_import, must_be_immutable

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hassy/Features/teacher/domain/entities/add_place_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/teacher_update_user_data_entity.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/add_complaints_entity.dart';

class AddComplaintsUseCase
    extends BaseUseCase<AddComplaintsEntity, AddComplaintsParameters> {
  BaseTeacherRepository baseTeacherRepository;

  AddComplaintsUseCase(this.baseTeacherRepository);

  @override
  Future<Either<Failure, AddComplaintsEntity>> call(
      AddComplaintsParameters parameters) async {
    return await baseTeacherRepository.addComplaints(parameters);
  }
}

class AddComplaintsParameters extends Equatable {
  final int complaintTypeId;
  final String title;
  final String body;
  final String token;
  const AddComplaintsParameters({
    required this.title,
    required this.body,
    required this.complaintTypeId,
    required this.token,
  });

  @override
  List<Object?> get props => [
        token,
        complaintTypeId,
        body,
        title,
      ];
}
