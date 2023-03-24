// ignore_for_file: must_be_immutable, unused_local_variable, deprecated_member_use, avoid_print, prefer_is_empty, unused_import, use_build_context_synchronously

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/student/presentation/manager/student_profile_cubit/student_profile_cubit.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../../core/utils/shared/widgets/CustomDropDown.dart';
import '../../../../../../../core/utils/shared/widgets/changeThemeMode.dart';
import '../../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../../../core/utils/shared/widgets/main_view_container.dart';
import '../../../../../../../core/utils/shared/widgets/textFormfield.dart';
import '../../../../../../authentication/presentation/manager/auth_cubit.dart';

class StudentUpdateProfileStepTwo extends StatelessWidget {
  StudentUpdateProfileStepTwo({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  final SingleValueDropDownController educationSystemController =
      SingleValueDropDownController();
  final SingleValueDropDownController educationLevelController =
      SingleValueDropDownController();
  final SingleValueDropDownController educationLanguageController =
      SingleValueDropDownController();
  final SingleValueDropDownController educationGradeLevelController =
      SingleValueDropDownController();
  int? chooseEducationSystem;
  int? chooseEducationLevel;
  int? chooseEducationGrade;
  @override
  Widget build(BuildContext context) {
    var cubit = StudentProfileCubit.get(context);
    // var authCubit = AuthCubit.get(context);
    String lang = context.locale.languageCode;
    print('$lang this is current lang');
    if (lang == context.locale.languageCode) {
      cubit.getEducationSystem(context: context);
      print('  lang has been changed');
    }

    educationSystemController.dropDownValue =
        cubit.initialEducationSystemValueModel;
    educationLevelController.dropDownValue =
        cubit.initialEducationLevelValueModel;
    educationGradeLevelController.dropDownValue =
        cubit.initialEducationGradeValueModel;
    return BlocConsumer<StudentProfileCubit, StudentProfileState>(
      listener: (context, state) async {
        if (state is UpdateStudentDataSuccessState) {
          await cubit.getStudentPersonalData();
          await cubit.getEducationSystem(context: context);
          await cubit.getEducationLevel(
              educationSystemIdParameters: cubit.eductionSystemId,
              context: context);
          await cubit.getEducationGrade(
              educationLevelId: cubit.eductionLevelId, context: context);
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
              condition:
                  // cubit.educationSystemList.isNotEmpty ||
                  state is! UpdateStudentDataLoadingState,
              fallback: (context) => Center(
                child: CircularProgressIndicator(
                    color: ColorManager.mainPrimaryColor4),
              ),
              builder: (context) => Padding(
                padding: const EdgeInsets.all(AppPadding.padding20),
                child: Form(
                  key: formKey,
                  child: StatefulBuilder(
                    builder: (ctx, setState) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyCustomDropDown(
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            enableSearch: false,
                            enableDropDown: true,
                            onChanged: (value) async {
                              if (educationSystemController.dropDownValue ==
                                  null) {
                                print('clear Education');
                                setState(() {
                                  educationLevelController.clearDropDown();
                                  educationGradeLevelController.clearDropDown();
                                });
                              } else {
                                cubit.getEducationLevel(
                                    context: context,
                                    educationSystemIdParameters: value.value);
                                chooseEducationSystem = value.value;
                              }

                              educationLevelController.clearDropDown();
                              educationGradeLevelController.clearDropDown();
                            },
                            dropDownValueList: cubit.educationSystemList,
                            controller: educationSystemController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.educationSystem.tr();
                              } else {
                                return null;
                              }
                            },
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(LocaleKeys.educationSystem.tr()),
                            )),
                        MyCustomDropDown(
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            enableSearch: false,
                            enableDropDown: true,
                            dropDownValueList: cubit.educationLevelList,
                            controller: educationLevelController,
                            onChanged: (value) {
                              if (educationLevelController.dropDownValue ==
                                  null) {
                                setState(() {
                                  educationGradeLevelController.clearDropDown();
                                });
                              } else {
                                cubit.getEducationGrade(
                                    context: context,
                                    educationLevelId: value.value);
                                chooseEducationLevel = value.value;
                              }
                              educationGradeLevelController.clearDropDown();

                              // debugPrint(chooseEducationLevel.toString());
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.educationLevelError.tr();
                              } else {
                                return null;
                              }
                            },
                            label: Text(LocaleKeys.educationLevel.tr())),
                        MyCustomDropDown(
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            enableSearch: false,
                            enableDropDown: true,
                            onChanged: (value) {
                              if (educationGradeLevelController.dropDownValue ==
                                  null) {
                                educationGradeLevelController.clearDropDown();
                              } else {
                                chooseEducationGrade = value.value;
                                debugPrint(chooseEducationGrade.toString());
                              }
                            },
                            dropDownValueList: cubit.educationGradeList,
                            controller: educationGradeLevelController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.educationGradeErrorText.tr();
                              } else {
                                return null;
                              }
                            },
                            label: Text(LocaleKeys.gradeName.tr())),
                        MyElevatedButton(
                          buttonName: LocaleKeys.submiButton.tr(),
                          condition: state is! UpdateStudentDataLoadingState,
                          height: AppSize.size50,
                          width: AppSize.size300,
                          textColor: ColorManager.white,
                          borderColor: ColorManager.transparentColor,
                          borderWidth: AppSize.size_0,
                          fontSize: FontSize.size14,
                          radius: AppSize.size10,
                          buttonColor: ColorManager.mainPrimaryColor4,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              if (chooseEducationGrade != null) {
                                await cubit.updateStudentData(
                                    eductionGradeId: chooseEducationGrade!,
                                    context: context);

                                // await cubit.getStudentPersonalData();
                              } else {
                                // print('the same');
                                cubit.updateStudentData(
                                    eductionGradeId: cubit.eductionGradeId,
                                    context: context);
                                // educationSystemController.dropDownValue =
                                //     cubit.initialEducationSystemValueModel;
                                // educationLevelController.dropDownValue =
                                //     cubit.initialEducationLevelValueModel;
                                // educationGradeLevelController.dropDownValue =
                                //     cubit.initialEducationGradeValueModel;
                              }

                              // navigateTo(context,
                              //     routeName: Routes.studentProfileRoute);
                              // authCubit.studentRegisterStep2(
                              //     context: context,
                              //     eductionGradeId: chooseEducationGrade!);
                              // navigateTo(context,
                              //     routeName: Routes.studentMainScreenRoute);
                            }
                          },
                        ),
                        // Row(
                        //   children: const [
                        //     ChangeThemeMode(),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
