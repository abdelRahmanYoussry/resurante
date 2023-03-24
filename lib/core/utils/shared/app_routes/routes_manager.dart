// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hassy/Features/authentication/presentation/pages/forget_password/forgetPassword.dart';
import 'package:hassy/Features/authentication/presentation/pages/forget_password/initial_forget_password_screen.dart';
import 'package:hassy/Features/authentication/presentation/pages/login/login_screen.dart';
import 'package:hassy/Features/authentication/presentation/pages/register_level_1/register_level_1_screen.dart';
import 'package:hassy/Features/authentication/presentation/pages/resgister_type/register_by_type_screen.dart';
import 'package:hassy/Features/authentication/presentation/pages/student_register/student_register.dart';
import 'package:hassy/Features/startup/presentation/pages/onboarding_screen.dart';
import 'package:hassy/Features/startup/presentation/pages/splash_screen.dart';
import 'package:hassy/Features/student/presentation/pages/StudentPages/StudentCompeleteReserve/student_compelete_reserve_screen.dart';
import 'package:hassy/Features/student/presentation/pages/StudentPages/StudentLayout/StudentLayoutScreen.dart';
import 'package:hassy/Features/student/presentation/pages/StudentPages/StudentMainScreen/student_main_screen.dart';
import 'package:hassy/Features/student/presentation/pages/StudentProfile/editProfile/student_editProfile_layout/student_profile_layout.dart';
import 'package:hassy/Features/student/presentation/pages/StudentProfile/student_common_questions/student_common_question_screen.dart';
import 'package:hassy/Features/student/presentation/pages/StudentProfile/student_places/Student_class_places_screen.dart';
import 'package:hassy/Features/student/presentation/pages/StudentProfile/student_settings/student_setting_screen.dart';
import 'package:hassy/Features/teacher/presentation/pages/TeacherProfile/my_student_screen/my_student_screen.dart';
import 'package:hassy/Features/teacher/presentation/pages/TeacherProfile/teacher_add_new_document/add_new_decoument_screen.dart';
import 'package:hassy/Features/teacher/presentation/pages/TeacherProfile/teacher_contact_with_parent/contact_with_parent_screen.dart';
import 'package:hassy/Features/teacher/presentation/pages/TeacherProfile/teacher_help_and_complaints/help_and_complaints_screen.dart';
import 'package:hassy/Features/teacher/presentation/pages/TeacherProfile/teacher_setting/teacher_setting_screen.dart';
import 'package:hassy/core/utils/shared/animation/animation_routes.dart';

import '../../../../Features/authentication/presentation/pages/forget_password/ForgetPasswordVerification.dart';
import '../../../../Features/authentication/presentation/pages/register_level_2/register_level_2_screen.dart';
import '../../../../Features/authentication/presentation/pages/register_verification/RegisterVerification.dart';
import '../../../../Features/authentication/presentation/pages/teacher_register/teacher_register.dart';
import '../../../../Features/home/presentation/pages/Mainlayout/MainLayoutScreen.dart';
import '../../../../Features/home/presentation/widgets/test_screen.dart';
import '../../../../Features/student/presentation/pages/StudentPages/StudentAddClass/SudentAddClass.dart';
import '../../../../Features/student/presentation/pages/StudentPages/StudentPayment/StudentAddCardScreen.dart';
import '../../../../Features/student/presentation/pages/StudentPages/StudentPayment/StudentClassCodeScreen.dart';
import '../../../../Features/student/presentation/pages/StudentPages/StudentPayment/StudentPaymentScreen.dart';
import '../../../../Features/student/presentation/pages/StudentProfile/my_Teachers/my_teaches_screen.dart';
import '../../../../Features/student/presentation/pages/StudentProfile/student_help and complaints/Student_help_and_complaints_screen.dart';
import '../../../../Features/student/presentation/pages/StudentProfile/student_privacy_policy/student_privacy_policy_screen.dart';
import '../../../../Features/student/presentation/pages/StudentProfile/student_profile_screen.dart';
import '../../../../Features/student/presentation/pages/StudentProfile/student_usage_policy/student_usage_policy_screen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherPages/TeacherClassManagement/StudentPayCashScreen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherPages/TeacherClassManagement/StudentPayVisaScreen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherPages/TeacherClassManagement/TeacherClassManagementScreen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherPages/TeacherLayout/teacher_layout_screen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherPages/TeacherMainScreen/teacher_main_screen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherPages/Teacheraddclass/teacher_add_class_screen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherProfile/teacher_common_question/teacher_common_question_screen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherProfile/teacher_edit_profile/teacher_profile_layout.dart';
import '../../../../Features/teacher/presentation/pages/TeacherProfile/teacher_edit_profile/teacher_profile_screen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherProfile/teacher_places/main_place_layout/add_places_screen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherProfile/teacher_places/main_place_layout/main_places_screen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherProfile/teacher_privacy_policy/teacher_privacy_policy_screen.dart';
import '../../../../Features/teacher/presentation/pages/TeacherProfile/teacher_usage_policy/teacher_usage_policy_screen.dart';
import '../app/color_manager.dart';
import '../app/font_manager.dart';
import '../app/styles_manager.dart';
import '../app/values_manager.dart';
import '../translations/locale_keys.g.dart';

