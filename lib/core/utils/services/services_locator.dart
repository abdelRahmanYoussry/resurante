// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:hassy/Features/authentication/data/data_sources/AuthDataSourse.dart';
// import 'package:hassy/Features/authentication/data/repositories/AuthRepository.dart';
// import 'package:hassy/Features/authentication/domain/repositories/BaseAuthRepository.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/Verification_forgetPassword_useCase.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/Verification_register_useCase.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/cancelUploadedFileUseCase.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/forget_password_useCase.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/get_material_use_case.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/get_teacher_bool_use_case.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/initial_forget_password_use_case.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/save_parent_bool_use_case.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/student_register_step2_use_case.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/teacher_fianl_register_use_case.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/uploadFileUseCase.dart';
// import 'package:hassy/Features/authentication/domain/use_cases/uploadMultiFilesUseCase.dart';
// import 'package:hassy/Features/filter/cubit/filter_cubit.dart';
// import 'package:hassy/Features/lesson/lessn_by_id/cubit/lesson_by_id_cubit.dart';
// import 'package:hassy/Features/startup/data/data_sources/onboarding_local_data_source.dart';
// import 'package:hassy/Features/startup/data/repositories/onboarding_repository.dart';
// import 'package:hassy/Features/startup/domain/repositories/base_onboarding_repository.dart';
// import 'package:hassy/Features/startup/domain/use_cases/change_language_use_case.dart';
// import 'package:hassy/Features/startup/domain/use_cases/get_onboardingitems_usecase.dart';
// import 'package:hassy/Features/startup/domain/use_cases/get_saved_lang_use_case.dart';
// import 'package:hassy/Features/startup/domain/use_cases/update_boarding_view_use_case.dart';
// import 'package:hassy/Features/startup/presentation/manager/startup_cubit.dart';
// import 'package:hassy/Features/student/data/repositories/StudentRepository.dart';
// import 'package:hassy/Features/student/domain/use_cases/add_credit_card_use_case.dart';
// import 'package:hassy/Features/student/domain/use_cases/cancel_reservation_use_case.dart';
// import 'package:hassy/Features/student/domain/use_cases/create_reservation_use_case.dart';
// import 'package:hassy/Features/student/domain/use_cases/get_available_lessons_use_case.dart';
// import 'package:hassy/Features/student/domain/use_cases/get_nearest_teachers_use_case.dart';
// import 'package:hassy/Features/student/domain/use_cases/get_payment_method_use_case.dart';
// import 'package:hassy/Features/student/domain/use_cases/get_student_personal_data_use_case.dart';
// import 'package:hassy/Features/student/domain/use_cases/promoCode_use_case.dart';
// import 'package:hassy/Features/student/domain/use_cases/save_teacher_review_use_case.dart';
// import 'package:hassy/Features/student/domain/use_cases/update_user_profile_image_use_case.dart';
// import 'package:hassy/Features/student/presentation/manager/student_cubit/student_home_cubit/student_home_cubit.dart';
// import 'package:hassy/Features/student/presentation/manager/student_cubit/student_lesson_cubit/student_lesson_cubit.dart';
// import 'package:hassy/Features/student/presentation/manager/student_cubit/student_material_cubit/student_material_cubit.dart';
// import 'package:hassy/Features/student/presentation/manager/student_cubit/student_payment_cubit/student_payment_cubit.dart';
// import 'package:hassy/Features/student/presentation/manager/student_profile_cubit/student_profile_cubit.dart';
// import 'package:hassy/Features/student_wallet/domain/use_cases/get_student_wallet_data_use_case.dart';
// import 'package:hassy/Features/teacher/data/data_sources/TeacherDataSource.dart';
// import 'package:hassy/Features/teacher/data/repositories/TeacherRepository.dart';
// import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/add_place_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/add_teacher_id_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/confirm_attendance_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_cities_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_common_questions_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_complaints_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_current_classes_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_lesson_by_id_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_lesson_reviews_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_mostReserved_classes_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_previous_classes_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_student_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_teacher_dashboard_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_teacher_filter_opration_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_teacher_personal_data_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_teacher_withDraw_method_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/get_usage_policy_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/new_get_material_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/send_teacher_parent_message_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/start_lesson_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/teacher_update_user_data_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/teacher_withdraw_request_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/update_teacher_places_use_case.dart';
// import 'package:hassy/Features/teacher/domain/use_cases/upload_certification_use_case.dart';
// import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_new_profile_cubit.dart';
// import 'package:hassy/Features/teacher/presentation/manager/teacher_chat/teacher_chat_cubit.dart';
// import 'package:hassy/Features/user_service/presentation/manager/user_service_cubit.dart';
// import 'package:hassy/core/utils/network/remote/api_helper.dart';
// import 'package:hassy/core/utils/network/remote/dio_helper.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../Features/authentication/domain/use_cases/CancelUploadedFileFromListUseCase.dart';
// import '../../../Features/authentication/domain/use_cases/Initial_Register_useCase.dart';
// import '../../../Features/authentication/domain/use_cases/SaveRegisterTypeUseCase.dart';
// import '../../../Features/authentication/domain/use_cases/get_Education_Level_use_case.dart';
// import '../../../Features/authentication/domain/use_cases/get_Education_system_use_case.dart';
// import '../../../Features/authentication/domain/use_cases/get_education_grade_use_case.dart';
// import '../../../Features/authentication/domain/use_cases/get_parent_bool_use_case.dart';
// import '../../../Features/authentication/domain/use_cases/get_student_bool_use_case.dart';
// import '../../../Features/authentication/domain/use_cases/get_user_data_use_case.dart';
// import '../../../Features/authentication/domain/use_cases/resend_verification_use_case.dart';
// import '../../../Features/authentication/domain/use_cases/save_student_bool_use_case.dart';
// import '../../../Features/authentication/domain/use_cases/save_teacher_bool_use_case.dart';
// import '../../../Features/authentication/domain/use_cases/user__register_step_two_use_case.dart';
// import '../../../Features/authentication/domain/use_cases/user_login_use_case.dart';
// import '../../../Features/authentication/presentation/manager/auth_cubit/authentication_cubit.dart';
// import '../../../Features/search/cubit/search_cubit.dart';
// import '../../../Features/student/data/data_sources/StudntDataSourse.dart';
// import '../../../Features/student/domain/repositories/BaseStudentRepository.dart';
// import '../../../Features/student/domain/use_cases/delete_credit_card_use_case.dart';
// import '../../../Features/student/domain/use_cases/get_credit_card_use_case.dart';
// import '../../../Features/student/domain/use_cases/get_previous_lessons_use_case.dart';
// import '../../../Features/student/domain/use_cases/get_reserved_lessons_use_case.dart';
// import '../../../Features/student/domain/use_cases/udate_student_data_use_case.dart';
// import '../../../Features/student_wallet/data/data_sources/StudentWalletDataSource.dart';
// import '../../../Features/student_wallet/data/repositories/StudentWalletRepository.dart';
// import '../../../Features/student_wallet/domain/repositories/BaseStudentWalletRepository.dart';
// import '../../../Features/student_wallet/domain/use_cases/add_balance_use_case.dart';
// import '../../../Features/student_wallet/presentation/manager/student_wallet_cubit.dart';
// import '../../../Features/teacher/domain/use_cases/add_class_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/add_complaints_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/finish_lesson_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/get_all_student_reservation_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/get_area_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/get_country_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/get_lesson_type_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/get_privacy_policy_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/get_teacher_parent_message_replies_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/get_teacher_parent_message_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/get_teacher_place_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/reply_teacher_parent_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/teacher_update_basic_data_use_case.dart';
// import '../../../Features/teacher/domain/use_cases/update_class_use_case.dart';
// import '../../../Features/teacher/presentation/manager/teacher_home/teacher_home_cubit.dart';
// import '../../../Features/teacher/presentation/manager/teacher_lesson/teacher_lesson_cubit.dart';
// import '../../../Features/teacher_wallet/manager/teacher_wallet_cubit/teacher_wallet_cubit.dart';
// import '../network/network_info.dart';
// import '../shared/filter_parameters/available_lessons_parameters.dart';
// import '../shared/filter_parameters/previous_lessons_parameters.dart';
// import '../shared/filter_parameters/reserved_lessons_parameters.dart';
//
// final serviceLocator = GetIt.I;
//
// Future initializeDependencies() async {
//   //// Bloc
//   // final myBlocObserver = Bloc.observer = MyBlocObserver();
//   // serviceLocator.registerFactory(() => myBlocObserver);
//   ///// SHARED PREFERENCES
//   final sharedPreferences = await SharedPreferences.getInstance();
//   serviceLocator.registerFactory(() => sharedPreferences);
//   //// DIO
//   serviceLocator.registerLazySingleton(() => LogInterceptor(
//         request: true,
//         requestBody: true,
//         requestHeader: true,
//         responseBody: true,
//         responseHeader: true,
//         error: true,
//       ));
//   serviceLocator.registerLazySingleton(() => Dio());
//   serviceLocator.registerLazySingleton(
//     () => NetworkInfoImpl(
//       connectionChecker: serviceLocator(),
//     ),
//   );
//   // api helpers
//   serviceLocator.registerLazySingleton<ApiHelper>(
//     () => ApiImpl(),
//   );
//   serviceLocator.registerLazySingleton<DioHelper>(
//     () => DioImpl(),
//   );
//   serviceLocator.registerLazySingleton<BaseStudentDataSource>(
//     () => StudentDataSource(
//       apiHelper: serviceLocator(),
//       dioHelper: serviceLocator(),
//     ),
//   );
//
//   serviceLocator.registerFactory(() => OnBoardingCubit(
//       serviceLocator(), serviceLocator(), serviceLocator(), serviceLocator()));
//
//   serviceLocator.registerFactory<LessonByIdCubit>(
//     () => LessonByIdCubit(
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerFactory<SearchCubit>(
//     () => SearchCubit(
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerFactory<StudentHomeCubit>(
//     () => StudentHomeCubit(
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerFactory<StudentLessonCubit>(
//     () => StudentLessonCubit(
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerFactory<MaterialCubit>(
//     () => MaterialCubit(
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerFactory<StudentWalletCubit>(
//     () => StudentWalletCubit(
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerFactory<StudentPaymentCubit>(
//     () => StudentPaymentCubit(
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerFactory(
//     () => FilterCubit(
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerFactory(() => UserServiceCubit(
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//       ));
//   serviceLocator.registerFactory(() => StudentProfileCubit(
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//       ));
//   serviceLocator.registerFactory(() => TeacherWalletCubit(
//         serviceLocator(),
//       ));
//   serviceLocator.registerFactory(() => AuthenticationCubit(
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//         serviceLocator(),
//       ));
//   serviceLocator.registerFactory<TeacherHomeCubit>(
//     () => TeacherHomeCubit(),
//   );
//   serviceLocator.registerFactory<TeacherChatCubit>(
//     () => TeacherChatCubit(
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerFactory<TeacherLessonCubit>(
//     () => TeacherLessonCubit(
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerFactory<TeacherProfileNewCubit>(
//     () => TeacherProfileNewCubit(
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   // //// UseCases
//   serviceLocator
//       .registerLazySingleton(() => GetLessonReviewsUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetOnBoardingViewUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => AddBalanceUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => UpdateOnBoardingViewUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => ChangeLanguageUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetSavedLocalLanUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => UploadFileUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => UploadMultiFilesUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => CancelUploadedFileUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetTeacherBoolUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetParentBoolUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetStudentBoolUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => UpdateParentBoolUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => UpdateStudentBoolUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => UpdateTeacherBoolUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => CancelUploadedFileFromListUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => UserLoginUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => InitialRegisterUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => VerificationRegisterUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetEducationSystemUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetEducationLevelUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetEducationGradeUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => SaveTeacherReviewUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => SaveUserRegisterTypeUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => UserRegisterStepTwoUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetUserDataUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => TeacherFinalRegisterUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetTeacherMaterialUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => StudentFinalRegisterUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetStudentUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => GetTeacherPersonalDataUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => GetStudentPersonalDataUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => TeacherUpdateUserDataUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => UpdateStudentDataUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => UpdateUserBasicDataUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => UpdateUserProfileImageUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => ResendVerificationUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => InitialForgetPasswordUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => VerificationForgetPasswordUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => ForgetPasswordUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(() => AddPlaceUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetComplaintsUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => AddComplaintsUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetPrivacyPolicyUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetLessonTypeUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetTeacherPlaceUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetCommonQuestionsUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetCountryUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetCitiesUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(() => GetAreaUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => UpdateTeacherPlacesUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(() => AddClassUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetCurrentClassUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetPreviousClassUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => UpdateClassUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetLessonByIdUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => AddCreditCardUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => DeleteCreditCardUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetCreditCardUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => GetAvailableLessonsUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetPreviousLessonsUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => GetMostReservedClassUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetReservedLessonsUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => PaymentMethodUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => PromoCodeUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => GetAllStudentReservationUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetNewMaterialUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => StartLessonUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => FinishLessonUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => CreateReservationUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => ConfirmAttendanceUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => GetTeacherDashBoardUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => GetTeacherFilterOperationUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => TeacherWithdrawRequestUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => GetTeacherWithDrawMethodUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetUsagePolicyUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => SendTeacherParentMessageUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => GetTeacherParentMessageUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => ReplyTeacherParentMessageUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => GetTeacherParentMessageRepliesUseCase(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => GetNearestTeachersUseCae(serviceLocator()));
//   serviceLocator
//       .registerLazySingleton(() => SaveTeacherIdUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => UploadCertificationUseCase(serviceLocator()));
//   serviceLocator.registerLazySingleton(
//       () => GetStudentWalletDataUseCase(serviceLocator()));
//
//   serviceLocator.registerLazySingleton(
//     () => CancelReservationUseCase(
//       serviceLocator(),
//     ),
//   );
//
//   // //// Repository
//   serviceLocator.registerLazySingleton<BaseOnBoardingRepository>(
//       () => OnBoardingRepository(serviceLocator()));
//   serviceLocator.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(
//         serviceLocator(),
//         serviceLocator(),
//       ));
//   serviceLocator.registerLazySingleton<BaseTeacherRepository>(
//     () => TeacherRepository(
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerLazySingleton<BaseStudentRepository>(
//     () => StudentRepository(
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   // serviceLocator.registerLazySingleton<BaseStudentRepository>(() => BaseStudentRepository(serviceLocator()),);
//   serviceLocator.registerLazySingleton<StudentRepository>(
//     () => StudentRepository(
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   serviceLocator.registerLazySingleton<BaseStudentWalletRepository>(
//     () => StudentWalletRepository(
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
//   // //// DATA SOURCE && SHARED PREFERENCES
//   serviceLocator.registerLazySingleton<BaseOnBoardingLocalDataSource>(
//       () => OnBoardingLocalDataSource(sharedPreferences: serviceLocator()));
//   serviceLocator.registerLazySingleton<BaseAuthDataSource>(
//     () => AuthDateSource(
//       sharedPreferences: serviceLocator(),
//       apiHelper: serviceLocator(),
//       dioHelper: serviceLocator(),
//     ),
//   );
//   serviceLocator.registerLazySingleton<BaseTeacherDataSource>(
//     () => TeacherDataSource(
//       dioHelper: serviceLocator(),
//       apiHelper: serviceLocator(),
//     ),
//   );
//
//   serviceLocator.registerLazySingleton<BaseStudentWalletDataSource>(
//       () => StudentWalletDataSource(apiHelper: serviceLocator()));
//
//   /// Parameters
//
//   serviceLocator.registerLazySingleton<StudentAvailableLessonsParameters>(
//     () => StudentAvailableLessonsParameters(
//         start: 0,
//         length: 10,
//         isAvailableClass: true,
//         isReservedClass: false,
//         isPreviousReserved: false),
//     // instanceName: 'Available',
//   );
//   serviceLocator.registerLazySingleton<StudentReservedLessonsParameters>(() =>
//       StudentReservedLessonsParameters(
//           start: 0,
//           length: 10,
//           isAvailableClass: false,
//           isReservedClass: true,
//           isPreviousReserved: false));
//   serviceLocator.registerLazySingleton<StudentPreviousLessonsParameters>(
//     () => StudentPreviousLessonsParameters(
//       start: 0,
//       length: 10,
//       isAvailableClass: false,
//       isReservedClass: false,
//       isPreviousReserved: true,
//     ),
//   );
//
//   serviceLocator.registerLazySingleton<TeacherCurrentLessonsParameters>(
//       () => TeacherCurrentLessonsParameters(
//             start: 0,
//             length: 10,
//           ));
//   serviceLocator.registerLazySingleton<TeacherPreviousLessonsParameters>(
//     () => TeacherPreviousLessonsParameters(
//       start: 0,
//       length: 10,
//     ),
//   );
//   serviceLocator.registerLazySingleton<NetworkInfo>(
//     () => NetworkInfoImpl(
//       connectionChecker: serviceLocator(),
//     ),
//   );
//   serviceLocator.registerLazySingleton(
//     () => InternetConnectionChecker(),
//   );
//   //Toast
//   // FToast fToast = FToast();
//   // fToast.init(NavigationService.navigatorKey.currentContext!);
//   // sl.registerLazySingleton(
//   //     () => fToast.init(NavigationService.navigatorKey.currentContext!));
// }
