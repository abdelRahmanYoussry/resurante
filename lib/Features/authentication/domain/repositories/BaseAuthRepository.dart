// ignore_for_file: file_names

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../entities/Register_Step2_entity.dart';
import '../entities/Register_initial_entitiy.dart';
import '../entities/education_grade_entity.dart';
import '../entities/education_level_entity.dart';
import '../entities/education_systems_entitiy.dart';
import '../entities/forget_password_entity.dart';
import '../entities/get_material_entity.dart';
import '../entities/initial_forget_password_entity.dart';
import '../entities/resend_verification_code_entity.dart';
import '../entities/student_register_step2_entity.dart';
import '../entities/teacher_fianl_register_entity.dart';
import '../entities/uesr_data_entity.dart';
import '../entities/user_login_entity.dart';
import '../entities/verification_forgetPassword_entity.dart';
import '../entities/verification_register_entity.dart';
import '../use_cases/Initial_Register_useCase.dart';
import '../use_cases/SaveRegisterTypeUseCase.dart';
import '../use_cases/Verification_forgetPassword_useCase.dart';
import '../use_cases/Verification_register_useCase.dart';
import '../use_cases/forget_password_useCase.dart';
import '../use_cases/get_Education_Level_use_case.dart';
import '../use_cases/get_education_grade_use_case.dart';
import '../use_cases/get_user_data_use_case.dart';
import '../use_cases/initial_forget_password_use_case.dart';
import '../use_cases/resend_verification_use_case.dart';
import '../use_cases/save_parent_bool_use_case.dart';
import '../use_cases/save_student_bool_use_case.dart';
import '../use_cases/save_teacher_bool_use_case.dart';
import '../use_cases/student_register_step2_use_case.dart';
import '../use_cases/teacher_fianl_register_use_case.dart';
import '../use_cases/user__register_step_two_use_case.dart';
import '../use_cases/user_login_use_case.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, FilePickerResult>> uploadFile();
  Future<Either<Failure, List<File>>> uploadMultiFile();
  Future<Either<Failure, void>> cancelFile();
  Future<Either<Failure, List<File>>> cancelFileFromList(index);
  Future<Either<Failure, bool>> saveStudentType(
      UpdateStudentBoolParameters parameters);
  Future<Either<Failure, bool>> saveTeacherType(
      UpdateTeacherBoolParameters parameters);
  Future<Either<Failure, bool>> getStudentBool();
  Future<Either<Failure, bool>> getTeacherBool();
  Future<Either<Failure, bool>> getParentBool();
  Future<Either<Failure, bool>> saveParentType(
      UpdateParentBoolParameters parameters);
  Future<Either<Failure, UserLoginEntity>> userLogin(
      UserLoginParameters parameters);
  Future<Either<Failure, InitialRegisterEntity>> initialRegister(
      InitialRegisterParameters parameters);
  Future<Either<Failure, VerificationRegisterEntity>> verificationRegister(
      VerificationRegisterParameters parameters);
  Future<Either<Failure, RegisterStepTwoEntity>> registerStepTwo(
      RegisterStepTwoParameters parameters);
  Future<Either<Failure, EducationSystemsEntity>> getEducationSystem();
  Future<Either<Failure, bool>> saveUserRegisterType(
      UserRegisterTypeParameters parameters);
  Future<Either<Failure, UserDataEntity>> getUserData(
      UserDataParameters parameters);
  Future<Either<Failure, EducationLevelEntity>> getEducationLevel(
      EducationSystemIdParameters parameters);
  Future<Either<Failure, EducationGradeEntity>> getEducationGrade(
      EducationLevelIdParameters parameters);
  Future<Either<Failure, TeacherFinalRegisterEntity>> teacherFinalRegister(
      TeacherFinalRegisterParameters parameters);
  Future<Either<Failure, TeacherMaterialEntity>> getMaterial(
      NoParameters parameters);
  Future<Either<Failure, StudentRegisterStep2Entity>> studentRegisterStep2(
      StudentRegisterStep2Parameters parameters);
  Future<Either<Failure, ResendVerificationEntity>> resendVerification(
      ResendVerificationParameters parameters);
  Future<Either<Failure, InitialForgetPasswordEntity>> initialForgetPassword(
      InitialForgetPasswordParameters parameters);
  Future<Either<Failure, VerificationForgetPasswordEntity>>
      verificationForgetPassword(
          VerificationForgetPasswordParameters parameters);
  Future<Either<Failure, ForgetPasswordEntity>> forgetPassword(
      ForgetPasswordParameters parameters);
}
