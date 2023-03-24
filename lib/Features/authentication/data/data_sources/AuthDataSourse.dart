// ignore_for_file: file_names, unused_local_variable, unnecessary_null_comparison, unused_import, avoid_print, unnecessary_null_in_if_null_operators

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hassy/Features/authentication/data/models/Initial_ForgetPassword_Model.dart';
import 'package:hassy/Features/authentication/data/models/Initial_Register_Model.dart';
import 'package:hassy/Features/authentication/data/models/education_grades_model.dart';
import 'package:hassy/Features/authentication/data/models/education_system_model.dart';
import 'package:hassy/Features/authentication/data/models/register_step_two_model.dart';
import 'package:hassy/Features/authentication/data/models/resend_verification_model.dart';
import 'package:hassy/Features/authentication/data/models/student_register_step2_model.dart';
import 'package:hassy/Features/authentication/data/models/teacher_final_register_model.dart';
import 'package:hassy/Features/authentication/data/models/teacher_material_model.dart';
import 'package:hassy/Features/authentication/data/models/user_login_model.dart';
import 'package:hassy/Features/authentication/domain/use_cases/Verification_register_useCase.dart';
import 'package:hassy/Features/authentication/domain/use_cases/forget_password_useCase.dart';
import 'package:hassy/Features/authentication/domain/use_cases/get_material_use_case.dart';
import 'package:hassy/Features/authentication/domain/use_cases/get_user_data_use_case.dart';
import 'package:hassy/Features/authentication/domain/use_cases/initial_forget_password_use_case.dart';
import 'package:hassy/Features/authentication/domain/use_cases/student_register_step2_use_case.dart';
import 'package:hassy/Features/authentication/domain/use_cases/user__register_step_two_use_case.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/shared/chace_helper/cache_helper.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/api/api_constance.dart';
import '../../../../core/utils/api/exception_method.dart';
import '../../../../core/utils/error/exceptions.dart';
import '../../../../core/utils/network/error_message_model.dart';
import '../../../../core/utils/shared/app/strings_manager.dart';
import '../../domain/entities/user_login_entity.dart';
import '../../domain/use_cases/Initial_Register_useCase.dart';
import '../../domain/use_cases/SaveRegisterTypeUseCase.dart';
import '../../domain/use_cases/Verification_forgetPassword_useCase.dart';
import '../../domain/use_cases/Verification_register_useCase.dart';
import '../../domain/use_cases/get_Education_Level_use_case.dart';
import '../../domain/use_cases/get_education_grade_use_case.dart';
import '../../domain/use_cases/get_user_data_use_case.dart';
import '../../domain/use_cases/resend_verification_use_case.dart';
import '../../domain/use_cases/save_parent_bool_use_case.dart';
import '../../domain/use_cases/save_student_bool_use_case.dart';
import '../../domain/use_cases/save_teacher_bool_use_case.dart';
import '../../domain/use_cases/teacher_fianl_register_use_case.dart';
import '../../domain/use_cases/user_login_use_case.dart';
import '../models/Initial_Register_Model.dart';
import '../models/Verification_ForgetPassword_Model.dart';
import '../models/Verification_Register_Model.dart';
import '../models/education_level_model.dart';
import '../models/forget_password_Model.dart';
import '../models/register_step_two_model.dart';
import '../models/user_data_model.dart';
import '../models/user_login_model.dart';

abstract class BaseAuthDataSource {
  Future<FilePickerResult> uploadFile();
  Future<List<File>> uploadMultiFile();
  Future<void> cancelUploadedFile();
  Future<bool> changeStudentBool(UpdateStudentBoolParameters parameters);
  Future<bool> changeTeacherBool(UpdateTeacherBoolParameters parameters);
  Future<bool> getStudentBool();
  Future<bool> getTeacherBool();
  Future<bool> getParentBool();
  Future<bool> changeParentBool(UpdateParentBoolParameters parameters);
  Future<List<File>> cancelUploadMultiFiles(int index);
  Future<UserLoginModel> userLogin(UserLoginParameters parameters);
  Future<InitialRegisterModel> initialRegister(
      InitialRegisterParameters parameters);
  Future<VerificationRegisterModel> verificationRegister(
      VerificationRegisterParameters parameters);
  Future<bool> saveUserRegisterTypeLogin(UserRegisterTypeParameters parameters);
  Future<UserDataModel> getUserData(UserDataParameters parameters);
  Future<RegisterStepTwoModel> registerStepTwo(
      RegisterStepTwoParameters parameters);
  Future<EducationSystemModel> getEducationSystem();
  Future<EducationLevelModel> getEducationLevel(
      EducationSystemIdParameters parameters);
  Future<TeacherMaterialModel> getTeacherMaterial(NoParameters parameters);
  Future<EducationGradeModel> getEducationGrade(
      EducationLevelIdParameters parameters);
  Future<TeacherFinalRegisterModel> teacherFinalRegister(
      TeacherFinalRegisterParameters parameters);
  Future<StudentRegisterStep2Model> studentRegisterStep2(
      StudentRegisterStep2Parameters parameters);
  Future<ResendVerificationModel> resendVerification(
      ResendVerificationParameters parameters);
  Future<InitialForgetPasswordModel> initialForgetPassword(
      InitialForgetPasswordParameters parameters);
  Future<VerificationForgetPasswordModel> verificationForgetPassword(
      VerificationForgetPasswordParameters parameters);
  Future<ForgetPasswordModel> forgetPassword(
      ForgetPasswordParameters parameters);
}

