// ignore_for_file: must_be_immutable, unused_local_variable, deprecated_member_use, avoid_print, prefer_is_empty, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, unnecessary_null_comparison, iterable_contains_unrelated_type, unused_import, unnecessary_null_in_if_null_operators, unrelated_type_equality_checks, await_only_futures

import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_cubit.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_state.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../../../core/utils/shared/classes/year_validate.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/dropDownMultiSelect.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../../../core/utils/shared/widgets/textFormfield.dart';

class TeacherUpdateProfileStepTwo extends StatelessWidget {
  TeacherUpdateProfileStepTwo({Key? key}) : super(key: key);
  bool isFileEmpty = false;
  final TextEditingController materialController = TextEditingController();
  final TextEditingController certificationName = TextEditingController();
  final TextEditingController certificationYear = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final MultiValueDropDownController multiValueDropDownController =
      MultiValueDropDownController();
  List<int> idsList = [];

  @override
  Widget build(BuildContext context) {
    var myLanguage =
        CacheHelper.getSharedPreferencesValue(key: AppStrings.localCode);
    myLanguage ??= 'en';
    print(myLanguage);
    List<DropDownValueModel> model = [];
    var cubit = TeacherProfileCubit.get(context);
    if (cubit.getTeacherPersonalEntity != null) {
      certificationName.text = cubit.getTeacherPersonalEntity!
          .teacherPersonalData.qualificationCertificateName
          .toString();
      certificationYear.text = cubit
          .getTeacherPersonalEntity!.teacherPersonalData.qualificationYear
          .toString();
      idsList.clear();
      for (var element
          in cubit.getTeacherPersonalEntity!.teacherPersonalData.materials!) {
        model.add(DropDownValueModel(
            name: element.name.toString(), value: element.id));
        idsList.add(element.id!);
        multiValueDropDownController.dropDownValueList = model;
      }
    }
    return BlocConsumer<TeacherProfileCubit, TeacherProfileState>(
      listener: (context, state) {
        if (state is TeacherUpdateUserDataSuccessState) {
          cubit.myTeacherMultiFilesList = [];
          cubit.fileNamesList.clear();
          cubit.deletedPaths.clear();
          cubit.isFilePicked = false;
          cubit.teacherCertificationfilePath = null;
        }
      },
      builder: (context, state) {
        return KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onPanUpdateDownDirection,
          ],
          child: Scaffold(
            body: ConditionalBuilder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            MyTextFormField(
                              readOnly: false,
                              control: certificationName,
                              isAutoValid: AutovalidateMode.onUserInteraction,
                              type: TextInputType.name,
                              isPassword: false,
                              hint: LocaleKeys.certificationLabelAndHint.tr(),
                              label: LocaleKeys.certificationLabelAndHint.tr(),
                              prefix: Icon(
                                Icons.history_edu_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .color,
                              ),
                              onTap: () {},
                              onSubmit: () {},
                              validator: (value) {
                                if (value.isEmpty) {
                                  return LocaleKeys.certificationNameErrorText
                                      .tr();
                                }
                                return null;
                              },
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MyTextFormField(
                              readOnly: false,
                              control: certificationYear,
                              isAutoValid: AutovalidateMode.onUserInteraction,
                              type: TextInputType.number,
                              isPassword: false,
                              hint: LocaleKeys.certificationYear.tr(),
                              label: LocaleKeys.certificationYear.tr(),
                              prefix: Icon(
                                Icons.date_range_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .color,
                              ),
                              onTap: () {},
                              onSubmit: () {},
                              validator: (value) {
                                if (value.isNotEmpty) {
                                  if (value.length > 4) {
                                    return LocaleKeys.yearMaxLength.tr();
                                  } else {
                                    return validateYear(value);
                                  }
                                }
                                return null;
                              },
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.uploadYourIdErrorText.tr(),
                                  style: getBoldStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color!),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Stack(
                              children: [
                                MyElevatedButton(
                                  height:
                                      myMediaQuery(context: context).height /
                                          18,
                                  width: double.infinity,
                                  borderWidth: AppSize.size2,
                                  radius: AppSize.size10,
                                  fontSize: AppSize.size18,
                                  onTap: () async {
                                    await cubit.uploadNewFile();
                                    cubit.deleteImage(name: cubit.idFile);
                                  },
                                  buttonName: LocaleKeys.uploadId.tr(),
                                  borderColor: ColorManager.mainPrimaryColor4,
                                  buttonColor: ColorManager.mainPrimaryColor4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.upload_file_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            cubit.isFilePicked &&
                                    cubit.teacherCertificationfilePath ==
                                        null &&
                                    cubit.idFile == ''
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LocaleKeys.uploadYourIdErrorText.tr(),
                                          style: TextStyle(
                                              color: ColorManager.error,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            cubit.idFile == '' &&
                                    cubit.teacherCertificationfilePath == null
                                ? const SizedBox()
                                : cubit.teacherCertificationfilePath == null
                                    ? Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Container(
                                            height:
                                                myMediaQuery(context: context)
                                                        .height /
                                                    20,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: ColorManager
                                                    .mainPrimaryColor3,
                                              ),
                                              color: ColorManager
                                                  .mainPrimaryColor3,
                                              borderRadius:
                                                  const BorderRadius.horizontal(
                                                right: Radius.circular(
                                                    AppSize.size20),
                                                left: Radius.circular(
                                                  AppSize.size20,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                cubit.idFile
                                                    .substring(
                                                      cubit.idFile.length - 15,
                                                    )
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .color,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              await cubit.deleteImage(
                                                  name:
                                                      cubit.idFile.toString());
                                            },
                                            icon: Icon(
                                              Icons.cancel,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                myLanguage == 'en'
                                                    ? MainAxisAlignment.end
                                                    : MainAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  await cubit.openPathUrl(
                                                      name: cubit.idPath);
                                                },
                                                icon: Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Container(
                                            height:
                                                myMediaQuery(context: context)
                                                        .height /
                                                    20,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: ColorManager.darkGrey,
                                              ),
                                              color: ColorManager.grey1,
                                              borderRadius:
                                                  const BorderRadius.horizontal(
                                                right: Radius.circular(
                                                    AppSize.size20),
                                                left: Radius.circular(
                                                  AppSize.size20,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                cubit
                                                    .teacherCertificationfilePath!
                                                    .names
                                                    .single
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .color,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              await cubit.cancelUploadedFile();
                                            },
                                            icon: Icon(
                                              Icons.cancel,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                          ),
                                        ],
                                      ),
                            const MyCustomDividerSize10(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.uploadCertificationLabel.tr(),
                                  style: getBoldStyle(
                                    // fontSize: 8,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color!,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Stack(
                              children: [
                                MyElevatedButton(
                                  height:
                                      myMediaQuery(context: context).height /
                                          18,
                                  width: double.infinity,
                                  borderWidth: AppSize.size2,
                                  radius: AppSize.size10,
                                  fontSize: AppSize.size18,
                                  onTap: () async {
                                    await cubit.uploadNewMultiFiles();
                                  },
                                  buttonName:
                                      LocaleKeys.uploadCertifications.tr(),
                                  borderColor: ColorManager.mainPrimaryColor4,
                                  buttonColor: ColorManager.mainPrimaryColor4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.upload_file_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            cubit.isFilePicked &&
                                    cubit.myTeacherMultiFilesList.length == 0 &&
                                    cubit.fileNamesList.length == 0
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LocaleKeys
                                              .selectCertificationErrorText
                                              .tr(),
                                          style: TextStyle(
                                            color: ColorManager.error,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Container(
                                      height: myMediaQuery(context: context)
                                              .height /
                                          20,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorManager.mainPrimaryColor3,
                                        ),
                                        color: ColorManager.mainPrimaryColor3,
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                          right: Radius.circular(
                                            AppSize.size20,
                                          ),
                                          left: Radius.circular(
                                            AppSize.size20,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 35.0, right: 40.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            cubit.fileNamesList[index],
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .color,
                                              fontSize: 12,
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        print(cubit.fileNamesList[index]);
                                        await cubit.addIdsDeletion(
                                            index: index);
                                        await cubit.clearItemIndexInNamesList(
                                            index: index);
                                        // await cubit.cancelFromApiList(
                                        //     index: index);

                                        print(cubit.deletedPaths);
                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: myLanguage == 'en'
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            await cubit.openPathUrl(
                                                name:
                                                    cubit.filePathList[index]);
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                              itemCount: cubit.fileNamesList.length,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                            ),
                            ConditionalBuilder(
                                condition:
                                    cubit.myTeacherMultiFilesList != null,
                                builder: (context) {
                                  return GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.only(
                                      top: AppPadding.padding5,
                                      bottom: AppPadding.padding5,
                                      right: 1,
                                    ),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 4,
                                      mainAxisExtent: 50,
                                      crossAxisSpacing: 10,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        cubit.myTeacherMultiFilesList.length,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Container(
                                            height:
                                                myMediaQuery(context: context)
                                                        .height /
                                                    20,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: ColorManager.darkGrey,
                                              ),
                                              color: ColorManager.grey1,
                                              borderRadius:
                                                  const BorderRadius.horizontal(
                                                right: Radius.circular(
                                                  AppSize.size20,
                                                ),
                                                left: Radius.circular(
                                                  AppSize.size20,
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 40.0, right: 0.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  cubit
                                                      .myTeacherMultiFilesList[
                                                          index]
                                                      .path
                                                      .split('/')[7]
                                                      .split('/')[0],
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .color,
                                                    fontSize: 12,
                                                  ),
                                                  maxLines: 1,
                                                  textAlign: TextAlign.right,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              await cubit.cancelFileFromList(
                                                index,
                                              );
                                            },
                                            icon: Icon(
                                              Icons.cancel,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                fallback: (context) => Container()),
                            const MyCustomDividerSize10(),
                            DropDownMultiSelect(
                              list: cubit.teacherMaterialEntity!.materials.map(
                                (e) {
                                  return DropDownValueModel(
                                    name: e.materialName.toString(),
                                    value: e.id,
                                  );
                                },
                              ).toList(),
                              multiValueDropDownController:
                                  multiValueDropDownController,
                              onChanged: (value) {
                                idsList.clear();
                                value.forEach((newValue) {
                                  idsList.add(newValue.value);
                                });
                                print(idsList.toString());
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LocaleKeys.selectMaterialErrorText
                                      .tr();
                                }
                                return null;
                              },
                              label: Text(LocaleKeys.educationMaterial.tr()),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyElevatedButton(
                              height:
                                  myMediaQuery(context: context).height / 15,
                              width: double.infinity,
                              borderWidth: AppSize.size2,
                              radius: AppSize.size10,
                              fontSize: AppSize.size18,
                              condition:
                                  state is! TeacherUpdateUserDataLoadingState,
                              onTap: cubit.fileNamesList.length != 0 &&
                                          cubit.idFile != '' &&
                                          cubit.teacherCertificationfilePath !=
                                              null ||
                                      cubit.myTeacherMultiFilesList.length !=
                                              0 &&
                                          cubit.teacherCertificationfilePath ==
                                              null &&
                                          cubit.idFile != '' ||
                                      cubit.fileNamesList.length != 0 &&
                                          cubit.idFile != '' ||
                                      cubit.myTeacherMultiFilesList.length ==
                                              0 &&
                                          cubit.teacherCertificationfilePath !=
                                              null &&
                                          cubit.idFile == '' ||
                                      cubit.teacherCertificationfilePath !=
                                              null &&
                                          cubit.myTeacherMultiFilesList
                                                  .length !=
                                              0
                                  ? () async {
                                      if (formKey.currentState!.validate()) {
                                        print(cubit
                                            .myTeacherMultiFilesList.length);
                                        print(cubit.fileNamesList.length);
                                        print(cubit.teacherCertificationfilePath
                                            .toString());
                                        print(cubit.idFile.toString());
                                        print(cubit.deletedPaths.toString());
                                        print(cubit.fileNamesList.length);
                                        await cubit.teacherUpdateUserData(
                                          context: context,
                                          certificationName:
                                              certificationName.text.toString(),
                                          certificationYear: int.parse(
                                              certificationYear.text
                                                  .toString()),
                                          material: idsList,
                                          attachment:
                                              cubit.myTeacherMultiFilesList,
                                          idImage:
                                              cubit.teacherCertificationFile ??
                                                  null,
                                          deleteFiles: cubit.deletedPaths,
                                        );
                                      }
                                    }
                                  : () {
                                      cubit.changeFilePickedBool(
                                        isPicked: cubit.isFilePicked,
                                      );
                                      print('c');
                                      print(cubit.myTeacherMultiFilesList);
                                      print(cubit.fileNamesList.length);
                                      print(cubit.teacherCertificationfilePath
                                          .toString());
                                      print(cubit.idFile.toString());
                                      print(cubit.deletedPaths.toString());
                                    },
                              buttonName: LocaleKeys.submiButton.tr(),
                              borderColor: ColorManager.mainPrimaryColor4,
                              buttonColor: ColorManager.mainPrimaryColor4,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              condition: cubit.getTeacherPersonalEntity != null,
              fallback: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
