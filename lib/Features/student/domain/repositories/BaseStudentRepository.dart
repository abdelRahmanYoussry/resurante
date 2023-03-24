// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:hassy/Features/student/domain/entities/student_personal_data_entity.dart';
import 'package:hassy/Features/student/domain/entities/update_student_user_data_entity.dart';
import 'package:hassy/Features/student/domain/entities/update_user_profile_image_entity.dart';

import '../../../../core/utils/error/failure.dart';
import '../use_cases/udate_student_data_use_case.dart';
import '../use_cases/update_user_profile_image_use_case.dart';

abstract class BaseStudentRepository {
  Future<Either<Failure, StudentPersonalDataEntity>> getStudentPersonalData();
  Future<Either<Failure, UpdateStudentUserDataEntity>> updateStudentData(
      UpdateStudentDataParameters parameters);
  Future<Either<Failure, UpdateUserProfileImageEntity>> updateUserProfileImage(
      UpdateUserProfileImageParameters parameters);
  // Future<Either<Failure, EducationSystemsEntity>> getEducationSystem();
}
