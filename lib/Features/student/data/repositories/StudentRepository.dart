// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:hassy/Features/student/data/data_sources/StudntDataSourse.dart';
import 'package:hassy/Features/student/domain/entities/student_personal_data_entity.dart';
import 'package:hassy/Features/student/domain/entities/update_student_user_data_entity.dart';
import 'package:hassy/Features/student/domain/entities/update_user_profile_image_entity.dart';
import 'package:hassy/Features/student/domain/repositories/BaseStudentRepository.dart';
import 'package:hassy/Features/student/domain/use_cases/udate_student_data_use_case.dart';
import 'package:hassy/Features/student/domain/use_cases/update_user_profile_image_use_case.dart';

import '../../../../core/utils/error/exceptions.dart';
import '../../../../core/utils/error/failure.dart';

class StudentRepository extends BaseStudentRepository {
  final BaseStudentDataSource baseStudentDataSource;

  StudentRepository(this.baseStudentDataSource);

  @override
  Future<Either<Failure, StudentPersonalDataEntity>>
      getStudentPersonalData() async {
    final getStudentPersonalData =
        await baseStudentDataSource.getStudentPersonalData();
    try {
      return Right(getStudentPersonalData);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UpdateStudentUserDataEntity>> updateStudentData(
      UpdateStudentDataParameters parameters) async {
    final updateStudentData =
        await baseStudentDataSource.updateStudentData(parameters);
    try {
      return Right(updateStudentData);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UpdateUserProfileImageEntity>> updateUserProfileImage(
      UpdateUserProfileImageParameters parameters) async {
    final updateUserProfileImage =
        await baseStudentDataSource.updateUserProfileImage(parameters);
    try {
      return Right(updateUserProfileImage);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  // @override
  // Future<Either<Failure, EducationSystemsEntity>> getEducationSystem() async {
  //   final getEducationSystem = await baseAuthDataSource.getEducationSystem();
  //
  //   try {
  //     return Right(getEducationSystem);
  //   } on ServerException catch (failure) {
  //     return left(ServerFailure(failure.errorMessageModel.message));
  //   }
  // }
}
