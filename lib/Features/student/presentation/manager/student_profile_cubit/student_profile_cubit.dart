// ignore_for_file: unnecessary_import, prefer_const_constructors, avoid_print

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/student/domain/entities/student_personal_data_entity.dart';
import 'package:hassy/Features/student/domain/entities/update_student_user_data_entity.dart';
import 'package:hassy/Features/student/domain/entities/update_user_profile_image_entity.dart';
import 'package:hassy/Features/student/domain/use_cases/get_student_personal_data_use_case.dart';
import 'package:hassy/Features/student/domain/use_cases/udate_student_data_use_case.dart';
import 'package:hassy/Features/teacher/domain/entities/teacher_update_basic_data_entity.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/api/api_constance.dart';
import '../../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../authentication/domain/entities/education_grade_entity.dart';
import '../../../../authentication/domain/entities/education_level_entity.dart';
import '../../../../authentication/domain/entities/education_systems_entitiy.dart';
import '../../../../authentication/domain/entities/uesr_data_entity.dart';
import '../../../../authentication/domain/use_cases/get_Education_Level_use_case.dart';
import '../../../../authentication/domain/use_cases/get_Education_system_use_case.dart';
import '../../../../authentication/domain/use_cases/get_education_grade_use_case.dart';
import '../../../../authentication/domain/use_cases/get_user_data_use_case.dart';
import '../../../../teacher/domain/entities/add_complaints_entity.dart';
import '../../../../teacher/domain/entities/get_complaints_entity.dart';
import '../../../../teacher/domain/entities/get_privacy_policy_entity.dart';
import '../../../../teacher/domain/use_cases/add_complaints_use_case.dart';
import '../../../../teacher/domain/use_cases/get_common_questions_use_case.dart';
import '../../../../teacher/domain/use_cases/get_complaints_use_case.dart';
import '../../../../teacher/domain/use_cases/get_privacy_policy_use_case.dart';
import '../../../../teacher/domain/use_cases/teacher_update_basic_data_use_case.dart';
import '../../../domain/use_cases/update_user_profile_image_use_case.dart';

part 'student_profile_state.dart';

class StudentProfileCubit extends Cubit<StudentProfileState> {
  StudentProfileCubit(
      this.getUserDataUseCase,
      this.getStudentPersonalDataUseCase,
      this.getEducationGradeUseCase,
      this.getEducationLevelUseCase,
      this.getEducationSystemUseCase,
      this.updateStudentDataUseCase,
      this.updateUserBasicDataUseCase,
      this.updateUserProfileImageUseCase,
      this.getComplaintsUseCase,
      this.addComplaintsUseCase,
      this.getPrivacyPolicyUseCase,
      this.getCommonQuestionsUseCase)
      : super(StudentInitial());
  // main Varibles
  DateTime selectedDate = DateTime.now();
  static StudentProfileCubit get(context) => BlocProvider.of(context);
  String visaPayment = "";
  bool isRepeated = false;
  bool isAddCard = false;
  bool isFilePicked = false;
  bool savePaymentCard = false;
  List<DropDownValueModel> educationSystemList = <DropDownValueModel>[];
  List<DropDownValueModel> educationLevelList = <DropDownValueModel>[];
  List<DropDownValueModel> educationGradeList = <DropDownValueModel>[];
  late int eductionGradeId;
  late int eductionSystemId;
  late int eductionLevelId;
  late UserDataEntity userDataEntity;
  late UpdateStudentUserDataEntity updateStudentUserDataEntity;
  late StudentPersonalDataEntity studentPersonalDataEntity;
  late EducationLevelEntity educationLevelEntity;
  late UpdateBasicUserDataEntity updateBasicUserDataEntity;
  late EducationGradeEntity educationGradeEntity;
  late EducationSystemsEntity educationSystemsEntity;
  late UpdateUserProfileImageEntity updateUserProfileImageEntity;
  late GetPrivacyPolicyEntity getPrivacyPolicyEntity;
  late GetComplaintsEntity getComplaintsEntity;
  late AddComplaintsEntity addComplaintsEntity;
  late GetPrivacyPolicyEntity getCommonQuestionsEntity;

  late DropDownValueModel initialEducationSystemValueModel;
  late DropDownValueModel initialEducationLevelValueModel;
  late DropDownValueModel initialEducationGradeValueModel;