/// understand how to this class work
//// add routes name as string like under
class Routes {
  static const String splashRoute = 'splash';
  static const String onBoardingRoute = 'onBoarding';
  static const String loginRoute = 'login';
  static const String registerStep1Route = 'registerStep1';
  static const String registerStep2Route = 'registerStep2';
  static const String teacherRegisterRoute = 'registerTeacher';
  static const String verificationRoute = 'verification';
  static const String registerTypesRoute = 'registerType';
  static const String studentRegisterRoute = 'registerStudent';
  static const String testRoute = 'test';
  static const String mainLayout = 'mainLayout';
  static const String teacherAddLessonRoute = 'teacherAddLesson';
  static const String studentAddLessonRoute = 'studentAddNewClass';
  static const String teacherClassesLayoutRoute = 'teacherLayoutRoute';
  static const String studentClassesLayoutRoute = 'studentLayoutRoute';
  static const String studentMainScreenRoute = 'studentMainScreenRoute';
  static const String studentSettingRoute = 'studentSettingRoute';
  static const String teacherMainScreenRoute = 'teacherMainScreenRoute';
  static const String teacherSettingRoute = 'teacherSettingRoute';
  static const String teacherAddNewDocumentRoute = 'teacherAddNewDocumentRoute';
  static const String teacherMyStudentRoute = 'teacherMyStudentRoute';
  static const String studentMyTeachersRoute = 'studentMyTeachersRoute';
  static const String teacherContactParentRoute = 'teacherContactParentRoute';
  static const String teacherAddLocationRoute = 'teacherAddLocationRoute';
  static const String teacherMainPlacesRoute = 'teacherMainPlacesRoute';
  static const String studentMyPlaces = 'studentMyPlaces';
  static const String studentProfileRoute = 'studentProfileRoute';
  static const String teacherProfileRoute = 'teacherProfileRoute';
  static const String teacherHelpAndComplaintsRoute =
      'TeacherHelpAndComplaintsRoute';
  static const String studentHelpAndComplaintsRoute =
      'StudentHelpAndComplaintsRoute';
  static const String classReserveDetailsRoute = 'classReserveDetailsRoute';
  static const String studentPaymentRoute = 'studentPaymentRoute';
  static const String studentAddCardRoute = 'studentAddCardRoute';
  static const String studentClassCodeRoute = 'studentClassCodeRoute';
  static const String teacherPrivacyPolicyRoute = 'teacherPrivacyPolicyRoute';
  static const String studentPrivacyPolicyRoute = 'studentPrivacyPolicyRoute';
  static const String teacherUsagePolicyRoute = 'teacherUsagePolicyRoute';
  static const String studentUsagePolicyRoute = 'studentUsagePolicyRoute';
  static const String teacherCommonQuestionRoute = 'teacherCommonQuestionRoute';
  static const String studentCommonQuestionRoute = 'studentCommonQuestionRoute';
  static const String teacherManagementClassRoute =
      'teacherManagementClassRoute';
  static const String studentPayCashRoute = 'studentPayCashRoute';
  static const String studentPayVisaRoute = 'studentPayVisaRoute';
  static const String teacherProfileMainLayOut = 'teacherProfileMainLayOut';
  static const String studentProfileMainLayOut = 'studentProfileMainLayOut';
  static const String initialForgetPassword = 'initialForgetPassword';
  static const String forgetPasswordVerification = 'forgetPasswordVerification';
  static const String forgetPassword = 'forgetPassword';
}

