// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherHome/teacher_home_state.dart';

import '../../../../../core/utils/api/api_constance.dart';
import '../../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../authentication/domain/entities/uesr_data_entity.dart';
import '../../../../authentication/domain/use_cases/get_user_data_use_case.dart';
import '../../../domain/entities/get_student_entity.dart';
import '../../../domain/use_cases/get_student_use_case.dart';

class TeacherHomeCubit extends Cubit<TeacherHomeState> {
  TeacherHomeCubit(
    this.getStudentUseCase,
    this.getUserDataUseCase,
  ) : super(TeacherHomeCubitIntialState());
  static TeacherHomeCubit get(context) => BlocProvider.of(context);
  DateTime selectedDate = DateTime.now();
  bool isRepeated = false;
  bool isStart = false;
  bool nextStep = false;
  bool lastStep = false;
  bool isDropDownClear = false;
  int currentIndex = 0;
  int stepIndex = 0;
  String idFile = '';
  String idPath = '';
  List<String> fileNamesList = [];
  List<String> filePathList = [];
  List<int> deletedPaths = [];
  final GetStudentUseCase getStudentUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  late GetStudentEntity getStudentEntity;
  UserDataEntity? userDataEntity;

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

  void changeClassStartBool() {
    isStart = !isStart;
    debugPrint(isStart.toString());
    emit(ChangeIsStartBoolSuccessState());
  }

  void changeStepNextBool() {
    nextStep = !nextStep;
    emit(ChangeStepNextSuccessState());
  }

  void changeStepLastBool() {
    lastStep = !lastStep;
    emit(ChangeLastStepSuccessState());
  }

  void tapped(int step) {
    stepIndex = step;
    emit(ChangeStepIndexSuccessState());
  }

  void continued() {
    stepIndex < 2 ? stepIndex += 1 : null;
    emit(ChangeContinueStepSuccessState());
  }

  void cancel() {
    stepIndex > 0 ? stepIndex -= 1 : null;
    emit(ChangeCancelStepSuccessState());
  }

  Future<void> getStudentData() async {
    try {
      final result = await getStudentUseCase(
          StudentParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        getStudentEntity = r;
        debugPrint(getStudentEntity.studentData.length.toString());
        emit(GetStudentSuccessState());
      });
    } catch (e) {
      emit(GetStudentErrorState());
    }
  }

  Future<void> getUserData({required context}) async {
    try {
      final result = await getUserDataUseCase(
          UserDataParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        userDataEntity = r;
        print('${userDataEntity!.userData.isFirstStepCompleted} first step');
        AppStrings.isFirstStepCompleted(
            isFirstStepCompleted:
                userDataEntity!.userData.isFirstStepCompleted!);
        AppStrings.isSecondStepCompletedFromShared(
            isSecondStepCompleted:
                userDataEntity!.userData.isSecondStepCompleted!);
        print('${userDataEntity!.userData.isSecondStepCompleted} Second step');
        CacheHelper.saveDataToSharedPreferences(
            key: AppStrings.registerTypeNumber,
            value: userDataEntity!.userData.typeId);
        emit(GetTeacherDataSuccessState());
      });
    } catch (e) {
      // signOut(context: context);
      emit(GetTeacherDataErrorState());
    }
  }
}