  final GetUserDataUseCase getUserDataUseCase;
  final UpdateUserBasicDataUseCase updateUserBasicDataUseCase;
  final GetStudentPersonalDataUseCase getStudentPersonalDataUseCase;
  final GetEducationSystemUseCase getEducationSystemUseCase;
  final UpdateStudentDataUseCase updateStudentDataUseCase;
  final GetEducationLevelUseCase getEducationLevelUseCase;
  final GetEducationGradeUseCase getEducationGradeUseCase;
  final UpdateUserProfileImageUseCase updateUserProfileImageUseCase;
  final AddComplaintsUseCase addComplaintsUseCase;
  final GetPrivacyPolicyUseCase getPrivacyPolicyUseCase;
  final GetComplaintsUseCase getComplaintsUseCase;
  final GetCommonQuestionsUseCase getCommonQuestionsUseCase;

  //

  void changeDatetime(DateTime myDate, context) async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(21160),
    );
    selectedDate = myDate;
    if (pickerDate != null) {
      debugPrint(selectedDate.toString());
      debugPrint(pickerDate.toString());
      selectedDate = pickerDate;
      emit(ChangeDateTimeSuccessState());
    } else {
      debugPrint('null');
      emit(ChangeDateTimeErrorState());
    }
  }

  int currentIndex = 0;
  void changeNavBar(int index) {
    currentIndex = index;
    if (currentIndex == 0) {
      emit(ChangeNavBarState0());
    } else if (currentIndex == 1) {
      emit(ChangeNavBarState1());
    } else if (currentIndex == 2) {
      emit(ChangeNavBarState2());
    } else {
      emit(ChangeNavBarState3());
    }
  }

  void changeRepeatBool() {
    isRepeated = !isRepeated;
    emit(ChangeIsCheckedBoolSuccessState());
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

  void changePayMethod({required String value}) {
    visaPayment = value;
    emit(ChangeVisaPaymentStringSuccessState());
  }

  void changeAddCardBool() {
    isAddCard = !isAddCard;
    emit(ChangeAddCardBoolSuccessState());
  }

  void savePaymentCardBool() {
    savePaymentCard = !savePaymentCard;
    emit(ChangeIsCheckedBoolSuccessState());
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

  Future<void> getUserData({required context}) async {
    try {
      final result = await getUserDataUseCase(
          UserDataParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        userDataEntity = r;
        print('${userDataEntity.userData.isFirstStepCompleted} first step');
        AppStrings.isFirstStepCompleted(
            isFirstStepCompleted:
                userDataEntity.userData.isFirstStepCompleted!);
        AppStrings.isSecondStepCompletedFromShared(
            isSecondStepCompleted:
                userDataEntity.userData.isSecondStepCompleted!);
        print('${userDataEntity.userData.isSecondStepCompleted} Second step');
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

  Future<void> getStudentPersonalData() async {
    emit(GetStudentPersonalDataLoadingState());
    try {
      final result = await getStudentPersonalDataUseCase(NoParameters());
      result.fold((l) {
        emit(GetStudentPersonalDataErrorState());
      }, (r) {
        studentPersonalDataEntity = r;
        eductionGradeId = r.data['eductionGradeId'];
        debugPrint('$eductionGradeId   this is eductionGradeId');
        eductionSystemId = r.data['eductionSystemId'];
        debugPrint('$eductionSystemId   this is system id');
        eductionLevelId = r.data['eductionLevelId'];
        debugPrint('$eductionLevelId   this is Level id');

        emit(GetStudentPersonalDataSuccessState());
      });
    } catch (e) {
      debugPrint(e.toString());
      emit(GetStudentPersonalDataErrorState());
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

        for (var element in educationLevelList) {
          if (eductionLevelId == element.value) {
            initialEducationLevelValueModel = element;
          }
        }
        emit(GetStudentEducationLevelSuccessState());
      });
    } catch (e) {
      signOut(context: context);
      emit(GetStudentEducationLevelErrorState());
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
        for (var element in educationGradeList) {
          if (eductionGradeId == element.value) {
            initialEducationGradeValueModel = element;
          }
        }
        emit(GetStudentEducationGradeSuccessState());
      });
    } catch (e) {
      signOut(context: context);
      emit(GetStudentEducationGradeErrorState());
    }
  }

  Future<void> getEducationSystem({required context}) async {
    emit(GetStudentEducationSystemLoadingState());
    try {
      final result = await getEducationSystemUseCase(const NoParameters());
      result.fold((l) {}, (r) {
        educationSystemsEntity = r;
        educationSystemList = (educationSystemsEntity.data as List<dynamic>)
            .map((e) => DropDownValueModel(
                name: e['name'].replaceAll("\r\n", ""), value: e['id']))
            .toList();
        for (var element in educationSystemList) {
          if (eductionSystemId == element.value) {
            initialEducationSystemValueModel = element;
          }
        }
        emit(GetStudentEducationSystemSuccessState());
      });
    } catch (e) {
      signOut(context: context);
      emit(GetStudentEducationSystemErrorState());
    }
  }

  Future<void> signOut({required BuildContext context}) async {
    removeValueFromShared(key: AppStrings.userToken);
    removeValueFromShared(key: AppStrings.registerTypeNumber);
    removeValueFromShared(key: AppStrings.registerStepOneSkipped);
    removeValueFromShared(key: AppStrings.registerStepTwoSkipped);

    navigateAndFinish(context, routeName: Routes.loginRoute);
    emit(SignOutSuccessAuthState());
  }

  Future<void> removeValueFromShared({required String key}) async {
    CacheHelper.removeDataFromSharedPreferences(key: key);
    var x = CacheHelper.getSharedPreferencesValue(key: key);
    emit(RemoveValueFromSharedSuccessAuthState());
    debugPrint(x);
  }

  Future<void> updateStudentData(
      {required int eductionGradeId, required context}) async {
    emit(UpdateStudentDataLoadingState());
    try {
      emit(UpdateStudentDataLoadingState());

      final result = await updateStudentDataUseCase(
          UpdateStudentDataParameters(updateStudentIdGrade: eductionGradeId));
      result.fold((l) {}, (r) {
        emit(UpdateStudentDataLoadingState());
        updateStudentUserDataEntity = r;
        debugPrint('${updateStudentUserDataEntity.data}  NewEductionGradeId');
        if (updateStudentUserDataEntity.succeeded == false) {
          if (updateStudentUserDataEntity.brokenRules.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                myMessage:
                    "${updateStudentUserDataEntity.brokenRules[0].propertyName}   ${updateStudentUserDataEntity.brokenRules[0].message}",
              ),
            );

            emit(UpdateStudentDataLoadingState());
          }
          if (updateStudentUserDataEntity.message.isNotEmpty &&
              updateStudentUserDataEntity.brokenRules.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                myMessage: updateStudentUserDataEntity.message,
              ),
            );
            emit(UpdateStudentDataLoadingState());
          }
        } else {
          showToast(
              text: LocaleKeys.teacherFinalRegisterMessage.tr(),
              state: ToastState.Success);
          emit(UpdateStudentDataSuccessState());
        }
        // getStudentPersonalData();
        // getEducationSystem(context: context);
        // getEducationLevel(
        //     educationSystemIdParameters: eductionSystemId, context: context);
        // getEducationGrade(educationLevelId: eductionLevelId, context: context);
        // educationLevelList.clear();
        // educationGradeList.clear();
      });
    } catch (e) {
      signOut(context: context);
      emit(UpdateStudentDataErrorState());
    }
  }

  Future<void> updateUserBasicData({
    required String name,
    required String address,
    required String email,
    required String birthDate,
    required context,
  }) async {
    emit(UpdateUserBasicDataLoadingState());
    try {
      emit(UpdateUserBasicDataLoadingState());
      final result =
          await updateUserBasicDataUseCase(UpdateUserBasicDataParameters(
        token: ApiConstance.token(),
        name: name,
        address: address,
        email: email,
        birthDate: birthDate,
      ));
      result.fold((l) {
        emit(UpdateUserBasicDataErrorState());
      }, (r) {
        emit(UpdateUserBasicDataLoadingState());

        updateBasicUserDataEntity = r;
        if (updateBasicUserDataEntity.succeeded == false) {
          ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(myMessage: updateBasicUserDataEntity.message));
          // emit(UpdateUserBasicDataErrorState());
        } else if (updateBasicUserDataEntity.brokenRules.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(
              myMessage: updateBasicUserDataEntity.brokenRules.first.message,
            ),
          );
          // emit(TeacherUpdateBasicDataErrorState());
        } else {
          showToast(
            text: LocaleKeys.teacherFinalRegisterMessage.tr(),
            state: ToastState.Success,
          );
          // Navigator.pop(context);
          emit(UpdateUserBasicDataSuccessState());
        }
        // emit(UpdateUserBasicDataSuccessState());
      });
    } catch (e) {
      print(e.toString());
      emit(UpdateUserBasicDataErrorState());
    }
  }

  Future<void> updateUserProfileImage({
    required File image,
    required context,
  }) async {
    emit(UpdateUserProfileImageLoadingState());
    try {
      emit(UpdateUserProfileImageLoadingState());
      final result = await updateUserProfileImageUseCase(
          UpdateUserProfileImageParameters(
              image: image, token: ApiConstance.token()));
      result.fold((l) {
        emit(UpdateUserProfileImageErrorState());
      }, (r) {
        emit(UpdateUserProfileImageLoadingState());
        updateUserProfileImageEntity = r;
        if (updateUserProfileImageEntity.succeeded == false) {
          ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(myMessage: updateUserProfileImageEntity.message));
          // emit(UpdateUserBasicDataErrorState());
        } else if (updateUserProfileImageEntity.brokenRules.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(
              myMessage: updateUserProfileImageEntity.brokenRules.first.message,
            ),
          );
          // emit(TeacherUpdateBasicDataErrorState());
        } else {
          showToast(
            text: LocaleKeys.teacherFinalRegisterMessage.tr(),
            state: ToastState.Success,
          );
          // Navigator.pop(context);
          emit(UpdateUserProfileImageSuccessState());
        }
        // emit(UpdateUserBasicDataSuccessState());
      });
    } catch (e) {
      print('$e this is error');
      emit(UpdateUserProfileImageErrorState());
    }
  }

  Future<void> getComplaintsType({required context}) async {
    try {
      final result = await getComplaintsUseCase(
          GetComplaintsParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        getComplaintsEntity = r;
        print(getComplaintsEntity.complaintsData.toString());
        emit(GetComplaintsTypeSuccessState());
      });
    } catch (e) {
      print(e.toString());
      emit(GetComplaintsTypeErrorState());
    }
  }

  Future<void> addComplaints({
    required int complaintTypeId,
    required String title,
    required String body,
    required context,
  }) async {
    emit(AddComplaintsLoadingState());
    try {
      emit(AddComplaintsLoadingState());
      final result = await addComplaintsUseCase(AddComplaintsParameters(
        token: ApiConstance.token(),
        body: body,
        title: title,
        complaintTypeId: complaintTypeId,
      ));
      result.fold((l) {
        emit(AddComplaintsErrorState());
      }, (r) {
        emit(AddComplaintsLoadingState());

        addComplaintsEntity = r;
        if (addComplaintsEntity.succeeded == false) {
          ScaffoldMessenger.of(context)
              .showSnackBar(mySnackBar(myMessage: addComplaintsEntity.message));
          emit(AddComplaintsErrorState());
        } else if (addComplaintsEntity.brokenRules.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(
              myMessage: addComplaintsEntity.brokenRules.first.message,
            ),
          );
          emit(AddComplaintsErrorState());
        } else {
          showToast(
            text: LocaleKeys.teacherFinalRegisterMessage.tr(),
            state: ToastState.Success,
          );
          // getUserData(context: context);
          Navigator.pop(context);
          emit(AddComplaintsSuccessState());
        }
      });
    } catch (e) {
      print(e.toString());
      emit(AddComplaintsErrorState());
    }
  }

  Future<void> getPrivacyPolicy({required context}) async {
    try {
      final result = await getPrivacyPolicyUseCase(
          GetPrivacyPolicyParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        getPrivacyPolicyEntity = r;
        print(getPrivacyPolicyEntity.privacyPolicyData[0].title.toString());
        emit(GetPrivacyPolicySuccessState());
      });
    } catch (e) {
      print(e.toString());
      emit(GetPrivacyPolicyErrorState());
    }
  }

  Future<void> getCommonQuestions({required context}) async {
    try {
      final result = await getCommonQuestionsUseCase(
          GetCommonQuestionsParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        getCommonQuestionsEntity = r;
        emit(GetCommonQuestionsSuccessState());
      });
    } catch (e) {
      print(e.toString());
      emit(GetCommonQuestionsErrorState());
    }
  }
}
