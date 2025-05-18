import 'dart:io';

class ApiConstance {
  // static const String baseUrl = "http://testlessons-001-site1.itempurl.com/api";
  static const String baseUrl =
      "http://testlessons-001-site6.anytempurl.com/api";
  static const int apiVersion = 1;
  static String loginEndPoint = "/v$apiVersion/Account/Login";
  static String initialRegisterEndPoint =
      "/v$apiVersion/Account/InitialRegister";
  static String verificationRegisterEndPoint =
      "/v$apiVersion/Account/RegisterVerification";
  static String registerStepTwoEndPoint =
      "/v$apiVersion/User/FillUserDataStep1";
  static String updateUserBasicDataEndPoint =
      "/v$apiVersion/User/UpdateUserBasicData";
  static String addPlaceEndPoint = "/v$apiVersion/TeacherPlace/AddTeacherPlace";
  static String getStudentWalletDataEndPoint =
      "/v$apiVersion/Wallet/GetWalletBalanceAndProcesses";
  static String updatePlaceEndPoint =
      "/v$apiVersion/TeacherPlace/UpdateTeacherPlace";
  static String addClassEndPoint = "/v$apiVersion/Lesson/CreateLesson";
  static String updateClassEndPoint = "/v$apiVersion/Lesson/UpdateLesson";
  static String addComplaintsEndPoint =
      "/v$apiVersion/Complaint/CreateComplaint";
  static String getComplaintsEndPoint =
      "/v$apiVersion/Complaint/GetComplaintsTypes";
  static String getPrivacyPolicyEndPoint =
      "/v$apiVersion/AppString/GetPrivacyPolicies";
  static String getUsagePolicyEndPoint =
      "/v$apiVersion/UsagePolicy/GetUsagePolicies";
  static String getCommonQuestionsEndPoint =
      "/v$apiVersion/AppString/GetCommonQuestions";
  static String getCountryEndPoint = "/v$apiVersion/MainData/GetCountries";
  static String getCitiesEndPoint({required int countryId}) =>
      "/v$apiVersion/MainData/GetCities?CountryId=$countryId";
  static String getAreasEndPoint({required int cityId}) =>
      "/v$apiVersion/MainData/GetAreas?CityId=$cityId";
  static String getLessonTypeEndPoint = "/v$apiVersion/Lesson/GetLessonsTypes";
  static String getTeacherPlaceEndPoint =
      "/v$apiVersion/TeacherPlace/GetTeacherPlaces";
  static const String teacherFinalRegisterEndPoint =
      "/v$apiVersion/User/FillTeacherUserDataStep2Simple";
  static const String teacherUpdateUserDataEndPoint =
      "/v$apiVersion/Teacher/UpdateTeacherUserData";
  static const String teacherMaterialEndPoint =
      "/v$apiVersion/MainData/GetMaterials";

  static const String imagePath =
      "https://hamdysaid10-001-site1.btempurl.com/www/mylessons/files/profileimages/";
  static String imageUrl(File path) => '$imagePath$path';
  static String getUserDataEndPoint = "/v$apiVersion/User/GetUserData";
  //
  // static String lang() => CacheHelper.getData(key: AppStrings.localCode) == 'en'
  //     ? 'en-US'
  //     : 'ar-EG';
  // static String token() =>
  // 'ssss';
  // CacheHelper.getData(key: AppStrings.userToken);
  static String staticStudentToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKV1RTZXJ2aWNlQWNjZXNzVG9rZW4iLCJqdGkiOiJhYjg1ZGNjMy1hMTEyLTQ4NmMtOTQ3Ni1iYzM5YmJlNzhjNjEiLCJpYXQiOiIxMy8wMS8yMDI0IDExOjMwOjU2INi1IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6ImFiZGVscmFobWFuIHlvdXNzcnkiLCJVc2VyTmFtZSI6ImFiZG84Mzg0IiwiRW1haWwiOiJhYmRvYWJkbzgzODRAZ21haS5jb20iLCJVc2VyVHlwZSI6IjIiLCJVc2VySWQiOiI1IiwiZXhwIjoxNzA1MzE4MjU2LCJpc3MiOiJKV1RNeUxlc3NvbnNTZXJ2ZXIiLCJhdWQiOiJKV1RMZXNzb25zU2VydmljZUNsaWVudCJ9.MaMNmX2sWcu3FUZMvxdSZ6wQPftQkYHbwQ6_zjTQeZE';
  static String staticTeacherToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKV1RTZXJ2aWNlQWNjZXNzVG9rZW4iLCJqdGkiOiIyMDExZDEwYi05YTU2LTRkNjYtOTlmZi00NDAyY2FmZjJiYzYiLCJpYXQiOiIxOS8wMS8yMDI0IDExOjAwOjMxINmFIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6ImFsaSBtYWhtb3VkIiwiVXNlck5hbWUiOiJ0ZWFjaGVyIiwiRW1haWwiOiJhbGltQGdtYWlsLmNvbSIsIlVzZXJUeXBlIjoiMSIsIlVzZXJJZCI6IjIiLCJleHAiOjE3MDU4NzgwMzEsImlzcyI6IkpXVE15TGVzc29uc1NlcnZlciIsImF1ZCI6IkpXVExlc3NvbnNTZXJ2aWNlQ2xpZW50In0.Q6Pf5cz7j0AP1z3puShLSgSXipRF3Jvg8BIg3OkmYUo';
  static String getEducationSystems =
      "/v$apiVersion/MainData/GetEducationSystems";
  static String getEducationLevel({required int educationSystemId}) =>
      "/v$apiVersion/MainData/GetEducationLevels?EductionSystemId=$educationSystemId";

