// ignore_for_file: avoid_print

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherMainClasses/teacher_classes_state.dart';

import '../../../../../core/utils/api/api_constance.dart';
import '../../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../../core/utils/usecase/base_use_case.dart';
import '../../../../authentication/domain/entities/education_grade_entity.dart';
import '../../../../authentication/domain/entities/education_level_entity.dart';
import '../../../../authentication/domain/entities/education_systems_entitiy.dart';
import '../../../../authentication/domain/entities/get_material_entity.dart';
import '../../../../authentication/domain/entities/uesr_data_entity.dart';
import '../../../../authentication/domain/use_cases/get_Education_Level_use_case.dart';
import '../../../../authentication/domain/use_cases/get_Education_system_use_case.dart';
import '../../../../authentication/domain/use_cases/get_education_grade_use_case.dart';
import '../../../../authentication/domain/use_cases/get_material_use_case.dart';
import '../../../../authentication/domain/use_cases/get_user_data_use_case.dart';
import '../../../domain/entities/get_lesson_type_entity.dart';
import '../../../domain/entities/get_teacher_places_entity.dart';
import '../../../domain/use_cases/get_lesson_type_use_case.dart';
import '../../../domain/use_cases/get_teacher_place_use_case.dart';

class TeacherClassesCubit extends Cubit<TeacherClassesState> {
  TeacherClassesCubit(
    this.getEducationSystemUseCase,
    this.getEducationLevelUseCase,
    this.getEducationGradeUseCase,
    this.getTeacherMaterialUseCase,
    this.getLessonTypeUseCase,
    this.getTeacherPlaceUseCase,
    this.getUserDataUseCase,
  ) : super(TeacherClassesInitial());
  static TeacherClassesCubit get(context) => BlocProvider.of(context);
  bool isRepeated = false;
  bool isDropDownClear = false;
  bool isFilePicked = false;
  late EducationSystemsEntity educationSystemsEntity;
  late EducationLevelEntity educationLevelEntity;
  late EducationGradeEntity educationGradeEntity;
  late TeacherMaterialEntity? teacherMaterialEntity;
  late GetTeacherPlaceEntity getTeacherPlaceEntity;
  late UserDataEntity userDataEntity;
  final GetEducationSystemUseCase getEducationSystemUseCase;
  late GetLessonTypeEntity getLessonTypeEntity;
  final GetEducationLevelUseCase getEducationLevelUseCase;
  final GetEducationGradeUseCase getEducationGradeUseCase;
  final GetTeacherMaterialUseCase getTeacherMaterialUseCase;
  final GetLessonTypeUseCase getLessonTypeUseCase;
  final GetTeacherPlaceUseCase getTeacherPlaceUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  List<DropDownValueModel> educationSystemList = <DropDownValueModel>[];
  List<DropDownValueModel> educationLevelList = <DropDownValueModel>[];
  List<DropDownValueModel> educationGradeList = <DropDownValueModel>[];
  void changeFilePickedBool({required bool isPicked}) {
    if (isPicked == true) {
      isFilePicked = true;
    } else if (isPicked == false) {
      isFilePicked = true;
    } else {
      isFilePicked = false;
    }
    emit(TeacherChangeFilePickedBoolSuccessState());
  }

  void changeRepeatBool() {
    isRepeated = !isRepeated;
    emit(ChangeIsCheckedBoolSuccessState());
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
      emit(GetEducationSystemErrorState());
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
      emit(GetMaterialErrorState());
    }
  }

  Future<void> getLessonType({required context}) async {
    try {
      final result = await getLessonTypeUseCase(
          GetLessonTypeParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        getLessonTypeEntity = r;
        print(getLessonTypeEntity.lessonTypeData[0].name.toString());
        emit(GetLessonTypeSuccessState());
      });
    } catch (e) {
      print(e.toString());
      emit(GetLessonTypeErrorState());
    }
  }

  Future<void> getTeacherPlace({required context}) async {
    try {
      final result = await getTeacherPlaceUseCase(
          GetTeacherPlaceParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        getTeacherPlaceEntity = r;
        print(getTeacherPlaceEntity.toString());
        emit(GetTeacherPlaceSuccessState());
      });
    } catch (e) {
      print(e.toString());
      emit(GetTeacherPlaceErrorState());
    }
  }

  Future<void> getUserData({required context}) async {
    emit(GetDataLoadingState());
    try {
      emit(GetDataLoadingState());
      final result = await getUserDataUseCase(
          UserDataParameters(token: ApiConstance.token()));
      emit(GetDataLoadingState());
      result.fold((l) {}, (r) {
        emit(GetDataLoadingState());
        userDataEntity = r;
        CacheHelper.saveDataToSharedPreferences(
            key: AppStrings.registerTypeNumber,
            value: userDataEntity.userData.typeId);
        emit(GetUserSuccessState());
      });
    } catch (e) {
      emit(GetDataErrorState());
    }
  }
}
