import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Features/authentication/data/data_sources/AuthDataSourse.dart';
import '../../../Features/authentication/data/repositories/AuthRepository.dart';
import '../../../Features/authentication/domain/repositories/BaseAuthRepository.dart';
import '../../../Features/authentication/domain/use_cases/CancelUploadedFileFromListUseCase.dart';
import '../../../Features/authentication/domain/use_cases/Initial_Register_useCase.dart';
import '../../../Features/authentication/domain/use_cases/SaveRegisterTypeUseCase.dart';
import '../../../Features/authentication/domain/use_cases/Verification_forgetPassword_useCase.dart';
import '../../../Features/authentication/domain/use_cases/Verification_register_useCase.dart';
import '../../../Features/authentication/domain/use_cases/cancelUploadedFileUseCase.dart';
import '../../../Features/authentication/domain/use_cases/forget_password_useCase.dart';
import '../../../Features/authentication/domain/use_cases/get_Education_Level_use_case.dart';
import '../../../Features/authentication/domain/use_cases/get_Education_system_use_case.dart';
import '../../../Features/authentication/domain/use_cases/get_education_grade_use_case.dart';
import '../../../Features/authentication/domain/use_cases/get_material_use_case.dart';
import '../../../Features/authentication/domain/use_cases/get_parent_bool_use_case.dart';
import '../../../Features/authentication/domain/use_cases/get_student_bool_use_case.dart';
import '../../../Features/authentication/domain/use_cases/get_teacher_bool_use_case.dart';
import '../../../Features/authentication/domain/use_cases/get_user_data_use_case.dart';
import '../../../Features/authentication/domain/use_cases/initial_forget_password_use_case.dart';
import '../../../Features/authentication/domain/use_cases/resend_verification_use_case.dart';
import '../../../Features/authentication/domain/use_cases/save_parent_bool_use_case.dart';
import '../../../Features/authentication/domain/use_cases/save_student_bool_use_case.dart';
import '../../../Features/authentication/domain/use_cases/save_teacher_bool_use_case.dart';
import '../../../Features/authentication/domain/use_cases/student_register_step2_use_case.dart';
import '../../../Features/authentication/domain/use_cases/teacher_fianl_register_use_case.dart';
import '../../../Features/authentication/domain/use_cases/uploadFileUseCase.dart';
import '../../../Features/authentication/domain/use_cases/uploadMultiFilesUseCase.dart';
import '../../../Features/authentication/domain/use_cases/user__register_step_two_use_case.dart';
import '../../../Features/authentication/domain/use_cases/user_login_use_case.dart';
import '../../../Features/authentication/presentation/manager/auth_cubit.dart';
import '../../../Features/home/presentation/manager/home_cubit.dart';
import '../../../Features/startup/data/data_sources/onboarding_local_data_source.dart';
import '../../../Features/startup/data/repositories/onboarding_repository.dart';
import '../../../Features/startup/domain/repositories/base_onboarding_repository.dart';
import '../../../Features/startup/domain/use_cases/change_language_use_case.dart';
import '../../../Features/startup/domain/use_cases/get_onboardingitems_usecase.dart';
import '../../../Features/startup/domain/use_cases/get_saved_lang_use_case.dart';
import '../../../Features/startup/domain/use_cases/update_boarding_view_use_case.dart';
import '../../../Features/startup/presentation/manager/startup_cubit.dart';
import '../../../Features/student/data/data_sources/StudntDataSourse.dart';
import '../../../Features/student/data/repositories/StudentRepository.dart';
import '../../../Features/student/domain/repositories/BaseStudentRepository.dart';
import '../../../Features/student/domain/use_cases/get_student_personal_data_use_case.dart';
import '../../../Features/student/domain/use_cases/udate_student_data_use_case.dart';
import '../../../Features/student/domain/use_cases/update_user_profile_image_use_case.dart';
import '../../../Features/student/presentation/manager/student_profile_cubit/student_profile_cubit.dart';
import '../../../Features/teacher/data/data_sources/TeacherDataSource.dart';
import '../../../Features/teacher/data/repositories/TeacherRepository.dart';
import '../../../Features/teacher/domain/repositories/base_teacher_repository.dart';
import '../../../Features/teacher/domain/use_cases/add_complaints_use_case.dart';
import '../../../Features/teacher/domain/use_cases/add_place_use_case.dart';
import '../../../Features/teacher/domain/use_cases/get_area_use_case.dart';
import '../../../Features/teacher/domain/use_cases/get_cities_use_case.dart';
import '../../../Features/teacher/domain/use_cases/get_common_questions_use_case.dart';
import '../../../Features/teacher/domain/use_cases/get_complaints_use_case.dart';
import '../../../Features/teacher/domain/use_cases/get_country_use_case.dart';
import '../../../Features/teacher/domain/use_cases/get_lesson_type_use_case.dart';
import '../../../Features/teacher/domain/use_cases/get_privacy_policy_use_case.dart';
import '../../../Features/teacher/domain/use_cases/get_student_use_case.dart';
import '../../../Features/teacher/domain/use_cases/get_teacher_personal_data_use_case.dart';
import '../../../Features/teacher/domain/use_cases/get_teacher_place_use_case.dart';
import '../../../Features/teacher/domain/use_cases/teacher_update_basic_data_use_case.dart';
import '../../../Features/teacher/domain/use_cases/teacher_update_user_data_use_case.dart';
import '../../../Features/teacher/domain/use_cases/update_teacher_places_use_case.dart';
import '../../../Features/teacher/presentation/manager/TeacherHome/teacher_home_cubit.dart';
import '../../../Features/teacher/presentation/manager/TeacherMainClasses/teacher_classes_cubit.dart';
import '../../../Features/teacher/presentation/manager/TeacherProfile/teacher_profile_cubit.dart';
import '../shared/bloc_observer/bloc_observer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //// Bloc
  final myBlocObserver = Bloc.observer = MyBlocObserver();
  sl.registerFactory(() => myBlocObserver);
  sl.registerFactory(() => OnBoardingCubit(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => AuthCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ));
  sl.registerFactory(() => HomeCubit());
  sl.registerFactory(() => TeacherHomeCubit(
        sl(),
        sl(),
      ));
  sl.registerFactory(() => TeacherClassesCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ));
  sl.registerFactory(() => TeacherProfileCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ));
  sl.registerFactory(() => StudentProfileCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ));
  // //// UseCases
  sl.registerLazySingleton(() => GetOnBoardingViewUseCase(sl()));
  sl.registerLazySingleton(() => UpdateOnBoardingViewUseCase(sl()));
  sl.registerLazySingleton(() => ChangeLanguageUseCase(sl()));
  sl.registerLazySingleton(() => GetSavedLocalLanUseCase(sl()));
  sl.registerLazySingleton(() => UploadFileUseCase(sl()));
  sl.registerLazySingleton(() => UploadMultiFilesUseCase(sl()));
  sl.registerLazySingleton(() => CancelUploadedFileUseCase(sl()));
  sl.registerLazySingleton(() => GetTeacherBoolUseCase(sl()));
  sl.registerLazySingleton(() => GetParentBoolUseCase(sl()));
  sl.registerLazySingleton(() => GetStudentBoolUseCase(sl()));
  sl.registerLazySingleton(() => UpdateParentBoolUseCase(sl()));
  sl.registerLazySingleton(() => UpdateStudentBoolUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTeacherBoolUseCase(sl()));
  sl.registerLazySingleton(() => CancelUploadedFileFromListUseCase(sl()));
  sl.registerLazySingleton(() => UserLoginUseCase(sl()));
  sl.registerLazySingleton(() => InitialRegisterUseCase(sl()));
  sl.registerLazySingleton(() => VerificationRegisterUseCase(sl()));
  sl.registerLazySingleton(() => GetEducationSystemUseCase(sl()));
  sl.registerLazySingleton(() => GetEducationLevelUseCase(sl()));
  sl.registerLazySingleton(() => GetEducationGradeUseCase(sl()));
  sl.registerLazySingleton(() => SaveUserRegisterTypeUseCase(sl()));
  sl.registerLazySingleton(() => UserRegisterStepTwoUseCase(sl()));
  sl.registerLazySingleton(() => GetUserDataUseCase(sl()));
  sl.registerLazySingleton(() => TeacherFinalRegisterUseCase(sl()));
  sl.registerLazySingleton(() => GetTeacherMaterialUseCase(sl()));
  sl.registerLazySingleton(() => StudentRegisterStep2UseCase(sl()));
  sl.registerLazySingleton(() => GetStudentUseCase(sl()));
  sl.registerLazySingleton(() => GetTeacherPersonalDataUseCase(sl()));
  sl.registerLazySingleton(() => GetStudentPersonalDataUseCase(sl()));
  sl.registerLazySingleton(() => TeacherUpdateUserDataUseCase(sl()));
  sl.registerLazySingleton(() => UpdateStudentDataUseCase(sl()));
  sl.registerLazySingleton(() => UpdateUserBasicDataUseCase(sl()));
  sl.registerLazySingleton(() => UpdateUserProfileImageUseCase(sl()));
  sl.registerLazySingleton(() => ResendVerificationUseCase(sl()));
  sl.registerLazySingleton(() => InitialForgetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => VerificationForgetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => AddPlaceUseCase(sl()));
  sl.registerLazySingleton(() => GetComplaintsUseCase(sl()));
  sl.registerLazySingleton(() => AddComplaintsUseCase(sl()));
  sl.registerLazySingleton(() => GetPrivacyPolicyUseCase(sl()));
  sl.registerLazySingleton(() => GetLessonTypeUseCase(sl()));
  sl.registerLazySingleton(() => GetTeacherPlaceUseCase(sl()));
  sl.registerLazySingleton(() => GetCommonQuestionsUseCase(sl()));
  sl.registerLazySingleton(() => GetCountryUseCase(sl()));
  sl.registerLazySingleton(() => GetCitiesUseCase(sl()));
  sl.registerLazySingleton(() => GetAreaUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTeacherPlacesUseCase(sl()));
  // //// Repository
  sl.registerLazySingleton<BaseOnBoardingRepository>(
      () => OnBoardingRepository(sl()));
  sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
  sl.registerLazySingleton<BaseTeacherRepository>(
      () => TeacherRepository(sl()));
  // //// DATA SOURCE && SHARED PREFERENCES
  sl.registerLazySingleton<BaseOnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSource(sharedPreferences: sl()));
  sl.registerLazySingleton<BaseAuthDataSource>(
      () => AuthDateSource(sharedPreferences: sl()));
  sl.registerLazySingleton<BaseTeacherDataSource>(() => TeacherDataSource());
  ///// SHARED PREFERENCES
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPreferences);
  //// DIO
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
  sl.registerLazySingleton(() => Dio());
}