  static String getEducationGrade({required int educationLevelId}) =>
      "/v$apiVersion/MainData/GetEducationGrades?EductionLevelId=$educationLevelId";

  static String updateUserProfileImage =
      "/v$apiVersion/User/UpdateUserProfileImage";

  static String getTeacherPersonalData =
      "/v$apiVersion/Teacher/GetTeacherPersonalData";
  static String resendVerification({required int userId}) =>
      "/v$apiVersion/Account/ResendVerificationCode?UserId=$userId";
  static String initialForgetPassword({required phoneNumber}) =>
      "/v$apiVersion/Account/InitialForgetPassword?PhoneNumber=$phoneNumber";
  static String verifyForgetPasswordCode =
      "/v$apiVersion/Account/VerifyForgetPasswordCode";
  static String forgetPassword = "/v$apiVersion/Account/ForgetPassword";
  static String currentClassEndPoint =
      "/v$apiVersion/Lesson/GetTeacherLessonCurrent";
  static String previousClassEndPoint =
      "/v$apiVersion/Lesson/GetTeacherLessonPrevious";
  static String getClassByIdEndPoint =
      "/v$apiVersion/Lesson/GetTeacherLessonById";
  static String getLessonReviews = "/v$apiVersion/Teacher/GetTeacherReviews";
  static String getAllStudentReservationEndPoint({required int lessonId}) =>
      "/v$apiVersion/Lesson/GetAllLessonReservation?lessonId=$lessonId";
  static String confirmAttendanceEndPoint =
      "/v$apiVersion/Lesson/SaveAttendance";
  static String mostReservedLessonEndPoint =
      "/v$apiVersion/Lesson/GetTeacherLessonMostReserved";
  static String teacherDashBoardEndPoint =
      "/v$apiVersion/Teacher/GetTeacherDashBoardData";
  static String teacherFilterOperationEndPoint =
      "/v$apiVersion/Teacher/GetTeacherOperationFiltered";
  static String teacherWithdrawRequest =
      "/v$apiVersion/Teacher/CreateTeacherWithdrawalRequest";
  static String teacherWithdrawMethod =
      "/v$apiVersion/MainData/GeWithdrawalMethods";
  static String sendTeacherParentMessage =
      "/v$apiVersion/Teacher/SendTeacherParentMessage";
  static String getTeacherParentMessage =
      "/v$apiVersion/Teacher/GetTeacherParentMessage";
  static String replyTeacherParentMessage =
      "/v$apiVersion/Teacher/ReplyTeacherParentMessage";

  static String getTeacherParentRepliesMessage({required int messageId}) =>
      "/v$apiVersion/Teacher/GetTeacherParentMessageReplies?MessageId=$messageId";
  //Student
  static const String getAllStudentEndPoint = "/v$apiVersion/Test/GetStudent";
  static String fillStudentUserDataStep2 =
      "/v$apiVersion/User/FillStudentUserDataStep2";
  static String updateStudentUserData =
      "/v$apiVersion/Student/UpdateStudentUserData";
  static String getStudentPersonalData =
      "/v$apiVersion/Student/GetStudentPersonalData";
  static String getNearestTeacherStudent =
      "/v$apiVersion/Student/GetNearestTeacherStudent";
  static String addCreditCardEndPoint =
      "/v$apiVersion/CreditCard/AddCreditCard";
  static String getCreditCardEndPoint =
      "/v$apiVersion/CreditCard/GetCreditCards";
  static String deleteCreditCardEndPoint =
      "/v$apiVersion/CreditCard/DeleteCreditCard";
  static String getStudentLessonFilterEndPoint =
      "/v$apiVersion/Lesson/GetStudentLessonFilter";
  static String getReservedStudentLessonCurrentEndPoint =
      "/v$apiVersion/Lesson/GetReservedStudentLessonCurrent";
  static String getReservedStudentLessonPreviousEndPoint =
      "/v$apiVersion/Lesson/GetReservedStudentLessonPrevious";
  static String getPaymentMethod = "/v$apiVersion/MainData/GetPaymentMethods";
  static String usePromoCode = "/v$apiVersion/Lesson/UsePromoCode";
  static String getTeacherNewMaterial({required int eductionGradeId}) =>
      "/v$apiVersion/MainData/GetMaterials?EductionGradeId=$eductionGradeId";
  static String startLessonEndPoint = "/v$apiVersion/Lesson/StartLesson";
  static String finishLessonEndPoint = "/v$apiVersion/Lesson/FinishLesson";
  static String createReservationStudent =
      "/v$apiVersion/Lesson/CreateReservationStudent";
  static String saveTeacherId = "/v$apiVersion/User/SaveTeacherIdentity";
  static String saveCertification =
      "/v$apiVersion/User/SaveTeacherCertification";
  static String saveTeacherReview = "/v$apiVersion/Teacher/SaveTeacherReview";
  static String cancelReservation =
      "/v$apiVersion/Lesson/CancelReservationStudent";
  static String addStudentBalance = "/v$apiVersion/Wallet/AddWalletBalance";
  ///////////////////////////////////////////////
}
