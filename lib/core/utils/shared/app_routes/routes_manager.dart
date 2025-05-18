import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app/color_manager.dart';
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
  static const String registerTypesRoute = 'registerType';
  static const String studentRegisterRoute = 'registerStudent';
  static const String forgetPasswordScreen = 'forgetPasswordScreen';
  static const String testRoute = 'test';
  // static const String mainLayout = 'mainLayout';
  static const String teacherAddLessonRoute = 'teacherAddLesson';
  static const String studentAddLessonRoute = 'studentAddNewClass';
  static const String teacherClassesLayoutRoute = 'teacherLayoutRoute';
  static const String studentClassesLayoutRoute = 'studentLayoutRoute';
  static const String studentMainScreenRoute = 'studentMainScreenRoute';
  static const String studentSettingRoute = 'studentSettingRoute';
  static const String teacherUpdatePlaceScreen = 'teacherUpdatePlaceScreen';
  static const String successFinishClassScreen = 'successFinishClassScreen';
  static const String teacherUpdateClassScreen = 'teacherUpdateClassScreen';
  static const String teacherParentMessageRepliesScreen =
      'teacherParentMessageRepliesScreen';

  static const String teacherMainScreenRoute = 'teacherMainScreenRoute';
  static const String teacherSettingRoute = 'teacherSettingRoute';
  static const String teacherAddNewDocumentRoute = 'teacherAddNewDocumentRoute';
  static const String teacherMyStudentRoute = 'teacherMyStudentRoute';
  static const String teacherContactParentRoute = 'teacherContactParentRoute';
  static const String teacherAddLocationRoute = 'teacherAddLocationRoute';
  static const String teacherMainPlacesRoute = 'teacherMainPlacesRoute';
  static const String studentMyPlaces = 'studentMyPlaces';
  static const String studentProfileRoute = 'studentProfileRoute';
  static const String teacherProfileRoute = 'teacherProfileRoute';
  static const String userHelpAndComplaintsRoute =
      'StudentHelpAndComplaintsRoute';
  static const String classReserveDetailsRoute = 'classReserveDetailsRoute';
  static const String studentPaymentRoute = 'studentPaymentRoute';
  static const String studentAddCardRoute = 'studentAddCardRoute';
  static const String studentClassCodeRoute = 'studentClassCodeRoute';
  static const String userPrivacyPolicyRoute = 'studentPrivacyPolicyRoute';
  static const String userUsagePolicyRoute = 'studentUsagePolicyRoute';
  static const String userCommonQuestionRoute = 'studentCommonQuestionRoute';
  static const String teacherManagementClassRoute =
      'teacherManagementClassRoute';
  static const String studentPayCashRoute = 'studentPayCashRoute';
  static const String searchWidget = 'SearchWidget';
  static const String lessonDetails = 'lessonDetails';
  static const String studentPayVisaRoute = 'studentPayVisaRoute';
  static const String teacherProfileMainLayOut = 'teacherProfileMainLayOut';
  static const String studentProfileMainLayOut = 'studentProfileMainLayOut';
  static const String initialForgetPassword = 'initialForgetPassword';
  // static const String forgetPasswordVerification = 'forgetPasswordVerification';
  static const String forgetPassword = 'forgetPassword';
  static const String studentReviewScreen = 'studentReviewScreen';
  static const String teacherMoreClassesAvalibleScreen =
      'teacherMoreClassesAvalibleScreen';
  static const String teacherMostReservedScreen = 'teacherMostReservedScreen';
  static const String registerVerificationScreen = 'registerVerificationScreen';
  static const String updateClassRoute = 'updateClassRoute';
  static const String activeScreen = 'activeScreen';
  static const String activeScreenStepOne = 'activeScreenStepOne';
  static const String activeScreenStepTwo = 'activeScreenStepTwo';
  static const String finishActive = 'finishActive';
  static const String successActive = 'successActive';
  static const String mapScreen = 'mapScreen';
  static const String sessionSuccessPaymentScreen =
      'SessionSuccessPaymentScreen';
  static const String getParentMessageRepliesScreen =
      'getParentMessageRepliesScreen';
  static const String teacherClassManagementScreen =
      'teacherClassManagementScreen';
  static const String addBalanceScreen = 'addBalanceScreen';
  static const String studentDeleteCreditCardScreen =
      'studentDeleteCreditCardScreen';
  static const String creditCardUiScreen = 'creditCardUiScreen';
  static const String creditCardMainScreen = 'creditCardMainScreen';
  static const String notificationScreen = 'notificationScreen';
  static const String notificationDetailsScreen = 'notificationDetailsScreen';
  static const String completeRegisterStepsScreen =
      'completeRegisterStepsScreen';
  static const String sessionCancelReservationScreen =
      'sessionCancelReservationScreen';
}

