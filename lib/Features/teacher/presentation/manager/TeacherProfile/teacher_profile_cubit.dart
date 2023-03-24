// ignore_for_file: avoid_print, unused_local_variable, unnecessary_null_in_if_null_operators, deprecated_member_use, unrelated_type_equality_checks

import 'dart:async';
import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hassy/Features/teacher/domain/entities/get_cities_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/update_teacher_place_entity.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_area_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_cities_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_common_questions_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/update_teacher_places_use_case.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/api/api_constance.dart';
import '../../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../core/utils/usecase/base_use_case.dart';
import '../../../../authentication/domain/entities/get_material_entity.dart';
import '../../../../authentication/domain/entities/uesr_data_entity.dart';
import '../../../../authentication/domain/use_cases/CancelUploadedFileFromListUseCase.dart';
import '../../../../authentication/domain/use_cases/cancelUploadedFileUseCase.dart';
import '../../../../authentication/domain/use_cases/get_Education_system_use_case.dart';
import '../../../../authentication/domain/use_cases/get_material_use_case.dart';
import '../../../../authentication/domain/use_cases/get_user_data_use_case.dart';
import '../../../../authentication/domain/use_cases/uploadFileUseCase.dart';
import '../../../../authentication/domain/use_cases/uploadMultiFilesUseCase.dart';
import '../../../../student/domain/entities/update_user_profile_image_entity.dart';
import '../../../../student/domain/use_cases/update_user_profile_image_use_case.dart';
import '../../../domain/entities/add_complaints_entity.dart';
import '../../../domain/entities/add_place_entity.dart';
import '../../../domain/entities/get_complaints_entity.dart';
import '../../../domain/entities/get_country_entity.dart';
import '../../../domain/entities/get_privacy_policy_entity.dart';
import '../../../domain/entities/get_student_entity.dart';
import '../../../domain/entities/get_teacher_personal_data_entity.dart';
import '../../../domain/entities/get_teacher_places_entity.dart';
import '../../../domain/entities/teacher_update_basic_data_entity.dart';
import '../../../domain/entities/teacher_update_user_data_entity.dart';
import '../../../domain/use_cases/add_complaints_use_case.dart';
import '../../../domain/use_cases/add_place_use_case.dart';
import '../../../domain/use_cases/get_complaints_use_case.dart';
import '../../../domain/use_cases/get_country_use_case.dart';
import '../../../domain/use_cases/get_privacy_policy_use_case.dart';
import '../../../domain/use_cases/get_teacher_personal_data_use_case.dart';
import '../../../domain/use_cases/get_teacher_place_use_case.dart';
import '../../../domain/use_cases/teacher_update_basic_data_use_case.dart';
import '../../../domain/use_cases/teacher_update_user_data_use_case.dart';

