// ignore_for_file: file_names, avoid_print, unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:hassy/Features/teacher/data/models/add_place_model.dart';
import 'package:hassy/Features/teacher/data/models/get_cities_model.dart';
import 'package:hassy/Features/teacher/data/models/get_complaints_model.dart';
import 'package:hassy/Features/teacher/data/models/get_student_model.dart';
import 'package:hassy/Features/teacher/data/models/teacher_update_basic_data_model.dart';
import 'package:hassy/Features/teacher/data/models/teacher_update_user_data_model.dart';
import 'package:hassy/Features/teacher/data/models/update_teacher_places_model.dart';
import 'package:hassy/Features/teacher/domain/use_cases/add_place_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_cities_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_common_questions_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_complaints_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_teacher_personal_data_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/teacher_update_basic_data_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/teacher_update_user_data_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/update_teacher_places_use_case.dart';

import '../../../../core/utils/api/api_constance.dart';
import '../../../../core/utils/api/exception_method.dart';
import '../../domain/use_cases/add_complaints_use_case.dart';
import '../../domain/use_cases/get_area_use_case.dart';
import '../../domain/use_cases/get_country_use_case.dart';
import '../../domain/use_cases/get_lesson_type_use_case.dart';
import '../../domain/use_cases/get_privacy_policy_use_case.dart';
import '../../domain/use_cases/get_student_use_case.dart';
import '../../domain/use_cases/get_teacher_place_use_case.dart';
import '../models/add_complaints_model.dart';
import '../models/get_country_model.dart';
import '../models/get_lesson_type_model.dart';
import '../models/get_privacy_policy_model.dart';
import '../models/get_teacher_personal_data_model.dart';
import '../models/get_teacher_place_model.dart';

abstract class BaseTeacherDataSource {
  Future<StudentModel> getAllStudent(StudentParameters parameters);
  Future<TeacherPersonalDataModel> getTeacherPersonalData(
      TeacherPersonalParameters parameters);
  Future<TeacherUpdateUserDataModel> teacherUpdateUserData(
      TeacherUpdateUserDataParameters parameters);
  Future<TeacherUpdateBasicDataModel> teacherUpdateBasicData(
      UpdateUserBasicDataParameters parameters);
  Future<AddPlaceModel> addPlace(AddPlaceParameters parameters);
  Future<GetComplaintModel> getComplaints(GetComplaintsParameters parameters);
  Future<AddComplaintsModel> addComplaints(AddComplaintsParameters parameters);
  Future<GetPrivacyPolicyModel> getPrivacyPolicy(
      GetPrivacyPolicyParameters parameters);
  Future<GetLessonTypeModel> getLessonType(GetLessonTypeParameters parameters);
  Future<GetTeacherPlaceModel> getTeacherPlaces(
      GetTeacherPlaceParameters parameters);
  Future<GetPrivacyPolicyModel> getCommonQuestions(
      GetCommonQuestionsParameters parameters);
  Future<GetCountryModel> getCountry(GetCountryParameters parameters);
  Future<GetCitiesModel> getCities(GetCitiesParameters parameters);
  Future<GetCitiesModel> getAreas(GetAreasParameters parameters);
  Future<UpdateTeacherPlacesModel> updatePlaces(
      UpdateTeacherPlacesParameters parameters);
}

