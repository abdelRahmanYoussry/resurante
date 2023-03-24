import 'dart:io';

import '../shared/app/strings_manager.dart';
import '../shared/chace_helper/cache_helper.dart';

class ApiConstance {
  static const String baseUrl = "http://hamdysaid10-001-site1.btempurl.com/api";
  static const int apiVersion = 1;
  static String loginEndPoint = "$baseUrl/v$apiVersion/Account/Login";
  static String initialRegisterEndPoint =
      "$baseUrl/v$apiVersion/Account/InitialRegister";
  static String verificationRegisterEndPoint =
      "$baseUrl/v$apiVersion/Account/RegisterVerification";
  static String registerStepTwoEndPoint =
      "$baseUrl/v$apiVersion/User/FillUserDataStep1";
  static String updateUserBasicDataEndPoint =
      "$baseUrl/v$apiVersion/User/UpdateUserBasicData";
  static String addPlaceEndPoint =
      "$baseUrl/v$apiVersion/TeacherPlace/AddTeacherPlace";
  static String updatePlaceEndPoint =
      "$baseUrl/v$apiVersion/TeacherPlace/UpdateTeacherPlace";
  static String addComplaintsEndPoint =
      "$baseUrl/v$apiVersion/Complaint/CreateComplaint";
  static String getComplaintsEndPoint =
      "$baseUrl/v$apiVersion/Complaint/GetComplaintsTypes";
  static String getPrivacyPolicyEndPoint =
      "$baseUrl/v$apiVersion/AppString/GetPrivacyPolicies";
  static String getCommonQuestionsEndPoint =
      "$baseUrl/v$apiVersion/AppString/GetCommonQuestions";
  static String getCountryEndPoint =
      "$baseUrl/v$apiVersion/MainData/GetCountries";
  static String getCitiesEndPoint({required int countryId}) =>
      "$baseUrl/v$apiVersion/MainData/GetCities?CountryId=$countryId";
  static String getAreasEndPoint({required int cityId}) =>
      "$baseUrl/v$apiVersion/MainData/GetAreas?CityId=$cityId";
  static String getLessonTypeEndPoint =
      "$baseUrl/v$apiVersion/Lesson/GetLessonsTypes";
  static String getTeacherPlaceEndPoint =
      "$baseUrl/v$apiVersion/TeacherPlace/GetTeacherPlaces";
  static const String teacherFinalRegisterEndPoint =
      "$baseUrl/v$apiVersion/User/FillTeacherUserDataStep2Simple";
  static const String teacherUpdateUserDataEndPoint =
      "$baseUrl/v$apiVersion/Teacher/UpdateTeacherUserData";
  static const String teacherMaterialEndPoint =
      "$baseUrl/v$apiVersion/MainData/GetMaterials";
  static const String getAllStudentEndPoint =
      "$baseUrl/v$apiVersion/Test/GetStudent";
  static const String imagePath =
      "https://hamdysaid10-001-site1.btempurl.com/www/mylessons/files/profileimages/";
  static String imageUrl(File path) => '$imagePath$path';
  static String getUserDataEndPoint = "$baseUrl/v$apiVersion/User/GetUserData";

  static String getStudentPersonalData =
      "$baseUrl/v$apiVersion/Student/GetStudentPersonalData";

  static String updateStudentUserData =
      "$baseUrl/v$apiVersion/Student/UpdateStudentUserData";

  static String lang() =>
      CacheHelper.getSharedPreferencesValue(key: AppStrings.localCode) == 'ar'
          ? 'ar-JO'
          : 'en';
  static String token() =>
      // 'ssss';
      CacheHelper.getSharedPreferencesValue(key: AppStrings.userToken);

  static String getEducationSystems =
      "$baseUrl/v$apiVersion/MainData/GetEducationSystems";
  static String getEducationLevel({required int educationSystemId}) =>
      "$baseUrl/v$apiVersion/MainData/GetEducationLevels?EductionSystemId=$educationSystemId";

  static String getEducationGrade({required int educationLevelId}) =>
      "$baseUrl/v$apiVersion/MainData/GetEducationGrades?EductionLevelId=$educationLevelId";

  static String updateUserProfileImage =
      "$baseUrl/v$apiVersion/User/UpdateUserProfileImage";

  static String fillStudentUserDataStep2 =
      "$baseUrl/v$apiVersion/User/FillStudentUserDataStep2";
  static String getTeacherPersonalData =
      "$baseUrl/v$apiVersion/Teacher/GetTeacherPersonalData";
  static String resendVerification =
      "$baseUrl/v$apiVersion/Account/ResendVerificationCode";
  static String initialForgetPassword({required userName}) =>
      "$baseUrl/v$apiVersion/Account/InitialForgetPassword?UserName=$userName";
  static String verifyForgetPasswordCode =
      "$baseUrl/v$apiVersion/Account/VerifyForgetPasswordCode";
  static String forgetPassword = "$baseUrl/v$apiVersion/Account/ForgetPassword";
}