class TeacherProfileCubit extends Cubit<TeacherProfileState> {
  TeacherProfileCubit(
    this.getTeacherPersonalDataUseCase,
    this.teacherUploadFileUseCase,
    this.teacherUploadMultiFilesUseCase,
    this.teacherCancelUploadedFileFromListUseCase,
    this.getComplaintsUseCase,
    this.addPlaceUseCase,
    this.getUserDataUseCase,
    this.getTeacherMaterialUseCase,
    this.updateUserProfileImageUseCase,
    this.teacherUpdateUserDataUseCase,
    this.updateBasicDataUseCase,
    this.teacherCancelUploadedFileUseCase,
    this.addComplaintsUseCase,
    this.getPrivacyPolicyUseCase,
    this.getEducationSystemUseCase,
    this.getTeacherPlaceUseCase,
    this.getCommonQuestionsUseCase,
    this.getCountryUseCase,
    this.getCitiesUseCase,
    this.getAreaUseCase,
    this.updateTeacherPlacesUseCase,
  ) : super(TeacherProfileInitial());
  static TeacherProfileCubit get(context) => BlocProvider.of(context);
  bool isRepeated = false;
  bool isDropDownClear = false;
  final GetTeacherPersonalDataUseCase getTeacherPersonalDataUseCase;
  final UploadFileUseCase teacherUploadFileUseCase;
  final UploadMultiFilesUseCase teacherUploadMultiFilesUseCase;
  final CancelUploadedFileFromListUseCase
      teacherCancelUploadedFileFromListUseCase;
  final AddPlaceUseCase addPlaceUseCase;
  final GetCountryUseCase getCountryUseCase;
  final GetCitiesUseCase getCitiesUseCase;
  final UpdateTeacherPlacesUseCase updateTeacherPlacesUseCase;
  final GetAreaUseCase getAreaUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  final GetTeacherMaterialUseCase getTeacherMaterialUseCase;
  final UpdateUserProfileImageUseCase updateUserProfileImageUseCase;
  final TeacherUpdateUserDataUseCase teacherUpdateUserDataUseCase;
  final UpdateUserBasicDataUseCase updateBasicDataUseCase;
  final CancelUploadedFileUseCase teacherCancelUploadedFileUseCase;
  final AddComplaintsUseCase addComplaintsUseCase;
  final GetPrivacyPolicyUseCase getPrivacyPolicyUseCase;
  final GetCommonQuestionsUseCase getCommonQuestionsUseCase;
  final GetComplaintsUseCase getComplaintsUseCase;
  final GetTeacherPlaceUseCase getTeacherPlaceUseCase;
  final GetEducationSystemUseCase getEducationSystemUseCase;
  late GetStudentEntity getStudentEntity;
  late GetCountryEntity getCountryEntity;
  late GetCitiesEntity getCitiesEntity;
  late GetCitiesEntity getAreaEntity;
  late GetTeacherPlaceEntity getTeacherPlaceEntity;
  late UpdateBasicUserDataEntity updateBasicDataEntity;
  late UserDataEntity userDataEntity;
  late TeacherMaterialEntity? teacherMaterialEntity;
  late UpdateUserProfileImageEntity updateUserProfileImageEntity;
  late AddPlaceEntity addPlaceEntity;
  late GetComplaintsEntity getComplaintsEntity;
  late AddComplaintsEntity addComplaintsEntity;
  late GetPrivacyPolicyEntity getPrivacyPolicyEntity;
  late GetPrivacyPolicyEntity getCommonQuestionsEntity;
  GetTeacherPersonalEntity? getTeacherPersonalEntity;
  late TeacherUpdateUserDataEntity teacherUpdateUserDataEntity;
  late UpdateTeacherPlacesEntity updateTeacherPlacesEntity;
  DropDownValueModel? initialAreaValueModel;
  DropDownValueModel? initialCityValueModel;
  bool isFilePicked = false;
  File? profileImageFile;
  var picker = ImagePicker();
  File? file;

  Future<void> getProfileImage() async {
    emit(TeacherUploadProfileImageLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImageFile = File(pickedFile.path);
      print(pickedFile.path.toString());
      emit(TeacherUploadProfileImageSuccessState());
    } else {
      print('No Image Selected');
      emit(TeacherUploadProfileImageErrorState());
    }
  }

