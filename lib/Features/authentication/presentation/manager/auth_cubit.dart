// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, unnecessary_null_comparison, list_remove_unrelated_type, unused_local_variable, prefer_collection_literals

import 'dart:async';
import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/authentication/domain/entities/Register_Step2_entity.dart';
import 'package:hassy/Features/authentication/domain/entities/Register_initial_entitiy.dart';
import 'package:hassy/Features/authentication/domain/entities/education_systems_entitiy.dart';
import 'package:hassy/Features/authentication/domain/entities/forget_password_entity.dart';
import 'package:hassy/Features/authentication/domain/entities/initial_forget_password_entity.dart';
import 'package:hassy/Features/authentication/domain/entities/student_register_step2_entity.dart';
import 'package:hassy/Features/authentication/domain/entities/uesr_data_entity.dart';
import 'package:hassy/Features/authentication/domain/entities/user_login_entity.dart';
import 'package:hassy/Features/authentication/domain/entities/verification_forgetPassword_entity.dart';
import 'package:hassy/Features/authentication/domain/entities/verification_register_entity.dart';
import 'package:hassy/Features/authentication/domain/use_cases/SaveRegisterTypeUseCase.dart';
import 'package:hassy/Features/authentication/domain/use_cases/Verification_forgetPassword_useCase.dart';
import 'package:hassy/Features/authentication/domain/use_cases/Verification_register_useCase.dart';
import 'package:hassy/Features/authentication/domain/use_cases/cancelUploadedFileUseCase.dart';
import 'package:hassy/Features/authentication/domain/use_cases/forget_password_useCase.dart';
import 'package:hassy/Features/authentication/domain/use_cases/get_Education_system_use_case.dart';
import 'package:hassy/Features/authentication/domain/use_cases/get_parent_bool_use_case.dart';
import 'package:hassy/Features/authentication/domain/use_cases/get_teacher_bool_use_case.dart';
import 'package:hassy/Features/authentication/domain/use_cases/get_user_data_use_case.dart';
import 'package:hassy/Features/authentication/domain/use_cases/initial_forget_password_use_case.dart';
import 'package:hassy/Features/authentication/domain/use_cases/save_parent_bool_use_case.dart';
import 'package:hassy/Features/authentication/domain/use_cases/student_register_step2_use_case.dart';
import 'package:hassy/Features/authentication/domain/use_cases/uploadMultiFilesUseCase.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_state.dart';
import 'package:hassy/core/utils/shared/translations/locale_keys.g.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/api/api_constance.dart';
import '../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../core/utils/shared/components/components.dart';
import '../../domain/entities/education_grade_entity.dart';
import '../../domain/entities/education_level_entity.dart';
import '../../domain/entities/get_material_entity.dart';
import '../../domain/entities/resend_verification_code_entity.dart';
import '../../domain/entities/teacher_fianl_register_entity.dart';
import '../../domain/use_cases/CancelUploadedFileFromListUseCase.dart';
import '../../domain/use_cases/Initial_Register_useCase.dart';
import '../../domain/use_cases/get_Education_Level_use_case.dart';
import '../../domain/use_cases/get_education_grade_use_case.dart';
import '../../domain/use_cases/get_material_use_case.dart';
import '../../domain/use_cases/get_student_bool_use_case.dart';
import '../../domain/use_cases/resend_verification_use_case.dart';
import '../../domain/use_cases/save_student_bool_use_case.dart';
import '../../domain/use_cases/save_teacher_bool_use_case.dart';
import '../../domain/use_cases/teacher_fianl_register_use_case.dart';
import '../../domain/use_cases/uploadFileUseCase.dart';
import '../../domain/use_cases/user__register_step_two_use_case.dart';
import '../../domain/use_cases/user_login_use_case.dart';
import '../widgets/register_two_enum.dart';
import '../widgets/user_type_enum.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      this.uploadFileUseCase,
      this.cancelUploadedFileUseCase,
      this.uploadMultiFilesUseCase,
      this.getParentBoolUseCase,
      this.getStudentBoolUseCase,
      this.getTeacherBoolUseCase,
      this.updateParentBoolUseCase,
      this.updateStudentBoolUseCase,
      this.updateTeacherBoolUseCase,
      this.cancelUploadedFileFromListUseCase,
      this.userLoginUseCase,
      this.initialRegisterUseCase,
      this.verificationRegisterUseCase,
      this.saveUserRegisterTypeUseCase,
      this.registerStepTwoUseCase,
      this.getUserDataUseCase,
      this.getEducationSystemUseCase,
      this.getEducationLevelUseCase,
      this.teacherFinalRegisterUseCase,
      this.getEducationGradeUseCase,
      this.getTeacherMaterialUseCase,
      this.studentRegisterStep2UseCase,
      this.resendVerificationUseCase,
      this.initialForgetPasswordUseCase,
      this.verificationForgetPasswordUseCase,
      this.forgetPasswordUseCase)
      : super(AuthIntialState());

  static AuthCubit get(context) => BlocProvider.of(context);
  final UserLoginUseCase userLoginUseCase;
  final InitialRegisterUseCase initialRegisterUseCase;
  final VerificationRegisterUseCase verificationRegisterUseCase;
  final UploadFileUseCase uploadFileUseCase;
  final CancelUploadedFileUseCase cancelUploadedFileUseCase;
  final UploadMultiFilesUseCase uploadMultiFilesUseCase;
  final UpdateStudentBoolUseCase updateStudentBoolUseCase;
  final UpdateTeacherBoolUseCase updateTeacherBoolUseCase;
  final GetTeacherBoolUseCase getTeacherBoolUseCase;
  final GetStudentBoolUseCase getStudentBoolUseCase;
  final CancelUploadedFileFromListUseCase cancelUploadedFileFromListUseCase;
  final GetParentBoolUseCase getParentBoolUseCase;
  final UpdateParentBoolUseCase updateParentBoolUseCase;
  final SaveUserRegisterTypeUseCase saveUserRegisterTypeUseCase;
  final UserRegisterStepTwoUseCase registerStepTwoUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  final TeacherFinalRegisterUseCase teacherFinalRegisterUseCase;
  final GetTeacherMaterialUseCase getTeacherMaterialUseCase;
  final GetEducationSystemUseCase getEducationSystemUseCase;
  final ResendVerificationUseCase resendVerificationUseCase;
  final GetEducationLevelUseCase getEducationLevelUseCase;
  final GetEducationGradeUseCase getEducationGradeUseCase;
  final StudentRegisterStep2UseCase studentRegisterStep2UseCase;
  final InitialForgetPasswordUseCase initialForgetPasswordUseCase;
  final VerificationForgetPasswordUseCase verificationForgetPasswordUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  IconData suffix = Icons.visibility_outlined;
  String registerType = '';
  String? userId;
  bool teacherBool = false;
  bool studentBool = false;
  bool parentBool = false;
  bool ispassword = true;
  bool isFilePicked = false;
  IconData suffixConfirm = Icons.visibility_outlined;
  bool ispasswordConfirmed = true;
  bool isLastOnBoarding = false;
  bool isAgree = false;
  bool confirmAgree = false;
  List<DropDownValueModel> educationSystemList = <DropDownValueModel>[];
  List<DropDownValueModel> educationLevelList = <DropDownValueModel>[];
  List<DropDownValueModel> educationGradeList = <DropDownValueModel>[];
  late InitialRegisterEntity initialRegisterEntity;
  late UserLoginEntity userLoginEntity;
  late RegisterStepTwoEntity registerStepTwoEntity;
  late TeacherFinalRegisterEntity teacherFinalRegisterEntity;
  late UserDataEntity userDataEntity;
  late EducationLevelEntity educationLevelEntity;
  late EducationGradeEntity educationGradeEntity;
  late EducationSystemsEntity educationSystemsEntity;
  late ResendVerificationEntity resendVerificationEntity;
  late VerificationRegisterEntity verificationRegisterEntity;
  late TeacherMaterialEntity? teacherMaterialEntity;
  late StudentRegisterStep2Entity studentRegisterStep2Entity;
  late InitialForgetPasswordEntity initialForgetPasswordEntity;
  late VerificationForgetPasswordEntity verificationForgetPasswordEntity;
  late ForgetPasswordEntity forgetPasswordEntity;
  int timerCount = 60;
  List materialList = [];

  void changepasswordvisibilty() {
    ispassword = !ispassword;
    suffix =
        ispassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AuthChangePasswordVisibiltyState());
  }

  void changeConfirmPasswordVisibilty() {
    ispasswordConfirmed = !ispasswordConfirmed;
    suffixConfirm = ispasswordConfirmed
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(AuthChangeConfirmPasswordVisibiltyState());
  }

  File? profileImageFile;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    /// add to domain layer
    emit(UploadProfileImageLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImageFile = File(pickedFile.path);
      print(pickedFile.path.toString());
      emit(UploadProfileImageSuccessState());
    } else {
      print('No Image Selected');
      emit(UploadProfileImageErrorState());
    }
  }

  FilePickerResult? teacherCertificationfilePath;
  File? teacherCertificationFile;
  List<File>? teacherMultiFilesList;
  List<File> myTeacherMultiFilesList = [];
  FilePickerResult? teacherMultiFilesFiles;
  List<File> removeMultiFiles = [];

  Future<void> cancelFileFromList(int index) async {
    // teacherMultiFilesList!.removeAt(index);
    myTeacherMultiFilesList.removeAt(index);
    // if (teacherMultiFilesList!.isEmpty) {
    //   teacherMultiFilesList = null;
    // }
    if (myTeacherMultiFilesList.isEmpty) {
      myTeacherMultiFilesList = [];
    }
    emit(CancelMultiUploadFileSuccessState());
  }

  File? file;

  Future<void> uploadNewFile() async {
    final file = await uploadFileUseCase(const NoParameters());
    file.fold((l) {
      emit(UploadFileErrorState());
    }, (r) {
      teacherCertificationfilePath = r;
      teacherCertificationFile =
          File(teacherCertificationfilePath!.files.single.path!);
      emit(UploadFileSuccessState());
    });
  }

  Future<void> uploadNewMultiFiles() async {
    final file = await uploadMultiFilesUseCase(const NoParameters());
    file.fold((l) {
      emit(UploadFileErrorState());
    }, (r) {
      teacherMultiFilesList = r;
      emit(UploadFileSuccessState());
    });
    teacherMultiFilesList!.forEach((value) {
      var count =
          myTeacherMultiFilesList.where((c) => c.path == value.path).length;
      print(count);
      if (count != 0) {
        return;
      } else {
        myTeacherMultiFilesList.add(value);
      }
    });
    emit(UploadFileSuccessState());
  }

  Future<void> cancelUploadedFileFromList(int index) async {
    final cancel = await cancelUploadedFileFromListUseCase(index);
    cancel.fold(
        (l) => {emit(CancelMultiUploadFileErrorState())},
        (r) => {
              teacherMultiFilesList = r,
              if (teacherMultiFilesList!.isEmpty)
                {teacherMultiFilesList = null},
              emit(CancelMultiUploadFileSuccessState())
            });
  }

  Future<void> cancelUploadedFile() async {
    final file2 = await cancelUploadedFileUseCase(const NoParameters());
    file2.fold((l) => {emit(CancelUploadFileErrorState())}, (r) {
      teacherCertificationfilePath = null;
      emit(CancelUploadFileSuccessState());
    });
  }

  Future<void> setTeacherBool({required bool isTeacher}) async {
    final boardingBool = await updateTeacherBoolUseCase(
        UpdateTeacherBoolParameters(isEnd: isTeacher));
    boardingBool.fold((l) {
      print('there is an error');
      emit(UpdateTeacherBoolErrorState());
    }, (r) {
      teacherBool = r;
      if (teacherBool == true) {
        registerType = 'teacher';
      }
      emit(UpdateTeacherBoolSuccessState());
    });
  }

  Future<void> setStudentBool({required bool isStudent}) async {
    final boardingBool = await updateStudentBoolUseCase(
        UpdateStudentBoolParameters(isEnd: isStudent));
    boardingBool.fold((l) {
      print('there is an error');
      emit(UpdateStudentBoolErrorState());
    }, (r) {
      studentBool = r;
      if (studentBool == true) {
        registerType = 'student';
        saveUserType(type: registerType);
      }
      emit(UpdateStudentBoolSuccessState());
    });
  }

  Future<void> setParentBool({required bool isParent}) async {
    final boardingBool = await updateParentBoolUseCase(
        UpdateParentBoolParameters(isEnd: isParent));
    boardingBool.fold((l) {
      emit(UpdateParentBoolErrorState());
    }, (r) {
      parentBool = r;

      emit(UpdateParentBoolSuccessState());
    });
  }

  Future<void> getTeacherBool() async {
    final boardingBool = await getTeacherBoolUseCase(const NoParameters());
    boardingBool.fold((l) {
      emit(GetTeacherBoolSuccessState());
    }, (r) {
      teacherBool = r;
      emit(GetTeacherBoolErrorState());
    });
  }

  Future<void> getParentBool() async {
    final boardingBool = await getParentBoolUseCase(const NoParameters());
    boardingBool.fold((l) {
      emit(GetParentBoolErrorState());
    }, (r) {
      parentBool = r;
      emit(GetParentBoolSuccessState());
    });
  }

  Future<void> getStudentBool() async {
    final boardingBool = await getStudentBoolUseCase(const NoParameters());
    boardingBool.fold((l) {
      emit(GetStudentBoolErrorState());
    }, (r) {
      studentBool = r;
      emit(GetStudentBoolSuccessState());
    });
  }

  Future<void> countDownTimer() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCount <= 0) {
        timer.cancel();
      }
      if (timerCount != 0) {
        timerCount--;
        emit(ChangeTimerSecondSuccessState());
      }
    });
  }

  void changeFilePickedBool({required bool isPicked}) {
    if (isPicked == true) {
      isFilePicked = true;
    } else if (isPicked == false) {
      isFilePicked = true;
    } else {
      isFilePicked = false;
    }
    emit(ChangeFilePickedBoolSuccessState());
  }

  void changeRepeatBool() {
    isAgree = !isAgree;
    emit(ChangeIsCheckedBoolSuccessState());
  }

  void confirmChangeAgree() {
    confirmAgree = !confirmAgree;
    emit(ChangeConfirmAgreeSuccessState());
  }

  Future<void> userLogin(
      {required String userName,
      required String password,
      required context}) async {
    emit(UserLoginLoadingState());
    final result = await userLoginUseCase(
        UserLoginParameters(userName: userName, password: password));
    result.fold((l) {
      emit(UserLoginErrorState());
    }, (r) async {
      userLoginEntity = r;
      CacheHelper.saveDataToSharedPreferences(
          key: AppStrings.userToken, value: userLoginEntity.data);
      if (userLoginEntity.succeeded == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(mySnackBar(myMessage: userLoginEntity.message));
      } else {
        await getUserData(context: context);

        showToast(
          text: LocaleKeys.loginMessage.tr(),
          state: ToastState.Success,
        );

        var userType = await CacheHelper.getSharedPreferencesValue(
            key: AppStrings.registerTypeNumber);
        if (userType != null) {
          await chooseUserType(
            type: userType,
            context: context,
          );
        } else {
          navigateTo(context, routeName: Routes.loginRoute);
        }
      }
      emit(UserLoginSuccessState());
      emit(UserLoginErrorState());
    });
  }

  Future<void> saveUserType({required String type}) async {
    final userToken = await saveUserRegisterTypeUseCase(
        UserRegisterTypeParameters(type: type));
    userToken.fold((l) {
      emit(SaveUserTokenErrorState());
    }, (r) {
      debugPrint(r.toString());
    });
  }

  Future<void> initialRegister(
      {required String userName,
      required String phone,
      required String password,
      required String passwordConfirmed,
      required String typeId,
      required context}) async {
    emit(InitialRegisterLoadingState());

    try {
      emit(InitialRegisterLoadingState());

      final result = await initialRegisterUseCase(InitialRegisterParameters(
          userName: userName,
          password: password,
          passwordConfirmed: passwordConfirmed,
          phone: phone,
          typeId: typeId));

      result.fold((l) {
        emit(InitialRegisterErrorState());
      }, (r) {
        initialRegisterEntity = r;
        userId = r.data;
        if (initialRegisterEntity.succeeded == false) {
          if (initialRegisterEntity.brokenRules.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                myMessage:
                    "${initialRegisterEntity.brokenRules[0].propertyName}   ${initialRegisterEntity.brokenRules[0].message}",
              ),
            );

            emit(InitialRegisterLoadingState());
          }
          if (initialRegisterEntity.message.isNotEmpty &&
              initialRegisterEntity.brokenRules.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                myMessage: initialRegisterEntity.message,
              ),
            );
            emit(InitialRegisterLoadingState());
          }
        } else {
          showToast(
              text: LocaleKeys.registerStepTwoMessage.tr(),
              state: ToastState.Success);
          emit(RegisterStepTwoSuccessState());
        }
      });
    } catch (e) {
      signOut(context: context);
      emit(InitialRegisterErrorState());
    }
    emit(RegisterStepTwoSuccessState());
  }

  Future<void> removeValueFromShared({required String key}) async {
    CacheHelper.removeDataFromSharedPreferences(key: key);
    var x = CacheHelper.getSharedPreferencesValue(key: key);
    emit(RemoveValueFromSharedSuccessAuthState());
    debugPrint(x);
  }

  Future<void> signOut({required BuildContext context}) async {
    removeValueFromShared(key: AppStrings.userToken);
    removeValueFromShared(key: AppStrings.registerTypeNumber);

    // navigateAndFinish(context, routeName: Routes.loginRoute);
    emit(SignOutSuccessAuthState());
  }

  Future<void> verificationRegister(
      {required int userId,
      required int verificationCode,
      required context}) async {
    emit(VerificationRegisterLoadingState());
    try {
      emit(VerificationRegisterLoadingState());
      final result = await verificationRegisterUseCase(
        VerificationRegisterParameters(
          userId: userId,
          verificationCode: verificationCode,
        ),
      );
      emit(VerificationRegisterLoadingState());
      result.fold((l) {}, (r) async {
        emit(VerificationRegisterLoadingState());
        verificationRegisterEntity = r;

        if (verificationRegisterEntity.succeeded == false) {
          ScaffoldMessenger.of(context).showSnackBar(mySnackBar(
            myMessage: verificationRegisterEntity.message,
          ));
        } else {
          CacheHelper.saveDataToSharedPreferences(
              key: AppStrings.userToken,
              value: verificationRegisterEntity.data);
          debugPrint('${ApiConstance.token()}    token');
          await getUserData(context: context);
        }
        emit(VerificationRegisterSuccessState());
      });
    } catch (e) {
      emit(VerificationRegisterErrorState());
    }
  }

  Future<void> studentRegisterStep2(
      {required int eductionGradeId, required context}) async {
    emit(StudentRegisterStep2LoadingState());
    try {
      emit(StudentRegisterStep2LoadingState());

      final result = await studentRegisterStep2UseCase(
          StudentRegisterStep2Parameters(studentGradeId: eductionGradeId));
      result.fold((l) {}, (r) {
        emit(StudentRegisterStep2LoadingState());
        studentRegisterStep2Entity = r;
        debugPrint('${studentRegisterStep2Entity.data}  eductionGradeId');
        emit(StudentRegisterStep2SuccessState());
        educationLevelList.clear();
        educationGradeList.clear();
      });
    } catch (e) {
      signOut(context: context);
      emit(StudentRegisterStep2ErrorState());
    }
  }

  Future<void> getEducationLevel(
      {required int educationSystemIdParameters, required context}) async {
    try {
      final result = await getEducationLevelUseCase(
          EducationSystemIdParameters(typeId: educationSystemIdParameters));
      result.fold((l) {}, (r) {
        educationLevelList.clear();
        educationGradeList.clear();
        educationLevelEntity = r;
        educationLevelList = (educationLevelEntity.data as List<dynamic>)
            .map((e) => DropDownValueModel(name: e['name'], value: e['id']))
            .toList();
        debugPrint(educationLevelList.toString());
        emit(GetEducationLevelSuccessState());
      });
    } catch (e) {
      signOut(context: context);
      emit(GetEducationLevelErrorState());
    }
  }

  Future<void> getEducationGrade(
      {required int educationLevelId, required context}) async {
    try {
      final result = await getEducationGradeUseCase(
          EducationLevelIdParameters(typeId: educationLevelId));
      result.fold((l) {}, (r) {
        educationGradeList.clear();
        educationGradeEntity = r;
        educationGradeList = (educationGradeEntity.data as List<dynamic>)
            .map((e) => DropDownValueModel(name: e['name'], value: e['id']))
            .toList();
        emit(GetEducationGradeSuccessState());
      });
    } catch (e) {
      signOut(context: context);
      emit(GetEducationGradeErrorState());
    }
  }

  Future<void> getEducationSystem({required context}) async {
    emit(GetEducationSystemLoadingState());
    try {
      final result = await getEducationSystemUseCase(const NoParameters());
      print(result);
      result.fold((l) {}, (r) {
        educationSystemsEntity = r;
        educationSystemList = (educationSystemsEntity.data as List<dynamic>)
            .map((e) => DropDownValueModel(
                name: e['name'].replaceAll("\r\n", ""), value: e['id']))
            .toList();

        emit(GetEducationSystemSuccessState());
      });
    } catch (e) {
      signOut(context: context);
      emit(GetEducationSystemErrorState());
    }
  }

  Future<void> registerStepTwo({
    required String name,
    required String address,
    required String birthDate,
    required String idNumber,
    required String email,
    File? image,
    required context,
  }) async {
    emit(RegisterStepTwoLoadingState());
    try {
      emit(RegisterStepTwoLoadingState());
      final result = await registerStepTwoUseCase(
        RegisterStepTwoParameters(
          fullName: name,
          image: image,
          address: address,
          birthDate: birthDate,
          email: email,
          idNumber: idNumber,
          token: ApiConstance.token(),
        ),
      );
      result.fold((l) {
        emit(RegisterStepTwoLoadingState());
        emit(RegisterStepTwoErrorState());
      }, (r) async {
        emit(RegisterStepTwoLoadingState());
        print(r.data);
        registerStepTwoEntity = r;
        if (registerStepTwoEntity.succeeded == false) {
          if (registerStepTwoEntity.brokenRules.isNotEmpty) {
            {
              ScaffoldMessenger.of(context).showSnackBar(
                mySnackBar(
                  myMessage:
                      "${(registerStepTwoEntity.brokenRules[0].propertyName)}      ${registerStepTwoEntity.brokenRules[0].message}",
                ),
              );
            }
          }
          if (registerStepTwoEntity.message.isNotEmpty &&
              registerStepTwoEntity.brokenRules.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                myMessage: registerStepTwoEntity.message,
              ),
            );
          }
        } else {
          var registerType = await CacheHelper.getSharedPreferencesValue(
              key: AppStrings.registerTypeNumber);
          print(registerType);
          chooseRegisterTypeStep2(
            registerType: registerType,
            context: context,
          );
          showToast(
            text: LocaleKeys.registerStepTwoMessage.tr(),
            state: ToastState.Success,
          );
        }
        emit(RegisterStepTwoSuccessState());
      });
    } catch (e) {
      signOut(context: context);
      emit(RegisterStepTwoErrorState());
    }
    emit(RegisterStepTwoSuccessState());
  }

  Future<void> teacherFinalRegister({
    required String certificationName,
    required int certificationYear,
    required List material,
    required File idImage,
    required List<File> attachment,
    required context,
  }) async {
    emit(TeacherFinalRegisterLoadingtate());
    try {
      emit(TeacherFinalRegisterLoadingtate());
      final result =
          await teacherFinalRegisterUseCase(TeacherFinalRegisterParameters(
        token: ApiConstance.token(),
        certificateName: certificationName,
        certificateYear: certificationYear,
        attachments: attachment,
        materials: material,
        idImage: idImage,
      ));
      result.fold((l) {
        emit(TeacherFinalRegisterErrorState());
      }, (r) {
        emit(TeacherFinalRegisterLoadingtate());

        teacherFinalRegisterEntity = r;
        if (teacherFinalRegisterEntity.succeeded == false) {
          ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(myMessage: teacherFinalRegisterEntity.message));
          emit(TeacherFinalRegisterErrorState());
        } else if (teacherFinalRegisterEntity.brokenRules.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(
              myMessage: teacherFinalRegisterEntity.brokenRules.first.message,
            ),
          );
          emit(TeacherFinalRegisterErrorState());
        } else {
          showToast(
            text: LocaleKeys.teacherFinalRegisterMessage.tr(),
            state: ToastState.Success,
          );
          emit(TeacherFinalRegisterSuccessState());

          navigateTo(
            context,
            routeName: Routes.teacherMainScreenRoute,
          );
        }
      });
    } catch (e) {
      signOut(context: context);
      emit(TeacherFinalRegisterErrorState());
    }
  }

  Future<void> getTeacherMaterial({required context}) async {
    try {
      final result = await getTeacherMaterialUseCase(const NoParameters());
      result.fold((l) {}, (r) {
        teacherMaterialEntity = r;
        emit(GetMaterialSuccessState());
      });
    } catch (e) {
      signOut(context: context);
      emit(GetEducationSystemErrorState());
    }
  }

  bool? firstRegisterIsComplete;
  bool? secondRegisterIsComplete;
  int? typeId;
  Future<void> getUserData({required context}) async {
    try {
      final result = await getUserDataUseCase(
          UserDataParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        userDataEntity = r;
        typeId = userDataEntity.userData.typeId;
        firstRegisterIsComplete = userDataEntity.userData.isFirstStepCompleted;
        secondRegisterIsComplete =
            userDataEntity.userData.isSecondStepCompleted;

        CacheHelper.saveDataToSharedPreferences(
            key: AppStrings.registerTypeNumber,
            value: userDataEntity.userData.typeId);
        emit(GetUserDataSuccessState());
      });
    } catch (e) {
      signOut(context: context);
      emit(GetUserDataErrorState());
    }
  }

  Future<void> conditionMethodForButton({required context}) async {
    try {
      final result = await getUserDataUseCase(
          UserDataParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        userDataEntity = r;
        debugPrint(userDataEntity.userData.name);
        CacheHelper.saveDataToSharedPreferences(
            key: AppStrings.registerTypeNumber,
            value: userDataEntity.userData.typeId);
        emit(GetUserDataSuccessState());
      });
    } catch (e) {
      emit(GetUserDataErrorState());
    }
  }

  Future<void> resendVerification({
    required int userId,
    required context,
  }) async {
    emit(ResendVerificationLoadingState());
    try {
      emit(ResendVerificationLoadingState());
      final result = await resendVerificationUseCase(
        ResendVerificationParameters(
          userId: userId,
        ),
      );
      emit(ResendVerificationLoadingState());
      result.fold((l) {}, (r) {
        emit(ResendVerificationLoadingState());
        resendVerificationEntity = r;

        if (resendVerificationEntity.succeeded == false) {
          ScaffoldMessenger.of(context).showSnackBar(mySnackBar(
            myMessage: resendVerificationEntity.message,
          ));
        } else {
          CacheHelper.saveDataToSharedPreferences(
              key: AppStrings.userToken, value: resendVerificationEntity.data);
        }
        getUserData(context: context);
        emit(ResendVerificationSuccessState());
      });
    } catch (e) {
      emit(ResendVerificationErrorState());
    }
  }

  Future<void> initialForgetPassword(
      {required String userName, required context}) async {
    emit(InitialForgetPasswordLoadingState());

    try {
      emit(InitialForgetPasswordLoadingState());

      final result =
          await initialForgetPasswordUseCase(InitialForgetPasswordParameters(
        userName: userName,
      ));

      result.fold((l) {
        emit(InitialForgetPasswordErrorState());
      }, (r) {
        initialForgetPasswordEntity = r;
        print(r.data);
        userId = r.data;
        if (initialForgetPasswordEntity.succeeded == false) {
          if (initialForgetPasswordEntity.brokenRules.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                myMessage:
                    "${initialForgetPasswordEntity.brokenRules[0].propertyName}   ${initialForgetPasswordEntity.brokenRules[0].message}",
              ),
            );

            emit(InitialForgetPasswordLoadingState());
          }
          if (initialForgetPasswordEntity.message.isNotEmpty &&
              initialForgetPasswordEntity.brokenRules.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                myMessage: initialForgetPasswordEntity.message,
              ),
            );
            emit(InitialForgetPasswordLoadingState());
          }
        } else {
          showToast(
              text: LocaleKeys.registerStepTwoMessage.tr(),
              state: ToastState.Success);
          navigateTo(context, routeName: Routes.forgetPasswordVerification);
          emit(InitialForgetPasswordSuccessState());
        }
      });
    } catch (e) {
      // showToast(
      //     text: 'Please Login Again Because Data Expire',
      //     state: ToastState.Error);
      signOut(context: context);
      emit(InitialForgetPasswordErrorState());
    }
    emit(InitialForgetPasswordSuccessState());
  }

  Future<void> verificationForgetPassword(
      {required int verificationCode, required context}) async {
    emit(VerificationForgetPasswordLoadingState());

    try {
      emit(VerificationForgetPasswordLoadingState());

      final result = await verificationForgetPasswordUseCase(
          VerificationForgetPasswordParameters(
              verificationCode: verificationCode, userId: int.parse(userId!)));

      result.fold((l) {
        emit(VerificationForgetPasswordErrorState());
      }, (r) {
        verificationForgetPasswordEntity = r;
        userId = verificationForgetPasswordEntity
            .verificationForgetPassword.userId
            .toString();
        print(
            verificationForgetPasswordEntity.verificationForgetPassword.token);
        CacheHelper.saveDataToSharedPreferences(
            key: AppStrings.userToken,
            value: verificationForgetPasswordEntity
                .verificationForgetPassword.token);

        if (verificationForgetPasswordEntity.succeeded == false) {
          if (verificationForgetPasswordEntity.brokenRules.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                myMessage:
                    "${verificationForgetPasswordEntity.brokenRules[0].propertyName}   ${verificationForgetPasswordEntity.brokenRules[0].message}",
              ),
            );

            emit(VerificationForgetPasswordLoadingState());
          }
          if (verificationForgetPasswordEntity.message.isNotEmpty &&
              verificationForgetPasswordEntity.brokenRules.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                myMessage: verificationForgetPasswordEntity.message,
              ),
            );
            emit(VerificationForgetPasswordLoadingState());
          }
        } else {
          showToast(
              text: LocaleKeys.registerStepTwoMessage.tr(),
              state: ToastState.Success);
          navigateTo(context, routeName: Routes.forgetPassword);
          emit(VerificationForgetPasswordSuccessState());
        }
      });
    } catch (e) {
      // showToast(
      //     text: 'Please Login Again Because Data Expire',
      //     state: ToastState.Error);
      signOut(context: context);
      emit(VerificationForgetPasswordErrorState());
    }
    emit(VerificationForgetPasswordSuccessState());
  }

  Future<void> forgetPassword({
    required String password,
    required String confirmPassword,
    required context,
  }) async {
    emit(ForgetPasswordLoadingState());

    try {
      emit(ForgetPasswordLoadingState());

      final result = await forgetPasswordUseCase(ForgetPasswordParameters(
          userId: userId!,
          token: ApiConstance.token(),
          passwordConfirmed: confirmPassword,
          password: password));

      result.fold((l) {
        emit(ForgetPasswordErrorState());
      }, (r) {
        forgetPasswordEntity = r;
        if (forgetPasswordEntity.succeeded == false) {
          if (forgetPasswordEntity.brokenRules.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                myMessage:
                    "${forgetPasswordEntity.brokenRules[0].propertyName}   ${forgetPasswordEntity.brokenRules[0].message}",
              ),
            );

            emit(ForgetPasswordLoadingState());
          }
          if (forgetPasswordEntity.message.isNotEmpty &&
              forgetPasswordEntity.brokenRules.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                myMessage: forgetPasswordEntity.message,
              ),
            );
            emit(ForgetPasswordLoadingState());
          }
        } else {
          showToast(
              text: LocaleKeys.registerStepTwoMessage.tr(),
              state: ToastState.Success);
          navigateTo(context, routeName: Routes.loginRoute);
          emit(ForgetPasswordSuccessState());
        }
      });
    } catch (e) {
      // showToast(
      //     text: 'Please Login Again Because Data Expire',
      //     state: ToastState.Error);
      // signOut(context: context);
      emit(ForgetPasswordErrorState());
    }
    emit(ForgetPasswordSuccessState());
  }
}
