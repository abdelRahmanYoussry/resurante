// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, avoid_print, use_build_context_synchronously

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:hassy/core/utils/shared/widgets/CustomDropDown.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../core/utils/shared/widgets/changeThemeMode.dart';
import '../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../core/utils/shared/widgets/loclization_widget.dart';
import '../../../../../core/utils/shared/widgets/main_view_container.dart';
import '../../../../startup/presentation/manager/startup_state.dart';
import '../../manager/auth_state.dart';

class StudentRegisterScreen extends StatelessWidget {
  StudentRegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  final SingleValueDropDownController educationSystemController =
      SingleValueDropDownController();
  final SingleValueDropDownController educationLevelController =
      SingleValueDropDownController();
  final SingleValueDropDownController educationLanguageController =
      SingleValueDropDownController();
  final SingleValueDropDownController gradeLevelController =
      SingleValueDropDownController();
  int? chooseEducationSystem;
  int? chooseEducationLevel;
  int? chooseEducationGrade;

  @override
  Widget build(BuildContext context) {
    String lang = context.locale.languageCode;
    print('$lang this is current lang');
    if (lang == context.locale.languageCode) {
      AuthCubit.get(context).getEducationSystem(context: context);
      AuthCubit.get(context).educationLevelList.clear();
      AuthCubit.get(context).educationGradeList.clear();
      print('  lang has been changed');
    }
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LocalChangedSuccessState) {
          AuthCubit.get(context).getEducationSystem(context: context);
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onPanUpdateDownDirection,
          ],
          child: Scaffold(
            body: MainViewContainer(
              position: myMediaQuery(context: context).height / 3.8,
              cardHeight: myMediaQuery(context: context).height / 3,
              appBarHeight: AppSize.size3,
              cardWidth: AppSize.size20,
              titleWidget: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: AppPadding.padding5, left: 5),
                          child: MyElevatedButton(
                            buttonName: LocaleKeys.skip.tr(),
                            buttonColor: ColorManager.mainPrimaryColor4,
                            onTap: () async {
                              navigateAndFinish(context,
                                  routeName: Routes.studentMainScreenRoute);
                            },
                            height: AppSize.size50,
                            width: AppSize.size100,
                            textColor: Colors.black,
                            borderColor: ColorManager.mainPrimaryColor4,
                            borderWidth: AppSize.size2,
                            radius: AppSize.size70,
                            fontSize: FontSize.size14,
                          ),
                        ),
                        const Spacer(),
                        LoclizationWidget(
                          context: context,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        LocaleKeys.studentMainRegisterText.tr(),
                        style: getSemiBoldStyle(
                          color: ColorManager.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              mainWidget: ConditionalBuilder(
                condition:
                    AuthCubit.get(context).educationSystemList.isNotEmpty,
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
                                  setState(() {
                                    educationLevelController.clearDropDown();
                                    gradeLevelController.clearDropDown();
                                  });
                                } else {
                                  cubit.getEducationLevel(
                                      context: context,
                                      educationSystemIdParameters: value.value);
                                  print(value.value);
                                  chooseEducationSystem = value.value;
                                }
                                educationLevelController.clearDropDown();
                                gradeLevelController.clearDropDown();
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
                              enableDropDown:
                                  cubit.educationLevelList.isNotEmpty,
                              dropDownValueList: cubit.educationLevelList,
                              controller: educationLevelController,
                              onChanged: (value) {
                                if (educationLevelController.dropDownValue ==
                                    null) {
                                  setState(() {
                                    gradeLevelController.clearDropDown();
                                  });
                                } else {
                                  print(value.value);

                                  cubit.getEducationGrade(
                                      context: context,
                                      educationLevelId: value.value);
                                  chooseEducationLevel = value.value;
                                }
                                gradeLevelController.clearDropDown();

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
                              enableDropDown:
                                  cubit.educationGradeList.isNotEmpty,
                              onChanged: (value) {
                                if (gradeLevelController.dropDownValue ==
                                    null) {
                                  gradeLevelController.clearDropDown();
                                } else {
                                  chooseEducationGrade = value.value;
                                  // debugPrint(chooseEducationGrade.toString());
                                }
                                print(value.value);
                              },
                              dropDownValueList: cubit.educationGradeList,
                              controller: gradeLevelController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LocaleKeys.educationGradeErrorText
                                      .tr();
                                } else {
                                  return null;
                                }
                              },
                              label: Text(LocaleKeys.gradeName.tr())),
                          MyElevatedButton(
                            buttonName: LocaleKeys.submiButton.tr(),
                            condition:
                                state is! StudentRegisterStep2LoadingState,
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
                                debugPrint(chooseEducationGrade.toString());
                                cubit.studentRegisterStep2(
                                    context: context,
                                    eductionGradeId: chooseEducationGrade!);
                                await cubit.getUserData(context: context);
                                navigateTo(context,
                                    routeName: Routes.studentMainScreenRoute);
                              }
                            },
                          ),
                          Row(
                            children: const [
                              ChangeThemeMode(),
                            ],
                          ),
                        ],
                      ),
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