/// this is main class to generate route dynamic in all app screens
class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
      // return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //           create: (context) => serviceLocator<AuthenticationCubit>(),
      //           child: const SplashScreen(),
      //         ),);
      // case Routes.teacherContactParentRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => ContactWithParentScreen());
      // case Routes.successFinishClassScreen:
      //   final args = settings.arguments as SuccessFinishClassArgs;
      //   return MaterialPageRoute(
      //     builder: (context) => SuccessFinishClassWidget(
      //       lessonId: args.lessonId,
      //     ),
      //   );
      // case Routes.getParentMessageRepliesScreen:
      //   final args = settings.arguments as GetTeacherParentMessageRepliesArgs;
      //   return MaterialPageRoute(
      //     builder: (context) => GetParentMessageRepliesScreen(
      //       messageId: args.messageId,
      //     ),
      //   );
      // case Routes.forgetPasswordScreen:
      //   final args = settings.arguments as ForgetPasswordArgs;
      //   return MaterialPageRoute(
      //     builder: (context) => ForgetPasswordScreen(
      //       userId: args.userId,
      //     ),
      //   );
      // case Routes.completeRegisterStepsScreen:
      //   final args = settings.arguments as CompleteRegisterArgs;
      //   return MaterialPageRoute(
      //     builder: (context) => CompleteRegisterStepsScreen(
      //       title: args.title,
      //       image: args.image,
      //       isForgetPasswordComplete: args.isForgetPasswordComplete,
      //       isStudent: args.isStudent,
      //       subtitle: args.subtitle,
      //     ),
      //   );
      // case Routes.studentReviewScreen:
      //   final args = settings.arguments as SaveLessonReviewArgs;
      //   return MaterialPageRoute(
      //     builder: (context) => StudentReviewScreen(
      //       classDetails: args.classStudentData,
      //     ),
      //   );
      // case Routes.registerVerificationScreen:
      //   final args = settings.arguments as RegisterVerificationArgs;
      //   return MaterialPageRoute(
      //     builder: (context) => RegisterVerificationScreen(
      //       image: args.image,
      //       phoneNumber: args.phoneNumber,
      //       countryCode: args.countryCode,
      //       isForgetPassword: args.isForgetPassword,
      //       userId: args.userId,
      //     ),
      //   );
      // case Routes.mapScreen:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (context) => MapScreen(
      //       lat: args['lat'],
      //       lon: args['lon'],
      //       myMarker: args['myMarker'],
      //       myController: args['myController'],
      //       isFloatingButtonShow: args['isFloatingButtonShow'],
      //     ),
      //   );
      // case Routes.teacherUpdatePlaceScreen:
      //   final args = settings.arguments as UpdateTeacherPlaceArgs;
      //   return MaterialPageRoute(
      //     builder: (context) => TeacherUpdatePlacesScreen(
      //       data: args.locationData,
      //     ),
      //   );
      // case Routes.teacherClassManagementScreen:
      //   final args = settings.arguments as TeacherClassManagementArgs;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => TeacherClassManagementScreen(
      //       lessonId: args.lessonId,
      //     ),
      //   );
      // case Routes.teacherMoreClassesAvalibleScreen:
      //   final args = settings.arguments as TeacherMoreAvalibleClassesArguments;
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => serviceLocator<TeacherLessonCubit>()
      //         ..getCurrentClasses(
      //           teacherCurrentClassesParameters:
      //               serviceLocator<TeacherCurrentLessonsParameters>(),
      //         ),
      //       child: TeacherMoreCurrentClassesScreen(
      //         title: args.title,
      //         listModel: args.listModel,
      //         isHomeScreen: args.isHomeScreen,
      //       ),
      //     ),
      //   );
      // case Routes.teacherMostReservedScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => serviceLocator<TeacherLessonCubit>()
      //         ..getCurrentClasses(
      //           teacherCurrentClassesParameters:
      //               serviceLocator<TeacherCurrentLessonsParameters>(),
      //         ),
      //       child: const TeacherMoreClassesReservedScreen(),
      //     ),
      //   );
      // case Routes.studentDeleteCreditCardScreen:
      //   final args = settings.arguments as DeleteCreditCardArguments;
      //   return MaterialPageRoute(
      //     builder: (context) => StudentDeleteCardScreen(
      //       backGroundImage: args.backGroundImage,
      //       creditCardModel: args.creditCardModel,
      //     ),
      //   );
      // case Routes.teacherUpdateClassScreen:
      //   final args = settings.arguments as TeacherUpdateClassArgs;
      //   return MaterialPageRoute(
      //     builder: (context) => MultiBlocProvider(
      //       providers: [
      //         BlocProvider(
      //           create: (context) =>
      //               serviceLocator<FilterCubit>()..getLessonType(),
      //         ),
      //         BlocProvider(
      //           create: (context) => serviceLocator<TeacherProfileNewCubit>()
      //             ..getTeacherPlaces(),
      //         ),
      //         BlocProvider(
      //           create: (context) => serviceLocator<TeacherLessonCubit>()
      //             ..getEducationSystem()
      //             ..getEducationLevel(
      //               educationSystemId: args.myLesson.educationSystemId!,
      //             )
      //             ..getEducationGrade(
      //               educationLevelId: args.myLesson.educationLevelId!,
      //             ),
      //         ),
      //         BlocProvider(
      //           create: (context) => serviceLocator<MaterialCubit>(),
      //         ),
      //       ],
      //       child: TeacherUpdateClassesScreen(
      //         myLesson: args.myLesson,
      //       ),
      //     ),
      //   );
      // case Routes.notificationScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const NotificationScreen());
      // case Routes.notificationDetailsScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const NotificationDetailsScreen());
      // case Routes.addBalanceScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const StudentAddBalanceScreen());
      // case Routes.onBoardingRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const OnBoardingScreen());
      // case Routes.creditCardMainScreen:
      //   return MaterialPageRoute(builder: (context) => CreditCardsScreen());
      // case Routes.loginRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const LoginScreen(),
      //   );
      // case Routes.creditCardUiScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const StudentCreditCardUiScreen(),
      //   );
      // case Routes.registerStep1Route:
      //   return MaterialPageRoute(
      //       builder: (context) => const InitialRegisterScreen());
      // case Routes.registerStep2Route:
      //   return MaterialPageRoute(
      //       builder: (context) => const RegisterStepTwoScreen());
      // case Routes.studentProfileMainLayOut:
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider(
      //             create: (context) => serviceLocator<AuthenticationCubit>()
      //               ..getStudentPersonalData(),
      //             child: const StudentProfileMainLayout(),
      //           ));
      // case Routes.searchWidget:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => serviceLocator<SearchCubit>(),
      //       child: SearchWidget(),
      //     ),
      //   );
      // case Routes.lessonDetails:
      //   return MaterialPageRoute(builder: (context) {
      //     final args = settings.arguments as LessonDetailsArguments;
      //     return LessonByIdScreen(
      //       classStudentData: args.filterClassData,
      //       lessonId: args.lessonId,
      //       isTeacher: args.isTeacher,
      //     );
      //   });
      // case Routes.userCommonQuestionRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => UserCommonQuestionScreen());
      // case Routes.userHelpAndComplaintsRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => UserHelpAndComplaintsScreen());
      // case Routes.userPrivacyPolicyRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => UserPrivacyPolicyScreen(),
      //   );
      // case Routes.userUsagePolicyRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => UserUsagePolicyScreen(),
      //   );
      // // case Routes.verificationRoute:
      // //   return MaterialPageRoute(
      // //     builder: (context) => const RegisterVerificationScreen(
      // //       phoneNumber: '',
      // //       countryCode: '20',
      // //       image: ImageAssets.verificationImage,
      // //       isForgetPassword: false,
      // //       userId: '',
      // //     ),
      // //   );
      // case Routes.teacherRegisterRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const TeacherRegisterScreen());
      // case Routes.registerTypesRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const RegisterTypeScreen());
      // case Routes.studentRegisterRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const StudentRegisterScreen());
      // case Routes.testRoute:
      //   return MaterialPageRoute(builder: (context) => const Scaffold());
      // case Routes.teacherAddLessonRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => TeacherAddClassesScreen());
      // case Routes.activeScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const MainActivationScreen());
      // case Routes.sessionSuccessPaymentScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const SessionSuccessPaymentScreen(),
      //   );
      // case Routes.sessionCancelReservationScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const SessionSuccessCancelReservationScreen(),
      //   );
      // case Routes.activeScreenStepOne:
      //   return MaterialPageRoute(
      //     builder: (context) => const ActiveAccountStepOne(
      //         // idsList: args.idsList,
      //         // certificateList: args.certificateList,
      //         ),
      //   );
      // case Routes.activeScreenStepTwo:
      //   return MaterialPageRoute(
      //     builder: (context) => const ActiveAccountStepTwo(
      //         // certificateList: args.certificateList,
      //         ),
      //   );
      // case Routes.teacherClassesLayoutRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const TeacherHomeScreen());
      // case Routes.studentMainScreenRoute:
      //   int? args = settings.arguments as int?;
      //   return MaterialPageRoute(
      //     builder: (context) => StudentMainScreen(
      //       pageIndex: args ?? 0,
      //     ),
      //   );
      // case Routes.teacherMainScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => TeacherMainScreen(),
      //   );
      // case Routes.teacherSettingRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => serviceLocator<AuthenticationCubit>(),
      //       child: TeacherSettingScreen(),
      //     ),
      //   );
      // case Routes.teacherAddLocationRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const TeacherAddNewLocationScreen(),
      //   );
      // case Routes.studentClassesLayoutRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const StudentTableScreen(),
      //   );
      // case Routes.studentSettingRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => serviceLocator<AuthenticationCubit>(),
      //       child: const StudentSettingScreen(),
      //     ),
      //   );
      // case Routes.studentProfileRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const StudentProfileScreen());
      // case Routes.teacherProfileRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const TeacherProfileScreen());
      // case Routes.finishActive:
      //   return MaterialPageRoute(
      //       builder: (context) => const ActiveAccountRevisionScreen());
      // case Routes.successActive:
      //   return MaterialPageRoute(
      //       builder: (context) => const ActiveAccountSuccessScreen());
      // case Routes.studentAddCardRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const StudentAddCardScreen());
      // case Routes.studentPayCashRoute:
      //   return MaterialPageRoute(builder: (context) => StudentPayCashScreen());
      // case Routes.teacherProfileMainLayOut:
      //   return MaterialPageRoute(
      //       builder: (context) => const TeacherProfileMainLayout());
      // case Routes.initialForgetPassword:
      //   return MaterialPageRoute(
      //       builder: (context) => const InitialForgetPasswordScreen());
      // case Routes.teacherMainPlacesRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const MainPlacesScreen());
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
            style: getBoldBlack24Style(
                // color: ColorManager.white,
                // fontSize: FontSize.size18,
                ),
          ),
        ),
      ),
    );
  }
}
