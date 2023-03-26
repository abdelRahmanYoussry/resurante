// ignore_for_file: unnecessary_string_escapes

import '../chace_helper/cache_helper.dart';

class AppStrings {
  static const String noRoute = "No Route Found";
  static const String skip = "Skip";
  static const String appName = '7ssasY';
  static bool isDark() => CacheHelper.getSharedPreferencesValue(key: 'isDark');

  // login and register main text
  static const String loginMainButton = "Login";
  static const String loginMainText = "Log in and Enjoy services of the App";
  static const String alreadyHaveAccount = "Already have account";
  static const String notHaveAccount = "I don\'t have account";
  static const String emailLabelAndHint = "E-mail";
  static const String emailIsEmpty = "Please Enter Your Email Address";
  static const String emailIsUnValid = "Enter a valid Email Address";
  static const String userNameLabelAndHint = "User Name";
  static const String userNameIsEmpty = "Please Enter Your Name";
  static const String userAlreadyExit = "Username already exists";
  static const String userNameIsNotValid = "Username is incorrect";
  static const String passwordLabelAndHint = "Password";
  static const String forgetPassword = "Forget Password";
  static const String passwordIsEmpty = "Please Enter Your Password";
  static const String passwordIsNotValid =
      "Password Must Contain digit and characters";
  static const String confirmPasswordLabelAndHint = "Confirm Password";
  static const String passwordIsToWeak = "Minimum Password Length is 7 Letters";
  static const String confirmPasswordIsEmpty = "Please Confirm Password";
  static const String confirmPasswordIsUnValid =
      "The Password Confirmation does not match";
  static const String phoneLabelAndHint = "Phone";
  static const String phoneIsEmpty = "Please Enter Your Phone Number";
  static const String phoneNumberIsNotValid = "Please Enter Valid Phone Number";
  static const String verificationMainText = "Enter The Code Sent To";
  static const String confirmValidateMessage = "Invalid Code";
  static const String confirmButton = "Confirm";
  static const String resendButton = "Resend";
  static const String notReceiveCode = "Did\'nt receive the code";

  static const String registerMainButton = "Register";
  static const String registerMainText =
      "Register and Enjoy services of the App";

  // title onBoarding Screen
  static const String onBoardingTitle1 = "See The Best App #1";
  static const String onBoardingTitle2 = "See The Best App #2";
  static const String onBoardingTitle3 = "See The Best App #3";
  static const String onBoardingTitle4 = "See The Best App #4";
// subtitle onBoarding Screen
  static const String onBoardingSubTitle1 =
      "This App is an Awesome Flutter Application using Clean Architecture #1";
  static const String onBoardingSubTitle2 =
      "This App is an Awesome Flutter Application using Clean Architecture #2";
  static const String onBoardingSubTitle3 =
      "This App is an Awesome Flutter Application using Clean Architecture #3";
  static const String onBoardingSubTitle4 =
      "This App is an Awesome Flutter Application using Clean Architecture #4";

// string to save on boarding boolean
  static const String cachedOnBoarding = 'CACHED_ONBOARDING';
  static const String cachedStudentBool = 'CACHED_Student_Bool';
  static const String cachedTeacherBool = 'CACHED_Teacher_Bool';
  static const String registerTypeBool = 'REGISTER_TYPE_STRING';
  static const String registerTypeNumber = 'REGISTER_TYPE_NUMBER';
  static const String registerStepOneSkipped = 'registerStepOneSkipped';
  static const String registerStepTwoSkipped = 'registerStepTwoSkipped';
  static const String cachedParentBool = 'CACHED_Parent_Bool';
  static const String userToken = 'USER_TOKEN';
  static const String englishCode = 'en';
  static const String arabicCode = 'ar';
  static const String localCode = 'locale';
  static const String mainColor = 'mainColor';

  //API Headers
  static const String applicationJson = 'application/json';
  static const String contentType = 'Content-Type';

  //Shared Strings
  static bool isSecondStepCompletedFromShared(
      {required bool isSecondStepCompleted}) {
    CacheHelper.saveDataToSharedPreferences(
        key: 'isSecondStepCompletedFromShared', value: isSecondStepCompleted);
    return isSecondStepCompleted;
  }

  static bool isFirstStepCompleted({required bool isFirstStepCompleted}) {
    CacheHelper.saveDataToSharedPreferences(
        key: 'isFirstStepCompleted', value: isFirstStepCompleted);
    return isFirstStepCompleted;
  }
}
