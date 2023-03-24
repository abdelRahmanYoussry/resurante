// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, must_be_immutable, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../../student/presentation/widgets/class_compelete_reserv_widget.dart';
import '../../../manager/TeacherHome/teacher_home_cubit.dart';
import '../../../manager/TeacherHome/teacher_home_state.dart';

class TeacherClassManagementScreen extends StatelessWidget {
  StepperType stepperType = StepperType.vertical;
  @override
  Widget build(BuildContext context) {
    var cubit = TeacherHomeCubit.get(context);
    cubit.stepIndex = 0;
    return BlocConsumer<TeacherHomeCubit, TeacherHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            mycolor: ColorManager.mainPrimaryColor4,
            isLeading: true,
            toolBarHeight: myMediaQuery(context: context).height / 8,
            title: Text(
              LocaleKeys.classManagementMainText.tr(),
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Theme(
                  data: ThemeData(
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                          primary: ColorManager.mainPrimaryColor4,
                        ),
                  ),
                  child: Stepper(
                    controlsBuilder: ((context, details) {
                      return const SizedBox();
                    }),
                    type: stepperType,
                    physics: const ScrollPhysics(),
                    currentStep: cubit.stepIndex,
                    onStepTapped: (step) => cubit.tapped(step),
                    onStepContinue: cubit.continued,
                    onStepCancel: cubit.cancel,
                    steps: [
                      Step(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: myMediaQuery(context: context).width /
                                      1.50,
                                  child: MyElevatedButton(
                                    radius: 10,
                                    textColor: ColorManager.darkGrey,
                                    height:
                                        myMediaQuery(context: context).height /
                                            10,
                                    width:
                                        myMediaQuery(context: context).width /
                                            3,
                                    borderColor: cubit.isStart == false
                                        ? ColorManager.mainPrimaryColor4
                                        : ColorManager.textFormBorderColor,
                                    onTap: cubit.isStart == false
                                        ? () {
                                            cubit.changeClassStartBool();
                                          }
                                        : null,
                                    borderWidth: 2,
                                    buttonName:
                                        LocaleKeys.startClassButtonText.tr(),
                                    buttonColor: cubit.isStart == false
                                        ? ColorManager.mainPrimaryColor4
                                        : ColorManager.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        content: Container(),
                        isActive: cubit.isStart == false ? false : true,
                        state: StepState.complete,
                      ),
                      Step(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: myMediaQuery(context: context).width /
                                      1.50,
                                  child: MyElevatedButton(
                                    radius: 10,
                                    textColor: ColorManager.darkGrey,
                                    height:
                                        myMediaQuery(context: context).height /
                                            10,
                                    width: myMediaQuery(context: context).width,
                                    borderColor: cubit.nextStep == true &&
                                            cubit.isStart == true
                                        ? ColorManager.mainPrimaryColor4
                                        : ColorManager.mainPrimaryColor4,
                                    onTap: cubit.nextStep == true &&
                                            cubit.isStart == true
                                        ? () {
                                            cubit.changeStepNextBool();
                                            navigateTo(context,
                                                routeName:
                                                    Routes.studentPayVisaRoute);
                                          }
                                        : () {
                                            if (cubit.isStart == true) {
                                              navigateTo(context,
                                                  routeName: Routes
                                                      .studentPayVisaRoute);
                                            }
                                          },
                                    borderWidth: 2,
                                    buttonName:
                                        LocaleKeys.classRegistPeopleText.tr(),
                                    buttonColor: ColorManager.mainPrimaryColor4,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        content: Container(),
                        isActive: cubit.nextStep == false ? false : true,
                        state: StepState.complete,
                      ),
                      Step(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: myMediaQuery(context: context).width /
                                      1.50,
                                  child: MyElevatedButton(
                                    radius: 10,
                                    textColor: ColorManager.darkGrey,
                                    height:
                                        myMediaQuery(context: context).height /
                                            10,
                                    width:
                                        myMediaQuery(context: context).width /
                                            3,
                                    borderColor: cubit.lastStep == false &&
                                            cubit.isStart == true
                                        ? ColorManager.mainPrimaryColor4
                                        : ColorManager.grey,
                                    onTap: cubit.lastStep == false &&
                                            cubit.isStart == true
                                        ? () {
                                            cubit.changeStepLastBool();
                                            cubit.stepIndex = 0;
                                          }
                                        : null,
                                    borderWidth: 2,
                                    buttonName:
                                        LocaleKeys.classEndButtonText.tr(),
                                    buttonColor: cubit.lastStep == false &&
                                            cubit.isStart == true
                                        ? ColorManager.mainPrimaryColor4
                                        : ColorManager.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        content: Container(),
                        isActive: cubit.lastStep == false ? false : true,
                        state: StepState.complete,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        height: 2,
                        color: ColorManager.mainPrimaryColor4,
                      ),
                      const MyCustomDividerSize10(),
                      ClassesReserveDetailsWidget(
                        classTitleString:
                            '${LocaleKeys.classtotalCountPeople.tr()} :',
                        classNoteString: '250',
                        classNoteColor: ColorManager.mainPrimaryColor4,
                      ),
                      const MyCustomDividerSize10(),
                      ClassesReserveDetailsWidget(
                        classTitleString:
                            '${LocaleKeys.classTotalMenPeople.tr()} :',
                        classNoteString: '200',
                        classNoteColor: ColorManager.mainPrimaryColor4,
                      ),
                      const MyCustomDividerSize10(),
                      ClassesReserveDetailsWidget(
                        classTitleString:
                            '${LocaleKeys.totalPriceToCoast.tr()} :',
                        classNoteString: '2000EGP',
                        classNoteColor: ColorManager.mainPrimaryColor4,
                      ),
                      const MyCustomDividerSize10(),
                      ClassesReserveDetailsWidget(
                        classTitleString:
                            '${LocaleKeys.classHaveBeenBaid.tr()} :',
                        classNoteString: '1000EGP',
                        classNoteColor: ColorManager.mainPrimaryColor4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
