// ignore_for_file: file_names, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hassy/Features/student/data/models/update_student_user_data_model.dart';
import 'package:hassy/Features/student/domain/use_cases/udate_student_data_use_case.dart';
import 'package:hassy/Features/student/domain/use_cases/update_user_profile_image_use_case.dart';
import 'package:hassy/core/utils/api/api_constance.dart';

import '../../../../core/utils/api/exception_method.dart';
import '../../../authentication/data/models/user_data_model.dart';
import '../../../authentication/domain/use_cases/get_user_data_use_case.dart';
import '../models/get_student_personal_data_model.dart';
import '../models/update_user_profile_image_model.dart';

abstract class BaseStudentDataSource {
  Future<GetStudentPersonalDataModel> getStudentPersonalData();
  Future<UpdateStudentDataModel> updateStudentData(
      UpdateStudentDataParameters parameters);
  Future<UpdateUserProfileImageModel> updateUserProfileImage(
      UpdateUserProfileImageParameters parameters);
  Future<UserDataModel> getUserData(UserDataParameters parameters);
}

class StudentDataSource extends BaseStudentDataSource {
  @override
  Future<GetStudentPersonalDataModel> getStudentPersonalData() async {
    try {
      final response = await Dio().post(ApiConstance.getStudentPersonalData,
          options: Options(
            headers: {
              'Authorization': 'Bearer ${ApiConstance.token()}',
              'language': ApiConstance.lang()
            },
            validateStatus: (status) {
              debugPrint('$status this is student satues code');
              return status! < 500;
            },
          ));

      if (response.statusCode == 200) {
        return GetStudentPersonalDataModel.fromJson(response.data);
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
  Future<UpdateStudentDataModel> updateStudentData(
      UpdateStudentDataParameters parameters) async {
    try {
      final response = await Dio().post(ApiConstance.updateStudentUserData,
          options: Options(headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang()
          }),
          data: {'educationGradeId': parameters.updateStudentIdGrade});
      if (response.statusCode == 200) {
        return UpdateStudentDataModel.fromJson(response.data);
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
  Future<UpdateUserProfileImageModel> updateUserProfileImage(
      UpdateUserProfileImageParameters parameters) async {
    try {
      final response = await Dio().post(ApiConstance.updateUserProfileImage,
          options: Options(
            headers: {
              'Authorization': 'Bearer ${ApiConstance.token()}',
              'language': ApiConstance.lang(),
              'Content-Type': 'multipart/form-data',
            },
            validateStatus: (status) {
              return status! < 500;
            },
          ),
          data: FormData.fromMap({
            'Image': await MultipartFile.fromFile(
              parameters.image.path,
              filename: parameters.image.path.split('/').last,
            )
          }));
      print(parameters.image);
      if (response.statusCode == 200) {
        return UpdateUserProfileImageModel.fromJson(response.data);
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
}
// @override
// Future<StudentRegisterStep2Model> studentRegisterStep2(
//     StudentRegisterStep2Parameters parameters) async {
//   try {
//     final response = await Dio().post(ApiConstance.fillStudentUserDataStep2,
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer ${ApiConstance.token()}',
//             'language': ApiConstance.lang()
//           },
//         ),
//         data: {'eductionGradeId': parameters.studentGradeId});
//     if (response.statusCode == 200) {
//       return StudentRegisterStep2Model.fromJson(response.data);
//     } else {
//       throw HandleException(
//         statusCode: response.statusCode!,
//         message: response.data.toString(),
//       );
//     }
//   } on DioError catch (e) {
//     if (e.response != null && e.response!.statusCode != null) {
//       throw HandleException(
//         statusCode: e.response!.statusCode!,
//         message: e.response!.data.toString(),
//       );
//     } else {
//       throw Exception(e.message);
//     }
//   }
// }
