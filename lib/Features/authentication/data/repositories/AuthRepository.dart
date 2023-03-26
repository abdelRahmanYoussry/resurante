// ignore_for_file: file_names

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/error/exceptions.dart';
import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../../domain/entities/Register_Step2_entity.dart';
import '../../domain/entities/Register_initial_entitiy.dart';
import '../../domain/entities/education_grade_entity.dart';
import '../../domain/entities/education_level_entity.dart';
import '../../domain/entities/education_systems_entitiy.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/entities/get_material_entity.dart';
import '../../domain/entities/initial_forget_password_entity.dart';
import '../../domain/entities/resend_verification_code_entity.dart';
import '../../domain/entities/student_register_step2_entity.dart';
import '../../domain/entities/teacher_fianl_register_entity.dart';
import '../../domain/entities/uesr_data_entity.dart';
import '../../domain/entities/user_login_entity.dart';
import '../../domain/entities/verification_forgetPassword_entity.dart';
import '../../domain/entities/verification_register_entity.dart';
import '../../domain/repositories/BaseAuthRepository.dart';
import '../../domain/use_cases/Initial_Register_useCase.dart';
import '../../domain/use_cases/SaveRegisterTypeUseCase.dart';
import '../../domain/use_cases/Verification_forgetPassword_useCase.dart';
import '../../domain/use_cases/Verification_register_useCase.dart';
import '../../domain/use_cases/forget_password_useCase.dart';
import '../../domain/use_cases/get_Education_Level_use_case.dart';
import '../../domain/use_cases/get_education_grade_use_case.dart';
import '../../domain/use_cases/get_user_data_use_case.dart';
import '../../domain/use_cases/initial_forget_password_use_case.dart';
import '../../domain/use_cases/resend_verification_use_case.dart';
import '../../domain/use_cases/save_parent_bool_use_case.dart';
import '../../domain/use_cases/save_student_bool_use_case.dart';
import '../../domain/use_cases/save_teacher_bool_use_case.dart';
import '../../domain/use_cases/student_register_step2_use_case.dart';
import '../../domain/use_cases/teacher_fianl_register_use_case.dart';
import '../../domain/use_cases/user__register_step_two_use_case.dart';
import '../../domain/use_cases/user_login_use_case.dart';
import '../data_sources/AuthDataSourse.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthDataSource baseAuthDataSource;
  AuthRepository(this.baseAuthDataSource);

  @override
  Future<Either<Failure, FilePickerResult>> uploadFile() async {
    final result = await baseAuthDataSource.uploadFile();
    try {
      return Right(result);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<File>>> uploadMultiFile() async {
    final result = await baseAuthDataSource.uploadMultiFile();
    try {
      return Right(result);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, void>> cancelFile() async {
    final result = await baseAuthDataSource.cancelUploadedFile();
    try {
      return Right(result);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<File>>> cancelFileFromList(index) async {
    final result = await baseAuthDataSource.cancelUploadMultiFiles(index);
    try {
      return Right(result);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> saveStudentType(
      UpdateStudentBoolParameters parameters) async {
    final updateStudentBoolView =
        await baseAuthDataSource.changeStudentBool(parameters);
    try {
      return Right(updateStudentBoolView);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> saveTeacherType(
      UpdateTeacherBoolParameters parameters) async {
    final updateTeacherBoolView =
        await baseAuthDataSource.changeTeacherBool(parameters);
    try {
      return Right(updateTeacherBoolView);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> getStudentBool() async {
    final getStudentValue = await baseAuthDataSource.getStudentBool();
    try {
      return Right(getStudentValue);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> getTeacherBool() async {
    final getSTeacherValue = await baseAuthDataSource.getTeacherBool();
    try {
      return Right(getSTeacherValue);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> getParentBool() async {
    final getParentValue = await baseAuthDataSource.getParentBool();
    try {
      return Right(getParentValue);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> saveParentType(
      UpdateParentBoolParameters parameters) async {
    final getParentValue =
        await baseAuthDataSource.changeParentBool(parameters);
    try {
      return Right(getParentValue);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UserLoginEntity>> userLogin(
      UserLoginParameters parameters) async {
    final userLogin = await baseAuthDataSource.userLogin(parameters);

    try {
      return Right(userLogin);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.toString()));
    }
  }

  @override
  Future<Either<Failure, InitialRegisterEntity>> initialRegister(
      InitialRegisterParameters parameters) async {
    final initialRegister =
        await baseAuthDataSource.initialRegister(parameters);
    try {
      return Right(initialRegister);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, VerificationRegisterEntity>> verificationRegister(
      VerificationRegisterParameters parameters) async {
    final verificationReg =
        await baseAuthDataSource.verificationRegister(parameters);
    try {
      return Right(verificationReg);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, EducationSystemsEntity>> getEducationSystem() async {
    final getEducationSystem = await baseAuthDataSource.getEducationSystem();

    try {
      return Right(getEducationSystem);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, EducationLevelEntity>> getEducationLevel(
      EducationSystemIdParameters parameters) async {
    final getEducationLevel =
        await baseAuthDataSource.getEducationLevel(parameters);
    try {
      return Right(getEducationLevel);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, EducationGradeEntity>> getEducationGrade(
      EducationLevelIdParameters parameters) async {
    final getEducationGrade =
        await baseAuthDataSource.getEducationGrade(parameters);
    try {
      return Right(getEducationGrade);
    } on ServerException catch (failure) {
      debugPrint('${failure.errorMessageModel.message}heloooooooooooooooooo');
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> saveUserRegisterType(
      UserRegisterTypeParameters parameters) async {
    final type = await baseAuthDataSource.saveUserRegisterTypeLogin(parameters);
    try {
      return Right(type);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, RegisterStepTwoEntity>> registerStepTwo(
      RegisterStepTwoParameters parameters) async {
    final registerStepTwo =
        await baseAuthDataSource.registerStepTwo(parameters);
    try {
      return Right(registerStepTwo);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UserDataEntity>> getUserData(
      UserDataParameters parameters) async {
    final userData = await baseAuthDataSource.getUserData(parameters);
    try {
      return Right(userData);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, TeacherFinalRegisterEntity>> teacherFinalRegister(
      TeacherFinalRegisterParameters parameters) async {
    final finalRegister =
        await baseAuthDataSource.teacherFinalRegister(parameters);
    try {
      return Right(finalRegister);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, TeacherMaterialEntity>> getMaterial(
      NoParameters parameters) async {
    final materials = await baseAuthDataSource.getTeacherMaterial(parameters);
    try {
      return Right(materials);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, StudentRegisterStep2Entity>> studentRegisterStep2(
      StudentRegisterStep2Parameters parameters) async {
    final studentRegisterStep2 =
        await baseAuthDataSource.studentRegisterStep2(parameters);
    try {
      return Right(studentRegisterStep2);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ResendVerificationEntity>> resendVerification(
      ResendVerificationParameters parameters) async {
    final resendVerificationCode =
        await baseAuthDataSource.resendVerification(parameters);
    try {
      return Right(resendVerificationCode);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, InitialForgetPasswordEntity>> initialForgetPassword(
      InitialForgetPasswordParameters parameters) async {
    final initialForgetPassword =
        await baseAuthDataSource.initialForgetPassword(parameters);
    try {
      return Right(initialForgetPassword);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, VerificationForgetPasswordEntity>>
      verificationForgetPassword(
          VerificationForgetPasswordParameters parameters) async {
    await baseAuthDataSource.verificationForgetPassword(parameters);
    final verificationForgetPassword =
        await baseAuthDataSource.verificationForgetPassword(parameters);
    try {
      return Right(verificationForgetPassword);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordEntity>> forgetPassword(
      ForgetPasswordParameters parameters) async {
    final forgetPassword = await baseAuthDataSource.forgetPassword(parameters);
    try {
      return Right(forgetPassword);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