class TeacherDataSource extends BaseTeacherDataSource {
  @override
  Future<StudentModel> getAllStudent(StudentParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getAllStudentEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang()
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        return StudentModel.fromJson(response.data);
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
  Future<TeacherPersonalDataModel> getTeacherPersonalData(
      TeacherPersonalParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getTeacherPersonalData,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang()
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        return TeacherPersonalDataModel.fromJson(response.data);
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
  Future<TeacherUpdateUserDataModel> teacherUpdateUserData(
      TeacherUpdateUserDataParameters parameters) async {
    try {
      var formData = FormData();
      if (parameters.idImage == null) {
        if (parameters.attachments.isNotEmpty) {
          for (var i = 0; i < parameters.attachments.length; i++) {
            formData.files.add(
              MapEntry(
                "Certifications",
                await MultipartFile.fromFile(
                  parameters.attachments[i].path,
                  filename: parameters.attachments[i].path.split('/').last,
                ),
              ),
            );
          }
        }
        // formData.files.add(
        //   MapEntry(
        //     "Identification",
        //     await MultipartFile.fromFile(
        //       parameters.idImage!.path,
        //       filename: parameters.idImage!.path.split("/").last,
        //     ),
        //   ),
        // );
        for (var i = 0; i < parameters.materials.length; i++) {
          formData.fields.add(
            MapEntry("MaterialIds",
                int.parse(parameters.materials[i].toString()).toString()),
          );
        }
        for (var i = 0; i < parameters.deleteFiles.length; i++) {
          formData.fields.add(
            MapEntry("DeletedFileIdsList",
                int.parse(parameters.deleteFiles[i].toString()).toString()),
          );
        }
        formData.fields.add(
          MapEntry("QualificationYear", parameters.certificateYear.toString()),
        );
        formData.fields.add(
          MapEntry("QualificationCertificateName",
              parameters.certificateName.toString()),
        );
      } else {
        for (var i = 0; i < parameters.attachments.length; i++) {
          formData.files.add(
            MapEntry(
              "Certifications",
              await MultipartFile.fromFile(
                parameters.attachments[i].path,
                filename: parameters.attachments[i].path.split('/').last,
              ),
            ),
          );
        }
        formData.files.add(
          MapEntry(
            "Identification",
            await MultipartFile.fromFile(
              parameters.idImage!.path,
              filename: parameters.idImage!.path.split("/").last,
            ),
          ),
        );
        for (var i = 0; i < parameters.materials.length; i++) {
          formData.fields.add(
            MapEntry("MaterialIds",
                int.parse(parameters.materials[i].toString()).toString()),
          );
        }
        for (var i = 0; i < parameters.deleteFiles.length; i++) {
          formData.fields.add(
            MapEntry("DeletedFileIdsList",
                int.parse(parameters.deleteFiles[i].toString()).toString()),
          );
        }

        formData.fields.add(
          MapEntry("QualificationYear", parameters.certificateYear.toString()),
        );
        formData.fields.add(
          MapEntry("QualificationCertificateName",
              parameters.certificateName.toString()),
        );
      }

      print(
          '${parameters.certificateName},${parameters.certificateYear},${parameters.materials},${parameters.attachments},${parameters.deleteFiles},${parameters.idImage}');
      final response = await Dio().post(
        ApiConstance.teacherUpdateUserDataEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'Content-Type': 'multipart/form-data'
          },
        ),
        data: formData,
      );
      if (response.statusCode == 200) {
        print(response.data.toString());
        return TeacherUpdateUserDataModel.fromJson(response.data);
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
  Future<TeacherUpdateBasicDataModel> teacherUpdateBasicData(
      UpdateUserBasicDataParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.updateUserBasicDataEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
        data: {
          'name': parameters.name.toString(),
          'address': parameters.address.toString(),
          'birthDate': parameters.birthDate.toString(),
          'email': parameters.email.toString(),
        },
      );
      if (response.statusCode == 200) {
        return TeacherUpdateBasicDataModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
  Future<AddPlaceModel> addPlace(AddPlaceParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.addPlaceEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
        data: {
          'name': parameters.name.toString(),
          "countryName": parameters.countryName.toString(),
          'cityName': parameters.cityName.toString(),
          'countryId': parameters.countryId,
          'cityId': parameters.cityId,
          'areaId': parameters.areaId,
          'streetName': parameters.streetName.toString(),
          'longitude': parameters.longitude.toString(),
          'latitude': parameters.latitude.toString(),
        },
      );

      if (response.statusCode == 200) {
        return AddPlaceModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
  Future<GetComplaintModel> getComplaints(
      GetComplaintsParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getComplaintsEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetComplaintModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
  Future<AddComplaintsModel> addComplaints(
      AddComplaintsParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.addComplaintsEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
        data: {
          "complaintTypeId": parameters.complaintTypeId,
          "title": parameters.title,
          "body": parameters.body,
        },
      );

      if (response.statusCode == 200) {
        return AddComplaintsModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
  Future<GetPrivacyPolicyModel> getPrivacyPolicy(
      GetPrivacyPolicyParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getPrivacyPolicyEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetPrivacyPolicyModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
  Future<GetLessonTypeModel> getLessonType(
      GetLessonTypeParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getLessonTypeEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetLessonTypeModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
  Future<GetTeacherPlaceModel> getTeacherPlaces(
      GetTeacherPlaceParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getTeacherPlaceEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetTeacherPlaceModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
  Future<GetPrivacyPolicyModel> getCommonQuestions(
      GetCommonQuestionsParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getCommonQuestionsEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetPrivacyPolicyModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
  Future<GetCountryModel> getCountry(GetCountryParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getCountryEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetCountryModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
  Future<GetCitiesModel> getCities(GetCitiesParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getCitiesEndPoint(countryId: parameters.countryId),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetCitiesModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
  Future<GetCitiesModel> getAreas(GetAreasParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.getAreasEndPoint(cityId: parameters.cityId),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return GetCitiesModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
  Future<UpdateTeacherPlacesModel> updatePlaces(
      UpdateTeacherPlacesParameters parameters) async {
    try {
      final response = await Dio().post(
        ApiConstance.updatePlaceEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConstance.token()}',
            'language': ApiConstance.lang(),
            'Content-Type': 'application/json'
          },
          validateStatus: (status) {
            print(status.toString());
            return status! < 500;
          },
        ),
        data: {
          'name': parameters.name.toString(),
          "countryName": parameters.countryName.toString(),
          'cityName': parameters.cityName.toString(),
          'countryId': parameters.countryId,
          'cityId': parameters.cityId,
          'areaId': parameters.areaId,
          'streetName': parameters.streetName.toString(),
          'longitude': parameters.longitude.toString(),
          'latitude': parameters.latitude.toString(),
          'id': parameters.id,
        },
      );

      if (response.statusCode == 200) {
        return UpdateTeacherPlacesModel.fromJson(response.data);
      } else {
        throw HandleException(
          statusCode: response.statusCode!,
          message: response.data.toString(),
        );
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        print(e.response!.data.toString());
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
