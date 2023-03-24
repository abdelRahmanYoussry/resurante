// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, must_be_immutable, deprecated_member_use

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassy/Features/startup/presentation/manager/startup_cubit.dart';
import 'package:hassy/Features/student/presentation/manager/student_profile_cubit/student_profile_cubit.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:hassy/core/utils/shared/widgets/elevatedButton.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_10.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
import '../../../../../../core/utils/shared/widgets/textFormfield.dart';

// rateNumber: teachersList[index]['rateNumber'],

class StudentAddClassScreen extends StatelessWidget {
  StudentAddClassScreen({Key? key}) : super(key: key);
  List teacherNameList = ['AbdelRahman', 'Ali', 'Mohy', 'Hamdi', 'All'];
  List subjectsNameList = [
    'Arabic',
    'Math',
    'Science',
    'Social',
    'English',
    'French',
    'Germany',
    'Italy',
    'Chemistry',
    'Physics',
  ];
  List lessonType = [
    'Review lesson',
    'Oral lesson',
    'Exam',
    'Editorial Lesson',
    'All'
  ];

  bool isRepeated = false;
  final TextEditingController dateController = TextEditingController();
  final TextEditingController teacherNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController materialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var onBoardingCubit = OnBoardingCubit.get(context);
    var cubit = StudentProfileCubit.get(context);
    return BlocConsumer<StudentProfileCubit, StudentProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return KeyboardDismisser(
          child: Scaffold(
            appBar: CustomAppBar(
              mycolor: ColorManager.mainPrimaryColor2,
              title: Text(
                LocaleKeys.classesReservation.tr(),
                style: TextStyle(color: Colors.white),
              ),
              isLeading: true,
              toolBarHeight: myMediaQuery(context: context).height / 14,
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextFormField(
                        readOnly: false,
                        prefix: Icon(
                          FontAwesomeIcons.idCard,
                          color: ColorManager.mainPrimaryColor4,
                        ),
                        control: teacherNameController,
                        type: TextInputType.name,
                        label: LocaleKeys.teachersName.tr(),
                        isPassword: false,
                      ),
                      const MyCustomDividerSize10(),
                      MyTextFormField(
                        readOnly: true,
                        control: dateController,
                        isAutoValid: AutovalidateMode.onUserInteraction,
                        type: TextInputType.name,
                        isPassword: false,
                        hint: LocaleKeys.lessonDateHintAndLabelText.tr(),
                        hintStyle:
                            TextStyle(color: ColorManager.mainPrimaryColor4),
                        prefix: Icon(
                          FontAwesomeIcons.calendarCheck,
                          color: ColorManager.mainPrimaryColor4,
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
                      // MyTextFormField(
                      //   readOnly: true,
                      //   control: materialController,
                      //   isAutoValid: AutovalidateMode.onUserInteraction,
                      //   type: TextInputType.name,
                      //   isPassword: false,
                      //   hint: LocaleKeys.educationMaterial.tr(),
                      //   prefix: Icon(
                      //     Icons.select_all,
                      //     color: ColorManager.mainPrimaryColor4,
                      //   ),
                      //   onTap: () async {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => MyCustomCheckBox(
                      //           // myRoute: Routes.studentAddLessonRoute,
                      //           selectedIndexList: subjectsNameList,
                      //           centerWidget: Text(
                      //             LocaleKeys.educationMaterial.tr(),
                      //             style: getBoldStyle(
                      //               color: Theme.of(context)
                      //                   .textTheme
                      //                   .bodyText1!
                      //                   .color!,
                      //               fontSize: 20,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   },
                      //   onSubmit: () {},
                      //   validator: (value) {},
                      //   onChanged: (value) {},
                      // ),
                      ConditionalBuilder(
                          condition: onBoardingCubit.selectedIndexes.isNotEmpty,
                          builder: (context) => Column(
                                children: [
                                  GridView.builder(
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
                                      mainAxisSpacing: 5,
                                      mainAxisExtent: 50,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        onBoardingCubit.selectedIndexes.length,
                                    itemBuilder: (context, index) {
                                      var myIndex = onBoardingCubit
                                          .selectedIndexes[index];
                                      debugPrint(myIndex.toString());
                                      return Center(
                                        child: Stack(
                                          alignment: Alignment.centerLeft,
                                          fit: StackFit.loose,
                                          children: [
                                            Container(
                                              height:
                                                  myMediaQuery(context: context)
                                                          .height /
                                                      20,
                                              width:
                                                  myMediaQuery(context: context)
                                                          .width /
                                                      2.80,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        ColorManager.darkGrey),
                                                color: ColorManager
                                                    .backGroundColor,
                                                borderRadius: const BorderRadius
                                                    .horizontal(
                                                  right: Radius.circular(
                                                    AppSize.size20,
                                                  ),
                                                  left: Radius.circular(
                                                    AppSize.size20,
                                                  ),
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                subjectsNameList[myIndex],
                                                style: TextStyle(
                                                    color:
                                                        ColorManager.darkGrey),
                                                maxLines: AppSize.size1,
                                                textAlign: TextAlign.center,
                                              )),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                debugPrint(
                                                    subjectsNameList[index]
                                                        .toString());
                                                debugPrint(onBoardingCubit
                                                    .selectedIndexes[index]
                                                    .toString());
                                                onBoardingCubit
                                                    .clearCheckBoxIndex(
                                                  onBoardingCubit
                                                      .selectedIndexes[index],
                                                );
                                              },
                                              icon: Icon(
                                                Icons.cancel,
                                                color: ColorManager.darkGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: AppSize.size20,
                                  ),
                                ],
                              ),
                          fallback: (context) => Container()),
                      Row(
                        children: [
                          Text(
                            LocaleKeys.repetitionHintAndLabelText.tr(),
                            style: getBoldStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!),
                          ),
                          const Spacer(),
                          Checkbox(
                            activeColor: ColorManager.mainPrimaryColor4,
                            value: cubit.isRepeated,
                            onChanged: (value) {
                              cubit.changeRepeatBool();
                              // setState(() {
                              //   isRepeated = value!;
                              // });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: myMediaQuery(context: context).height / 20,
                      ),
                      cubit.isFilePicked &&
                              onBoardingCubit.selectedIndexes.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.selectMaterialErrorText.tr(),
                                    style: TextStyle(color: ColorManager.error),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      MyElevatedButton(
                        height: myMediaQuery(context: context).height / 10,
                        width: myMediaQuery(context: context).width / 1.5,
                        radius: 20,
                        onTap: onBoardingCubit.selectedIndexes.isNotEmpty
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  debugPrint('success');
                                }
                              }
                            : () {
                                cubit.changeFilePickedBool(
                                    isPicked: cubit.isFilePicked);
                                debugPrint('s');
                              },
                        buttonName: LocaleKeys.submiButton.tr(),
                        buttonColor: ColorManager.mainPrimaryColor4,
                        borderColor: ColorManager.mainPrimaryColor4,
                        borderWidth: 2,
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
