// ignore_for_file: file_names, unused_import, must_be_immutable

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/student/domain/entities/update_user_profile_image_entity.dart';
import 'package:hassy/Features/student/domain/repositories/BaseStudentRepository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class UpdateUserProfileImageUseCase extends BaseUseCase<
    UpdateUserProfileImageEntity, UpdateUserProfileImageParameters> {
  BaseStudentRepository baseStudentRepository;

  UpdateUserProfileImageUseCase(this.baseStudentRepository);

  @override
  Future<Either<Failure, UpdateUserProfileImageEntity>> call(
      UpdateUserProfileImageParameters parameters) async {
    return await baseStudentRepository.updateUserProfileImage(parameters);
  }
}

class UpdateUserProfileImageParameters extends Equatable {
  final File image;
  final String token;
  const UpdateUserProfileImageParameters({
    required this.token,
    required this.image,
  });

  @override
  List<Object?> get props => [
        token,
        image,
      ];
}
