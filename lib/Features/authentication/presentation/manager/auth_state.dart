// ignore_for_file: must_be_immutable, duplicate_ignore

abstract class AuthState {}

class AuthIntialState extends AuthState {}

class ChangeFormFeildSuccessState extends AuthState {}

class AuthChangePasswordVisibiltyState extends AuthState {}

class AuthChangeConfirmPasswordVisibiltyState extends AuthState {}

class UploadProfileImageLoadingState extends AuthState {}

class UploadProfileImageSuccessState extends AuthState {}

class UploadProfileImageErrorState extends AuthState {}

class UploadFileSuccessState extends AuthState {}

class UploadFileErrorState extends AuthState {}

class CancelUploadFileSuccessState extends AuthState {}

class CancelUploadFileErrorState extends AuthState {}

class UploadMultiFileSuccessState extends AuthState {}

class UploadMultiFileErrorState extends AuthState {}

class ChangeLoginTeacherTypeState extends AuthState {
  final bool isTeacher;

  ChangeLoginTeacherTypeState(this.isTeacher);
}

class ChangeLoginStudentTypeState extends AuthState {
  final bool isStudent;
  ChangeLoginStudentTypeState(this.isStudent);
}

class CancelMultiUploadFileSuccessState extends AuthState {}

class CancelMultiUploadFileErrorState extends AuthState {}

class UpdateTeacherBoolSuccessState extends AuthState {}

class UpdateTeacherBoolErrorState extends AuthState {}

class UpdateStudentBoolSuccessState extends AuthState {}

class UpdateStudentBoolErrorState extends AuthState {}

class GetTeacherBoolSuccessState extends AuthState {}

class GetTeacherBoolErrorState extends AuthState {}

class GetStudentBoolSuccessState extends AuthState {}

class GetStudentBoolErrorState extends AuthState {}

class UpdateParentBoolSuccessState extends AuthState {}

class UpdateParentBoolErrorState extends AuthState {}

class GetParentBoolSuccessState extends AuthState {}

class GetParentBoolErrorState extends AuthState {}

class ChangeTimerSecondSuccessState extends AuthState {}

class ChangeTimerSecondErrorState extends AuthState {}

class ChangeFilePickedBoolSuccessState extends AuthState {}

class ChangeIsCheckedBoolSuccessState extends AuthState {}

class ChangeConfirmAgreeSuccessState extends AuthState {}

class UserLoginErrorState extends AuthState {}

class UserLoginSuccessState extends AuthState {}

class UserLoginLoadingState extends AuthState {}

class InitialRegisterLoadingState extends AuthState {}

class InitialRegisterSuccessState extends AuthState {}

class InitialRegisterErrorState extends AuthState {}

class VerificationRegisterSuccessState extends AuthState {}

class VerificationRegisterLoadingState extends AuthState {}

class VerificationRegisterErrorState extends AuthState {}

class GetEducationSystemSuccessState extends AuthState {}

class GetEducationSystemLoadingState extends AuthState {}

class GetEducationSystemErrorState extends AuthState {}

class GetEducationLevelSuccessState extends AuthState {}

class GetEducationLevelErrorState extends AuthState {}

class GetEducationGradeSuccessState extends AuthState {}

class GetEducationGradeErrorState extends AuthState {}

class SaveUserTokenSuccessState extends AuthState {}

class SaveUserTokenErrorState extends AuthState {}

class RegisterStepTwoSuccessState extends AuthState {}

class RegisterStepTwoLoadingState extends AuthState {}

class RegisterStepTwoErrorState extends AuthState {}

class GetUserDataSuccessState extends AuthState {}

class TeacherFinalRegisterSuccessState extends AuthState {}

class TeacherFinalRegisterLoadingtate extends AuthState {}

class TeacherFinalRegisterErrorState extends AuthState {}

class GetUserDataErrorState extends AuthState {}

class ClearEducationLevelSuccess extends AuthState {}

class ClearEducationGradeSuccess extends AuthState {}

class ChangeEducationSystemSuccess extends AuthState {}

class GetMaterialErrorState extends AuthState {}

class GetMaterialSuccessState extends AuthState {}

class ChangeCheckBoxErrorState extends AuthState {
  int index;
  ChangeCheckBoxErrorState({required this.index});
}

class ClearCheckBoxValueSuccessState extends AuthState {
  final int index;
  ClearCheckBoxValueSuccessState({required this.index});
}

class StudentRegisterStep2ErrorState extends AuthState {}

class StudentRegisterStep2SuccessState extends AuthState {}

class StudentRegisterStep2LoadingState extends AuthState {}

class RemoveValueFromSharedSuccessAuthState extends AuthState {}

class SignOutSuccessAuthState extends AuthState {}

class ResendVerificationLoadingState extends AuthState {}

class ResendVerificationSuccessState extends AuthState {}

class ResendVerificationErrorState extends AuthState {}

class InitialForgetPasswordLoadingState extends AuthState {}

class InitialForgetPasswordSuccessState extends AuthState {}

class InitialForgetPasswordErrorState extends AuthState {}

class VerificationForgetPasswordSuccessState extends AuthState {}

class VerificationForgetPasswordLoadingState extends AuthState {}

class VerificationForgetPasswordErrorState extends AuthState {}

class ForgetPasswordErrorState extends AuthState {}

class ForgetPasswordSuccessState extends AuthState {}

class ForgetPasswordLoadingState extends AuthState {}