/// this is main class to generate route dynamic in all app screens
class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return SlideRight(page: const SplashScreen());
      case Routes.onBoardingRoute:
        return SlideRight(page: OnBoardingScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case Routes.registerStep1Route:
        return SlideRight(page: RegisterBeforeLoginScreen());
      case Routes.registerStep2Route:
        return SlideRight(page: RegisterStepTwoScreen());
      case Routes.studentProfileMainLayOut:
        return SlideRight(page: StudentEditProfileLayout());
      case Routes.studentMyTeachersRoute:
        return SlideRight(page: MyTeachersScreen());
      case Routes.studentCommonQuestionRoute:
        return SlideRight(page: StudentCommonQuestionScreen());
      case Routes.studentHelpAndComplaintsRoute:
        return SlideRight(page: StudentHelpAndComplaintsScreen());
      case Routes.studentMyPlaces:
        return SlideRight(page: StudentPlacesScreen());
      case Routes.studentPrivacyPolicyRoute:
        return SlideRight(page: StudentPrivacyPolicyScreen());
      case Routes.studentUsagePolicyRoute:
        return SlideRight(page: StudentUsagePolicyScreen());
      case Routes.verificationRoute:
        return SlideRight(
            page: RegisterVerificationScreen(
          phoneNumber: '',
          countryCode: '20',
        ));
      case Routes.teacherRegisterRoute:
        return SlideRight(page: TeacherRegisterScreen());
      case Routes.registerTypesRoute:
        return SlideRight(page: RegisterTypeScreen());
      case Routes.studentRegisterRoute:
        return SlideRight(page: StudentRegisterScreen());
      case Routes.testRoute:
        return SlideRight(page: TestScreen());
      case Routes.mainLayout:
        return SlideRight(page: MainLayout());
      case Routes.teacherAddLessonRoute:
        return SlideRight(page: TeacherAddClassesScreen());
      case Routes.studentAddLessonRoute:
        return SlideRight(page: StudentAddClassScreen());
      case Routes.teacherClassesLayoutRoute:
        return SlideRight(page: TeacherLayOutScreen());
      case Routes.studentMainScreenRoute:
        return SlideRight(page: StudentMainScreen());
      case Routes.teacherMainScreenRoute:
        return SlideRight(page: TeacherMainScreen());
      case Routes.teacherSettingRoute:
        return SlideRight(page: TeacherSettingScreen());
      case Routes.teacherAddNewDocumentRoute:
        return SlideRight(page: TeacherAddNewDocument());
      case Routes.teacherMyStudentRoute:
        return SlideRight(page: MyStudentScreen());
      case Routes.teacherContactParentRoute:
        return SlideRight(page: ContactWithParentScreen());
      case Routes.teacherAddLocationRoute:
        return SlideRight(page: TeacherAddNewLocationScreen());
      case Routes.studentClassesLayoutRoute:
        return SlideRight(page: StudentLayOutScreen());
      case Routes.studentSettingRoute:
        return SlideRight(page: StudentSettingScreen());
      // return MaterialPageRoute(builder: (_) => StudentSettingScreen());
      case Routes.studentProfileRoute:
        return SlideRight(page: StudentProfileScreen());
      case Routes.teacherProfileRoute:
        return SlideRight(page: TeacherProfileScreen());
      case Routes.teacherHelpAndComplaintsRoute:
        return SlideRight(page: HelpAndComplaintsScreen());
      case Routes.classReserveDetailsRoute:
        return SlideRight(page: ClassesReserveDetailsScreen());
      case Routes.studentPaymentRoute:
        return SlideRight(page: StudentPaymentScreen());
      case Routes.studentAddCardRoute:
        return SlideRight(page: StudentAddCardScreen());
      case Routes.studentClassCodeRoute:
        return SlideRight(page: StudentClassCodeScreen());
      case Routes.teacherPrivacyPolicyRoute:
        return SlideRight(page: TeacherPrivacyPolicyScreen());
      case Routes.teacherUsagePolicyRoute:
        return SlideRight(page: TeacherUsagePolicyScreen());
      case Routes.teacherCommonQuestionRoute:
        return SlideRight(page: TeacherCommonQuestionScreen());
      case Routes.teacherManagementClassRoute:
        return SlideRight(page: TeacherClassManagementScreen());
      case Routes.studentPayCashRoute:
        return SlideRight(page: StudentPayCashScreen());
      case Routes.studentPayVisaRoute:
        return SlideRight(page: StudentPayVisaScreen());
      case Routes.teacherProfileMainLayOut:
        return SlideRight(page: TeacherProfileMainLayout());
      case Routes.initialForgetPassword:
        return SlideRight(page: InitialForgetPasswordScreen());
      case Routes.forgetPasswordVerification:
        return SlideRight(page: ForgetPasswordVerificationScreen());
      case Routes.forgetPassword:
        return SlideRight(page: ForgetPasswordScreen());
      case Routes.teacherMainPlacesRoute:
        return SlideRight(page: MainPlacesScreen());
      default:
        return unDefinedRoute();
    }
  }

  /// this is the default route when there is no route in app
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        backgroundColor: ColorManager.mainPrimaryColor4,
        appBar: AppBar(
          backgroundColor: ColorManager.mainPrimaryColor4,
          elevation: AppSize.size_0,
          centerTitle: true,
          title: Text(
            LocaleKeys.appName.tr(),
          ),
        ),
        body: Center(
          child: Text(
            LocaleKeys.noRoute.tr(),
            style: getBoldStyle(
              color: ColorManager.white,
              fontSize: FontSize.size18,
            ),
          ),
        ),
      ),
    );
  }
}
