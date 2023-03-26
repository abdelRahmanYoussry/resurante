// ignore_for_file: file_names, avoid_print, must_be_immutable, deprecated_member_use, use_build_context_synchronously

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherMainClasses/teacher_classes_cubit.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherMainClasses/teacher_classes_state.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_cubit.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/app/values_manager.dart';
import 'package:hassy/core/utils/shared/app_routes/routes_manager.dart';
import 'package:hassy/core/utils/shared/translations/locale_keys.g.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_5.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/classes/number_validate.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/widgets/CustomDropDown.dart';
import '../../../../../../core/utils/shared/widgets/class_main_warnning_button.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../../../core/utils/shared/widgets/textFormfield.dart';
import '../../../manager/TeacherMainClasses/teacher_classes_cubit.dart';

class TeacherAddClassesScreen extends StatelessWidget {
  TeacherAddClassesScreen({super.key});
  final TextEditingController addressController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController lessonCountController = TextEditingController();
  final TextEditingController lessonRepeatPerDaysController =
      TextEditingController();
  final TextEditingController lessonRepeatBetweenDaysController =
      TextEditingController();
  final TextEditingController lessonRepeatController = TextEditingController();
  final SingleValueDropDownController materialController =
      SingleValueDropDownController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  late SingleValueDropDownController educationSystemController =
      SingleValueDropDownController();
  late SingleValueDropDownController educationLevelController =
      SingleValueDropDownController();
  late SingleValueDropDownController educationLanguageController =
      SingleValueDropDownController();
  late SingleValueDropDownController gradeLevelController =
      SingleValueDropDownController();
  late SingleValueDropDownController lessonTypeController =
      SingleValueDropDownController();
  late SingleValueDropDownController repeatTypeController =
      SingleValueDropDownController();
  late SingleValueDropDownController classPlaceController =
      SingleValueDropDownController();
  int? chooseEducationSystem;
  int? chooseEducationLevel;
  int? chooseEducationGrade;
  int? chooseLessonType;
  int? materialId;
  int? addressId;
  String? countryName;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = TeacherClassesCubit.get(context);
    cubit.isFilePicked == false;
    cubit.educationLevelList.clear();
    cubit.educationGradeList.clear();
    return BlocConsumer<TeacherClassesCubit, TeacherClassesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onPanUpdateDownDirection,
          ],
          child: Scaffold(
            appBar: CustomAppBar(
              title: Text(
                LocaleKeys.addLessonTitle.tr(),
                style: const TextStyle(color: Colors.white),
              ),
              mycolor: ColorManager.mainPrimaryColor4,
              toolBarHeight: myMediaQuery(context: context).height / 10,
              isLeading: true,
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.padding15),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cubit.getTeacherPlaceEntity.teacherPlacesData.isEmpty
                          ? Column(
                              children: [
                                ClassMainWarningButtonWidget(
                                  buttonText:
                                      LocaleKeys.addLocationWarning.tr(),
                                  onTap: () async {
                                    await TeacherProfileCubit.get(context)
                                        .getCountry(context: context);
                                    await TeacherProfileCubit.get(context)
                                        .getCities(
                                            myCountryId:
                                                TeacherProfileCubit.get(context)
                                                    .getCountryEntity
                                                    .countryData[0]
                                                    .id!
                                                    .toInt());
                                    navigateTo(
                                      context,
                                      routeName: Routes.teacherAddLocationRoute,
                                    );
                                  },
                                ),
                                const MyCustomDividerSize5(),
                              ],
                            )
                          : const SizedBox(),
                      MyTextFormField(
                        readOnly: false,
                        control: noteController,
                        isAutoValid: AutovalidateMode.onUserInteraction,
                        type: TextInputType.name,
                        isPassword: false,
                        hint: LocaleKeys.lessonTitleMainTextAndLabel.tr(),
                        label: LocaleKeys.lessonTitleMainTextAndLabel.tr(),
                        prefix: Icon(
                          FontAwesomeIcons.noteSticky,
                          color: Theme.of(context).textTheme.subtitle1!.color,
                        ),
                        onTap: () {},
                        onSubmit: () {},
                        validator: (value) {
                          if (value.isEmpty) {
                            return LocaleKeys.lessonTitleErrorText.tr();
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      const MyCustomDividerSize5(),
                      MyTextFormField(
                        readOnly: false,
                        control: noteController,
                        isAutoValid: AutovalidateMode.onUserInteraction,
                        type: TextInputType.name,
                        isPassword: false,
                        hint: LocaleKeys.noteAddressAndHintLabel.tr(),
                        label: LocaleKeys.noteAddressAndHintLabel.tr(),
                        prefix: Icon(
                          FontAwesomeIcons.noteSticky,
                          color: Theme.of(context).textTheme.subtitle1!.color,
                        ),
                        onTap: () {},
                        onSubmit: () {},
                        validator: (value) {
                          if (value.isEmpty) {
                            return LocaleKeys.lessonDetailsErrorText.tr();
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      const MyCustomDividerSize5(),
                      MyCustomDropDown(
                          isAutoValid: AutovalidateMode.onUserInteraction,
                          enableSearch: true,
                          enableDropDown: true,
                          dropDownValueList: cubit
                              .getTeacherPlaceEntity.teacherPlacesData
                              .map((e) {
                            return DropDownValueModel(
                                name: e.name.toString(), value: e.id);
                          }).toList(),
                          controller: classPlaceController,
                          onChanged: (value) {
                            if (classPlaceController.dropDownValue != null) {
                              addressId = value.value;
                            } else {
                              addressId = 0;
                            }
                            print(addressId);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.addressisEmpty.tr();
                            } else {
                              return null;
                            }
                          },
                          label: Text(LocaleKeys.userAddress.tr())),
                      const MyCustomDividerSize5(),
                      MyTextFormField(
                        readOnly: true,
                        control: dateController,
                        isAutoValid: AutovalidateMode.onUserInteraction,
                        type: TextInputType.name,
                        isPassword: false,
                        hint: LocaleKeys.lessonDateHintAndLabelText.tr(),
                        prefix: Icon(
                          FontAwesomeIcons.calendarCheck,
                          color: Theme.of(context).textTheme.subtitle1!.color,
                        ),
                        onTap: () async {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(21160))
                              .then((value) {
                            dateController.text =
                                DateFormat.yMd().format(value!);
                          }).catchError((error) {});
                        },
                        onSubmit: () {},
                        validator: (value) {
                          if (value.isEmpty) {
                            return LocaleKeys.lessonDateErrorText.tr();
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      const MyCustomDividerSize5(),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              LocaleKeys.startTime.tr(),
                              style: getBoldStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color!),
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(LocaleKeys.endTime.tr(),
                                    style: getBoldStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!))),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyTextFormField(
                              readOnly: true,
                              hint: LocaleKeys.classTimeFromTimeText.tr(),
                              suffix: Icons.timer_outlined,
                              control: startTimeController,
                              isAutoValid: AutovalidateMode.onUserInteraction,
                              type: TextInputType.number,
                              isPassword: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return LocaleKeys.fieldReq.tr();
                                }
                                return null;
                              },
                              onTap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                  startTimeController.text =
                                      value!.format(context).toString();
                                }).catchError((error) {});
                              },
                              suffixClicked: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                  startTimeController.text =
                                      value!.format(context).toString();
                                }).catchError((error) {});
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: MyTextFormField(
                              readOnly: true,
                              hint: LocaleKeys.classTimeToTimeText.tr(),
                              suffix: Icons.timer_outlined,
                              control: endTimeController,
                              type: TextInputType.number,
                              isAutoValid: AutovalidateMode.onUserInteraction,
                              isPassword: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return LocaleKeys.fieldReq.tr();
                                }
                                return null;
                              },
                              onTap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                  endTimeController.text =
                                      value!.format(context).toString();
                                }).catchError((error) {});
                              },
                              suffixClicked: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                  endTimeController.text =
                                      value!.format(context).toString();
                                }).catchError((error) {});
                              },
                            ),
                          ),
                        ],
                      ),
                      const MyCustomDividerSize5(),
                      MyCustomDropDown(
                          isAutoValid: AutovalidateMode.onUserInteraction,
                          enableSearch: false,
                          enableDropDown: true,
                          onChanged: (value) async {
                            if (educationSystemController.dropDownValue ==
                                null) {
                              print(educationSystemController.dropDownValue);
                              educationSystemController.clearDropDown();
                              // educationLevelController.dispose();
                              educationLevelController.clearDropDown();
                              gradeLevelController.clearDropDown();
                              cubit.changeFilePickedBool(
                                isPicked: cubit.isFilePicked,
                              );
                            } else {
                              cubit.getEducationLevel(
                                  context: context,
                                  educationSystemIdParameters: value.value);
                              print(value.value);
                              chooseEducationSystem = value.value;
                              cubit.isFilePicked = false;
                            }
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
                      const MyCustomDividerSize5(),
                      MyCustomDropDown(
                          isAutoValid: AutovalidateMode.onUserInteraction,
                          enableSearch: false,
                          enableDropDown: cubit.educationLevelList.isNotEmpty &&
                              cubit.isFilePicked == false,
                          dropDownValueList: cubit.educationLevelList,
                          controller: educationLevelController,
                          onChanged: (value) {
                            if (educationLevelController.dropDownValue ==
                                null) {
                              gradeLevelController.clearDropDown();
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
                      const MyCustomDividerSize5(),
                      MyCustomDropDown(
                          isAutoValid: AutovalidateMode.onUserInteraction,
                          enableSearch: false,
                          enableDropDown: cubit.educationGradeList.isNotEmpty &&
                              cubit.isFilePicked == false,
                          onChanged: (value) {
                            if (gradeLevelController.dropDownValue == null) {
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
                              return LocaleKeys.educationGradeErrorText.tr();
                            } else {
                              return null;
                            }
                          },
                          label: Text(LocaleKeys.gradeName.tr())),
                      const MyCustomDividerSize5(),
                      MyCustomDropDown(
                          isAutoValid: AutovalidateMode.onUserInteraction,
                          enableSearch: false,
                          enableDropDown: true,
                          dropDownValueList:
                              cubit.teacherMaterialEntity!.materials.map((e) {
                            return DropDownValueModel(
                              name: e.materialName.toString(),
                              value: e.id,
                            );
                          }).toList(),
                          controller: materialController,
                          onChanged: (value) {
                            materialId = value.value;
                            print(materialId);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.educationMaterialError.tr();
                            }
                            return null;
                          },
                          label: Text(LocaleKeys.materialName.tr())),
                      const MyCustomDividerSize5(),
                      MyTextFormField(
                        readOnly: false,
                        control: priceController,
                        isAutoValid: AutovalidateMode.onUserInteraction,
                        type: TextInputType.number,
                        isPassword: false,
                        hint: LocaleKeys.lessonPriceHintAndLabelText.tr(),
                        label: LocaleKeys.lessonPriceHintAndLabelText.tr(),
                        prefix: Icon(
                          FontAwesomeIcons.coins,
                          color: Theme.of(context).textTheme.subtitle1!.color,
                        ),
                        onTap: () {},
                        onSubmit: () {},
                        validator: (value) {
                          if (value.isEmpty) {
                            return LocaleKeys.lessonPriceErrorText.tr();
                          }
                          if (value.isNotEmpty) {
                            return validateNumber(value);
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      const MyCustomDividerSize5(),
                      MyTextFormField(
                        readOnly: false,
                        control: lessonCountController,
                        isAutoValid: AutovalidateMode.onUserInteraction,
                        type: TextInputType.number,
                        isPassword: false,
                        hint: LocaleKeys.lessonCountHintAndLabelText.tr(),
                        label: LocaleKeys.lessonCountHintAndLabelText.tr(),
                        prefix: Icon(
                          FontAwesomeIcons.peopleGroup,
                          color: Theme.of(context).textTheme.subtitle1!.color,
                        ),
                        onTap: () {},
                        onSubmit: () {},
                        validator: (value) {
                          if (value.isEmpty) {
                            return LocaleKeys.lessonMaximumCountErrorText.tr();
                          }
                          if (value.isNotEmpty) {
                            return validateNumber(value);
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      const MyCustomDividerSize5(),
                      MyCustomDropDown(
                        isAutoValid: AutovalidateMode.onUserInteraction,
                        enableSearch: false,
                        enableDropDown: true,
                        dropDownValueList:
                            cubit.getLessonTypeEntity.lessonTypeData.map((e) {
                          return DropDownValueModel(
                            name: e.name.toString(),
                            value: e.id,
                          );
                        }).toList(),
                        controller: lessonTypeController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.lessonTypeErrorText.tr();
                          } else {
                            return null;
                          }
                        },
                        label: Text(LocaleKeys.lessonTypeHintAndLabelText.tr()),
                        onChanged: (value) {
                          chooseLessonType = value.value;
                          print(chooseLessonType);
                        },
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              LocaleKeys.repetitionHintAndLabelText.tr(),
                              style: getBoldStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color!),
                            ),
                          ),
                          const Spacer(),
                          Checkbox(
                            activeColor: ColorManager.mainPrimaryColor4,
                            value: cubit.isRepeated,
                            onChanged: (value) {
                              cubit.changeRepeatBool();
                            },
                          ),
                        ],
                      ),
                      cubit.isRepeated
                          ? Column(
                              children: [
                                MyTextFormField(
                                  readOnly: false,
                                  control: lessonRepeatPerDaysController,
                                  isAutoValid:
                                      AutovalidateMode.onUserInteraction,
                                  type: TextInputType.number,
                                  isPassword: false,
                                  hint: LocaleKeys.lessonRepeatPerDays.tr(),
                                  label: LocaleKeys.lessonRepeatPerDays.tr(),
                                  prefix: Icon(
                                    FontAwesomeIcons.repeat,
                                    color: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .color,
                                  ),
                                  onTap: () {},
                                  onSubmit: () {},
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return LocaleKeys.fieldReq.tr();
                                    }
                                    if (value.isNotEmpty) {
                                      return validateNumber(value);
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                ),
                                const MyCustomDividerSize5(),
                                MyTextFormField(
                                  readOnly: false,
                                  control: lessonRepeatBetweenDaysController,
                                  isAutoValid:
                                      AutovalidateMode.onUserInteraction,
                                  type: TextInputType.number,
                                  isPassword: false,
                                  hint: LocaleKeys.lessonBetweenDays.tr(),
                                  label: LocaleKeys.lessonBetweenDays.tr(),
                                  prefix: Icon(
                                    FontAwesomeIcons.repeat,
                                    color: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .color,
                                  ),
                                  onTap: () {},
                                  onSubmit: () {},
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return LocaleKeys.fieldReq.tr();
                                    }
                                    if (value.isNotEmpty) {
                                      return validateNumber(value);
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                ),
                              ],
                            )
                          : Container(),
                      const MyCustomDividerSize10(),
                      MyElevatedButton(
                        height: AppSize.size50,
                        width: double.infinity,
                        borderWidth: AppSize.size2,
                        radius: AppSize.size10,
                        fontSize: FontSize.size18,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            debugPrint('ali');
                          }
                        },
                        buttonName: LocaleKeys.submiButton.tr(),
                        borderColor: ColorManager.mainPrimaryColor4,
                        buttonColor: ColorManager.mainPrimaryColor4,
                      ),
                    ],
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