class AuthDateSource extends BaseAuthDataSource {
  final SharedPreferences sharedPreferences;
  AuthDateSource({
    required this.sharedPreferences,
  });

  late File file;
  late List<File> filesList;
  @override
  Future<FilePickerResult> uploadFile() async {
    final teacherCertificationFilePath = await FilePicker.platform.pickFiles();
    if (teacherCertificationFilePath != null) {
      file = File(teacherCertificationFilePath.files.single.path!);
      return teacherCertificationFilePath;
    } else {}
    return teacherCertificationFilePath!;
  }

  @override
  Future<List<File>> uploadMultiFile() async {
    final teacherCertificationMultiFilePath =
        await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (teacherCertificationMultiFilePath != null) {
      filesList = teacherCertificationMultiFilePath.paths
          .map((teacherCertificationMultiFilePath) =>
              File(teacherCertificationMultiFilePath!))
          .toList();
    }
    return filesList;
  }

  @override
  Future<void> cancelUploadedFile() async {
    if (file != null) {
      file.delete();
    }
  }

  @override
  Future<List<File>> cancelUploadMultiFiles(int index) async {
    if (filesList.isNotEmpty) {
      filesList.removeAt(index);
    }
    return filesList;
  }

  @override
  Future<bool> changeStudentBool(UpdateStudentBoolParameters parameters) async {
    return await sharedPreferences.setBool(
        AppStrings.cachedStudentBool, parameters.isEnd);
  }

  @override
  Future<bool> changeTeacherBool(UpdateTeacherBoolParameters parameters) async {
    return await sharedPreferences.setBool(
        AppStrings.cachedTeacherBool, parameters.isEnd);
  }

  @override
  Future<bool> getStudentBool() async {
    final boardingString =
        sharedPreferences.getBool(AppStrings.cachedStudentBool) ?? false;
    return await Future.value(boardingString);
  }

  @override
  Future<bool> getTeacherBool() async {
    final boardingString =
        sharedPreferences.getBool(AppStrings.cachedTeacherBool) ?? false;
    return await Future.value(boardingString);
  }

  @override
  Future<bool> changeParentBool(UpdateParentBoolParameters parameters) async {
    return await sharedPreferences.setBool(
        AppStrings.cachedParentBool, parameters.isEnd);
  }

  @override
  Future<bool> getParentBool() async {
    final boardingString =
        sharedPreferences.getBool(AppStrings.cachedParentBool) ?? false;
    return await Future.value(boardingString);
  }