  Future<void> getTeacherPersonalData() async {
    try {
      final result = await getTeacherPersonalDataUseCase(
          TeacherPersonalParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        getTeacherPersonalEntity = r;
        fillListOfPaths();
        emit(GetTeacherPersonalSuccessState());
      });
    } catch (e) {
      print(e.toString());
      emit(GetTeacherPersonalErrorState());
    }
  }

  FilePickerResult? teacherCertificationfilePath;
  File? teacherCertificationFile;
  List<File>? teacherMultiFilesList;
  FilePickerResult? teacherMultiFilesFiles;
  Position? myLocation;
  LocationPermission? permission;
  String idFile = '';
  String idPath = '';
  List<String> fileNamesList = [];
  List<String> filePathList = [];
  List<int> deletedPaths = [];

  Future<void> cancelFileFromList(int index) async {
    myTeacherMultiFilesList.removeAt(index);
    if (myTeacherMultiFilesList.isEmpty) {
      myTeacherMultiFilesList = [];
    }
    emit(TeacherCancelMultiUploadFileSuccessState());
  }

  Future<void> cancelFromApiList({required int index}) async {
    // print(getTeacherPersonalEntity!.teacherPersonalData.attachments![index].id);
    getTeacherPersonalEntity!.teacherPersonalData.attachments!.removeAt(index);
    emit(TeacherCancelApiListSuccessState());
  }

  Future<void> uploadNewFile() async {
    final file = await teacherUploadFileUseCase(const NoParameters());
    file.fold((l) {
      emit(TeacherUploadFileErrorState());
    }, (r) {
      teacherCertificationfilePath = r;
      teacherCertificationFile =
          File(teacherCertificationfilePath!.files.single.path!);
      emit(TeacherUploadFileSuccessState());
    });
  }

  List<File> myTeacherMultiFilesList = [];
  Future<void> uploadNewMultiFiles() async {
    final file = await teacherUploadMultiFilesUseCase(const NoParameters());
    file.fold((l) {
      emit(UploadTeacherFileErrorState());
    }, (r) {
      teacherMultiFilesList = r;
      emit(UploadTeacherFileSuccessState());
      String path = '';
      for (var element in teacherMultiFilesList!) {
        for (var value in fileNamesList) {
          var x = element.path.split('/').last.toString();
          if (x == value.toString()) {
            path = value;
            teacherMultiFilesList!.clear();
            showToast(
              text: LocaleKeys.fileNameAlreadyExit.tr(),
              state: ToastState.Warning,
            );
            path = '';
            return;
          }
        }
      }
      for (var value in teacherMultiFilesList!) {
        var count =
            myTeacherMultiFilesList.where((c) => c.path == value.path).length;
        if (count != 0) {
          print('${count}000000000000000000000000000000000000000000');
          return;
        } else {
          myTeacherMultiFilesList.add(value);
        }
      }
      print(myTeacherMultiFilesList);
      emit(UploadTeacherFileSuccessState());
    });

    // emit(UploadTeacherFileSuccessState());
  }

  Future<void> cancelUploadedFileFromList(int index) async {
    final cancel = await teacherCancelUploadedFileFromListUseCase(index);
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
    final file2 = await teacherCancelUploadedFileUseCase(const NoParameters());
    file2.fold((l) => {emit(CancelUploadFileErrorState())}, (r) {
      teacherCertificationfilePath = null;
      emit(CancelUploadFileSuccessState());
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
    emit(TeacherChangeFilePickedBoolSuccessState());
  }

  Future<void> getGeoLocationPosition() async {
    permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.denied:
        await Geolocator.requestPermission();
        emit(GetLocationErrorState());
        break;
      case LocationPermission.deniedForever:
        showToast(text: permission!.name.toString(), state: ToastState.Warning);
        await Geolocator.requestPermission();
        emit(GetLocationErrorState());
        break;
      case LocationPermission.whileInUse:
        emit(GetLocationLoadingState());
        myLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        emit(GetLocationSuccessState());
        break;
      case LocationPermission.always:
        emit(GetLocationLoadingState());
        myLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        emit(GetLocationSuccessState());
        break;
      case LocationPermission.unableToDetermine:
        showToast(text: permission!.name.toString(), state: ToastState.Warning);
        await Geolocator.requestPermission();
        emit(GetLocationErrorState());
        break;
      default:
    }
  }

  Future<void> teacherUpdateUserData({
    required String certificationName,
    required int certificationYear,
    required List material,
    File? idImage,
    List<File>? attachment,
    required context,
    required List<int> deleteFiles,
  }) async {
    emit(TeacherUpdateUserDataLoadingState());
    try {
      emit(TeacherUpdateUserDataLoadingState());
      final result =
          await teacherUpdateUserDataUseCase(TeacherUpdateUserDataParameters(
        token: ApiConstance.token(),
        certificateName: certificationName,
        certificateYear: certificationYear,
        attachments: attachment!,
        materials: material,
        idImage: idImage ?? null,
        deleteFiles: deleteFiles,
      ));
      result.fold((l) {
        emit(TeacherUpdateUserDataErrorState());
      }, (r) {
        emit(TeacherUpdateUserDataLoadingState());

        teacherUpdateUserDataEntity = r;
        if (teacherUpdateUserDataEntity.succeeded == false) {
          ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(myMessage: teacherUpdateUserDataEntity.message));
          emit(TeacherUpdateUserDataErrorState());
        } else if (teacherUpdateUserDataEntity.brokenRules.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(
              myMessage: teacherUpdateUserDataEntity.brokenRules.first.message,
            ),
          );
          emit(TeacherUpdateUserDataErrorState());
        } else {
          showToast(
            text: LocaleKeys.teacherFinalRegisterMessage.tr(),
            state: ToastState.Success,
          );
          Navigator.pop(context);
          emit(TeacherUpdateUserDataSuccessState());
        }
      });
    } catch (e) {
      print(e);
      emit(TeacherUpdateUserDataErrorState());
    }
  }

  Future<void> getUserData({required context}) async {
    try {
      final result = await getUserDataUseCase(
          UserDataParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        userDataEntity = r;
        CacheHelper.saveDataToSharedPreferences(
            key: AppStrings.registerTypeNumber,
            value: userDataEntity.userData.typeId);
        emit(GetUserDataSuccessState());
      });
    } catch (e) {
      emit(GetUserDataErrorState());
    }
  }

  Future<void> deleteImage({required String name}) async {
    int x = 0;
    for (var element
        in getTeacherPersonalEntity!.teacherPersonalData.attachments!) {
      if (element.path == name) {
        x = element.id!;
      }
    }
    deletedPaths.add(x);
    name = '';
    idFile = name;
    emit(CancelIdFileFromApiSuccessState());
  }

  Future<void> openPathUrl({required String name}) async {
    final uri = Uri.parse(name);
    if (await launch(uri.toString())) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      emit(OPenPathFromApiSuccessState());
    } else {
      emit(OPenPathFromApiErrorState());
    }
  }

  Future<void> fillListOfPaths() async {
    fileNamesList.clear();
    filePathList.clear();
    for (var element
        in getTeacherPersonalEntity!.teacherPersonalData.attachments!) {
      if (element.typeId == 1) {
        idPath = element.path!;
        idFile = element.name!;
        print('add id');
      }
      if (element.typeId == 2) {
        fileNamesList.add(element.name!);
        filePathList.add(element.path!);
      }
    }
  }

  Future<void> addIdsDeletion({required int index}) async {
    for (final element
        in getTeacherPersonalEntity!.teacherPersonalData.attachments!) {
      if (element.typeId == 2 &&
          element.name == fileNamesList[index].toString()) {
        deletedPaths.add(element.id!);
      }
    }
    print(fileNamesList[index]);
    emit(DeleteSuccessState());
  }

  Future<void> clearItemIndexInNamesList({required int index}) async {
    fileNamesList.removeAt(index);
    emit(DeleteItemsInNamesListSuccessState());
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
      emit(GetMaterialErrorState());
    }
  }

  Future<void> signOut({required BuildContext context}) async {
    removeValueFromShared(key: AppStrings.userToken);
    removeValueFromShared(key: AppStrings.registerTypeNumber);
    navigateAndFinish(context, routeName: Routes.loginRoute);
    emit(SignOutSuccessTeacherState());
  }

  Future<void> removeValueFromShared({required String key}) async {
    CacheHelper.removeDataFromSharedPreferences(key: key);
    var x = CacheHelper.getSharedPreferencesValue(key: key);
    emit(RemoveValueFromSharedSuccessTeacherState());
    debugPrint(x);
  }

  Future<void> teacherUpdateBasicData({
    required String name,
    required String address,
    required String email,
    required String birthDate,
    required context,
  }) async {
    emit(TeacherUpdateBasicDataLoadingState());
    try {
      emit(TeacherUpdateBasicDataLoadingState());
      final result = await updateBasicDataUseCase(UpdateUserBasicDataParameters(
        token: ApiConstance.token(),
        name: name,
        address: address,
        email: email,
        birthDate: birthDate,
      ));
      result.fold((l) {
        emit(TeacherUpdateBasicDataErrorState());
      }, (r) {
        emit(TeacherUpdateBasicDataLoadingState());

        updateBasicDataEntity = r;
        if (updateBasicDataEntity.succeeded == false) {
          ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(myMessage: updateBasicDataEntity.message));
          emit(TeacherUpdateBasicDataErrorState());
        } else if (updateBasicDataEntity.brokenRules.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(
              myMessage: updateBasicDataEntity.brokenRules.first.message,
            ),
          );
          emit(TeacherUpdateBasicDataErrorState());
        } else {
          showToast(
            text: LocaleKeys.teacherFinalRegisterMessage.tr(),
            state: ToastState.Success,
          );
          getUserData(context: context);
          Navigator.pop(context);
          emit(TeacherUpdateBasicDataSuccessState());
        }
      });
    } catch (e) {
      print(e.toString());
      emit(TeacherUpdateBasicDataErrorState());
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
        } else if (updateUserProfileImageEntity.brokenRules.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(
              myMessage: updateUserProfileImageEntity.brokenRules.first.message,
            ),
          );
        } else {
          showToast(
            text: LocaleKeys.teacherFinalRegisterMessage.tr(),
            state: ToastState.Success,
          );
          getUserData(context: context);
          emit(UpdateUserProfileImageSuccessState());
        }
      });
    } catch (e) {
      print('$e this is error');
      emit(UpdateUserProfileImageErrorState());
    }
  }

  Future<void> addPlace({
    required String name,
    required String countryName,
    required int areaId,
    required int countryId,
    required int cityId,
    required String streetName,
    required String cityName,
    String? longitude,
    String? latitude,
    required context,
  }) async {
    emit(AddPlaceLoadingState());
    try {
      emit(AddPlaceLoadingState());
      final result = await addPlaceUseCase(AddPlaceParameters(
        token: ApiConstance.token(),
        areaId: areaId,
        cityId: cityId,
        countryId: countryId,
        cityName: cityName,
        countryName: countryName,
        name: name,
        streetName: streetName,
        latitude: latitude,
        longitude: longitude,
      ));
      result.fold((l) {
        emit(AddPlaceErrorState());
      }, (r) {
        emit(AddPlaceLoadingState());

        addPlaceEntity = r;
        if (addPlaceEntity.succeeded == false) {
          ScaffoldMessenger.of(context)
              .showSnackBar(mySnackBar(myMessage: addPlaceEntity.message));
          emit(AddPlaceErrorState());
        } else if (addPlaceEntity.brokenRules.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(
              myMessage: addPlaceEntity.brokenRules.first.message,
            ),
          );
          emit(AddPlaceErrorState());
        } else {
          showToast(
            text: LocaleKeys.teacherFinalRegisterMessage.tr(),
            state: ToastState.Success,
          );
          CacheHelper.removeDataFromSharedPreferences(key: 'lon');
          CacheHelper.removeDataFromSharedPreferences(key: 'lat');
          getTeacherPlace(context: context);
          Navigator.pop(context);
          emit(AddPlaceSuccessState());
        }
      });
    } catch (e) {
      print(e.toString());
      emit(AddPlaceErrorState());
    }
  }

  Future<void> updatePlace({
    required String name,
    required String countryName,
    required int areaId,
    required int countryId,
    required int cityId,
    required String streetName,
    required String cityName,
    required int id,
    String? longitude,
    String? latitude,
    required context,
  }) async {
    emit(UpdatePlaceLoadingState());
    try {
      emit(UpdatePlaceLoadingState());
      final result = await updateTeacherPlacesUseCase(
          UpdateTeacherPlacesParameters(
              token: ApiConstance.token(),
              areaId: areaId,
              cityId: cityId,
              countryId: countryId,
              cityName: cityName,
              countryName: countryName,
              name: name,
              streetName: streetName,
              latitude: latitude,
              longitude: longitude,
              id: id));
      result.fold((l) {
        emit(UpdatePlaceErrorState());
      }, (r) {
        emit(UpdatePlaceLoadingState());

        updateTeacherPlacesEntity = r;
        if (updateTeacherPlacesEntity.succeeded == false) {
          ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(myMessage: updateTeacherPlacesEntity.message));
          emit(UpdatePlaceErrorState());
        } else if (updateTeacherPlacesEntity.brokenRules.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(
              myMessage: updateTeacherPlacesEntity.brokenRules.first.message,
            ),
          );
          emit(UpdatePlaceErrorState());
        } else {
          showToast(
            text: LocaleKeys.teacherFinalRegisterMessage.tr(),
            state: ToastState.Success,
          );
          CacheHelper.removeDataFromSharedPreferences(key: 'lon');
          CacheHelper.removeDataFromSharedPreferences(key: 'lat');
          getTeacherPlace(context: context);
          Navigator.pop(context);
          emit(UpdatePlaceSuccessState());
        }
      });
    } catch (e) {
      print(e.toString());
      emit(UpdatePlaceErrorState());
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

  int countryId = 0;
  String countryName = "";
  String cityName = "";
  Future<void> getCountry({required context}) async {
    try {
      final result = await getCountryUseCase(
          GetCountryParameters(token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        getCountryEntity = r;
        countryId = getCountryEntity.countryData[0].id!;
        countryName = getCountryEntity.countryData[0].name!;
        emit(GetCountrySuccessState());
      });
    } catch (e) {
      print(e.toString());
      emit(GetCountryErrorState());
    }
  }

  Future<void> getCities({required int myCountryId}) async {
    emit(GetCountryLoadingState());
    try {
      final result = await getCitiesUseCase(GetCitiesParameters(
          token: ApiConstance.token(), countryId: myCountryId));
      result.fold((l) {}, (r) {
        getCitiesEntity = r;
        cityList = (getCitiesEntity.locationData)
            .map(
                (e) => DropDownValueModel(name: e.name.toString(), value: e.id))
            .toList();
        for (var element in cityList) {
          if (cityId == element.value) {
            initialCityValueModel = element;
          }
        }
        emit(GetCountrySuccessState());
      });
    } catch (e) {
      print(e.toString());
      emit(GetCountryErrorState());
    }
  }

  List<DropDownValueModel> areaList = <DropDownValueModel>[];
  List<DropDownValueModel> cityList = <DropDownValueModel>[];
  Future<void> getAreas({required int cityId}) async {
    // emit(GetAreasLoadingState());
    try {
      final result = await getAreaUseCase(
          GetAreasParameters(cityId: cityId, token: ApiConstance.token()));
      result.fold((l) {}, (r) {
        areaList.clear();
        getAreaEntity = r;
        areaList = (getAreaEntity.locationData)
            .map(
                (e) => DropDownValueModel(name: e.name.toString(), value: e.id))
            .toList();
        for (var element in areaList) {
          if (areaId == element.value) {
            initialAreaValueModel = element;
          }
        }
        emit(GetAreasSuccessState());
      });
    } catch (e) {
      emit(GetAreasErrorState());
    }
  }

  String name = '';
  String country = '';
  String street = '';
  String city = '';
  String area = '';
  int areaId = 0;
  int myCountryId = 0;
  int cityId = 0;
  double? lat;
  double? lon;
  int id = 0;
  Future<void> getFullLocation({required int myCityId}) async {
    emit(GetFullDataErrorState());
    for (var place in getTeacherPlaceEntity.teacherPlacesData) {
      if (place.id == myCityId) {
        id = place.id!;
        street = place.streetName!;
        name = place.name!;
        city = place.cityName!;
        area = place.areaName!;
        areaId = place.areaId!;
        cityId = place.cityId!;
        myCountryId = place.countryId!;
        lat = double.parse(place.latitude!);
        lon = double.parse(place.longitude!);
        await getAreas(cityId: cityId);
        await getCities(myCountryId: myCountryId);
        emit(GetFullDataErrorState());
      }
    }
  }
}