  @override
  Future<UserLoginModel> userLogin(UserLoginParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.loginEndPoint,
        options: Options(
          headers: {'language': ApiConstance.lang()},
        ),
        data: {
          "userName": parameters.userName,
          "password": parameters.password,
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        return UserLoginModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<InitialRegisterModel> initialRegister(
      InitialRegisterParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.initialRegisterEndPoint,
        options: Options(
          headers: {'language': ApiConstance.lang()},
        ),
        data: {
          'password': parameters.password,
          'userName': parameters.userName,
          'passwordConfirm': parameters.passwordConfirmed,
          'phone': parameters.phone,
          'typeId': parameters.typeId,
        },
      );
      if (response.statusCode == 200) {
        return InitialRegisterModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<VerificationRegisterModel> verificationRegister(
      VerificationRegisterParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.verificationRegisterEndPoint,
        data: {
          'userId': parameters.userId,
          'verificationCode': parameters.verificationCode
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        return VerificationRegisterModel.fromJson(response.data);
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<EducationSystemModel> getEducationSystem() async {
    try {
      final response = await Dio().post(
        ApiConstance.getEducationSystems,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang()
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        return EducationSystemModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<bool> saveUserRegisterTypeLogin(
      UserRegisterTypeParameters parameters) async {
    return await sharedPreferences.setString(
        AppStrings.registerTypeBool, parameters.type);
  }

  @override
  Future<EducationLevelModel> getEducationLevel(
      EducationSystemIdParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getEducationLevel(educationSystemId: parameters.typeId),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang()
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        debugPrint(
            '${ApiConstance.getEducationLevel} this is education level endPoint');
        return EducationLevelModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<EducationGradeModel> getEducationGrade(
      EducationLevelIdParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getEducationGrade(educationLevelId: parameters.typeId),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang()
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        debugPrint(
            '${ApiConstance.getEducationLevel} this is education Grade endPoint');
        return EducationGradeModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<RegisterStepTwoModel> registerStepTwo(
      RegisterStepTwoParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.registerStepTwoEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'multipart/form-data'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
        data: parameters.image != null
            ? FormData.fromMap(
                {
                  'Name': parameters.fullName.toString(),
                  'IdNumber': parameters.idNumber.toString(),
                  'Address': parameters.address.toString(),
                  'BirthDate': parameters.birthDate.toString(),
                  'Email': parameters.email.toString(),
                  'file': await MultipartFile.fromFile(
                    parameters.image!.path,
                    filename: parameters.image!.path.split('/').last,
                  ),
                },
              )
            : FormData.fromMap(
                {
                  'Name': parameters.fullName.toString(),
                  'IdNumber': parameters.idNumber.toString(),
                  'Address': parameters.address.toString(),
                  'BirthDate': parameters.birthDate.toString(),
                  'Email': parameters.email.toString(),
                },
              ),
      );
      if (response.statusCode == 200) {
        return RegisterStepTwoModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<UserDataModel> getUserData(UserDataParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getUserDataEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
          },
        ),
      );
      if (response.statusCode == 200) {
        return UserDataModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<TeacherFinalRegisterModel> teacherFinalRegister(
      TeacherFinalRegisterParameters parameters) async {
    try {
      var formData = FormData();
      for (var i = 0; i < parameters.attachments.length; i++) {
        formData.files.add(
          MapEntry(
            "Certifications",
            await MultipartFile.fromFile(
              parameters.attachments[i].path,
              filename: parameters.attachments[i].path.split("/").last,
            ),
          ),
        );
      }
      formData.files.add(
        MapEntry(
          "Identification",
          await MultipartFile.fromFile(
            parameters.idImage.path,
            filename: parameters.idImage.path.split("/").last,
          ),
        ),
      );
      for (var i = 0; i < parameters.materials.length; i++) {
        formData.fields.add(
          MapEntry("MaterialIds",
              int.parse(parameters.materials[i].toString()).toString()),
        );
      }

      formData.fields.add(
        MapEntry("QualificationYear", parameters.certificateYear.toString()),
      );
      formData.fields.add(
        MapEntry("QualificationCertificateName",
            parameters.certificateName.toString()),
      );
      final response =
          await Dio().post(ApiConstance.teacherFinalRegisterEndPoint,
              options: Options(
                headers: {
                  'Authorization': 'Bearer ${ApiConstance.token()}',
                  'Content-Type': 'multipart/form-data'
                },
              ),
              data: formData);
      if (response.statusCode == 200) {
        return TeacherFinalRegisterModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<TeacherMaterialModel> getTeacherMaterial(
      NoParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.teacherMaterialEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'Content-Type': 'multipart/form-data',
            'language': ApiConstance.lang()
          },
        ),
      );
      if (response.statusCode == 200) {
        return TeacherMaterialModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<StudentRegisterStep2Model> studentRegisterStep2(
      StudentRegisterStep2Parameters parameters) async {
    try {
      final response = await Dio().post(ApiConstance.fillStudentUserDataStep2,
          options: Options(
            headers: {
              'Authorization': 'Bearer ${ApiConstance.token()}',
              'language': ApiConstance.lang()
            },
          ),
          data: {'eductionGradeId': parameters.studentGradeId});
      if (response.statusCode == 200) {
        return StudentRegisterStep2Model.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<ResendVerificationModel> resendVerification(
      ResendVerificationParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.resendVerification,
        options: Options(
          headers: {'language': ApiConstance.lang()},
        ),
        data: {
          'UserId': parameters.userId,
        },
      );
      if (response.statusCode == 200) {
        return ResendVerificationModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<InitialForgetPasswordModel> initialForgetPassword(
      InitialForgetPasswordParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.initialForgetPassword(userName: parameters.userName),
        options: Options(
          headers: {
            'language': ApiConstance.lang(),
          },
        ),
      );
      if (response.statusCode == 200) {
        return InitialForgetPasswordModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<VerificationForgetPasswordModel> verificationForgetPassword(
      VerificationForgetPasswordParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.verifyForgetPasswordCode,
        options: Options(
          headers: {
            'language': ApiConstance.lang(),
          },
        ),
        data: {
          'userId': parameters.userId,
          'verificationCode': parameters.verificationCode
        },
      );
      if (response.statusCode == 200) {
        return VerificationForgetPasswordModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<ForgetPasswordModel> forgetPassword(
      ForgetPasswordParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.forgetPassword,
        options: Options(
          headers: {
            'language': ApiConstance.lang(),
          },
        ),
        data: {
          'userId': parameters.userId,
          'token': ApiConstance.token(),
          'password': parameters.password,
          'passwordConfirm': parameters.passwordConfirmed,
        },
      );
      if (response.statusCode == 200) {
        return ForgetPasswordModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw HandleException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }
}
