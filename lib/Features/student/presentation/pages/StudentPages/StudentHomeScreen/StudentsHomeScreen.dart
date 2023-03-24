// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, unused_import, must_be_immutable, deprecated_member_use, use_build_context_synchronously

import 'dart:ui' as ui;

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:hassy/Features/student/presentation/manager/student_profile_cubit/student_profile_cubit.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:hassy/core/utils/shared/widgets/custom_app_bar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../../core/utils/shared/app/assets_manager.dart';
import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../../core/utils/shared/components/oldComponents/dropDownMenu.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/CustomDropDown.dart';
import '../../../../../../core/utils/shared/widgets/class_main_divider.dart';
import '../../../../../../core/utils/shared/widgets/class_main_warnning_button.dart';
import '../../../../../../core/utils/shared/widgets/conditional_builder_listView.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
import '../../../../../../core/utils/shared/widgets/my_sliver_button.dart';
import '../../../../../../core/utils/shared/widgets/textFormfield.dart';
import '../../../widgets/StudentCurrentLessonWidget.dart';
import '../../../widgets/StudentHomeWidgetList.dart';
import '../../../widgets/button_list_widget.dart';
import '../StudentAddClass/SudentAddClass.dart';

class StudentHomeScreenModel {
  final String name;
  final double rate;
  final String aboutTeacher;
  final String assetsImage;
  final String countryFlagName;
  final String numberOfReviews;
  final String price;
  final String rateNumber;
  final String subjectName;
  final String startTime;
  final String endTime;
  final String date;
  final String classType;
  final String address;

  StudentHomeScreenModel({
    required this.price,
    required this.aboutTeacher,
    required this.numberOfReviews,
    required this.rateNumber,
    required this.rate,
    required this.address,
    required this.countryFlagName,
    required this.assetsImage,
    required this.name,
    required this.subjectName,
    required this.endTime,
    required this.startTime,
    required this.classType,
    required this.date,
  });
}

class StudentsHomeScreen extends StatelessWidget {
  StudentsHomeScreen({Key? key}) : super(key: key);
  final TextEditingController dateController = TextEditingController();

  final TextEditingController teacherNameController = TextEditingController();

  var startTimeController = TextEditingController();

  var endTimeController = TextEditingController();

  final SingleValueDropDownController lessonTypeController =
      SingleValueDropDownController();
  final SingleValueDropDownController repeatTypeController =
      SingleValueDropDownController();

  bool isRepeated = false;

  SfRangeValues priceSlider = const SfRangeValues(0, 1000);

  SfRangeValues distanceSlider = const SfRangeValues(0, 1000);

  String? myLessonType;

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

  List<DropDownValueModel> lessonType = [
    const DropDownValueModel(name: 'Review lesson', value: 1),
    const DropDownValueModel(name: 'Oral lesson', value: 2),
    const DropDownValueModel(name: 'Exam', value: 3),
    const DropDownValueModel(name: 'Editorial Lesson', value: 4),
  ];
  List<DropDownValueModel> repeatedType = [
    const DropDownValueModel(name: 'Weekly', value: 1),
    const DropDownValueModel(name: 'Monthly', value: 2),
    const DropDownValueModel(name: 'Daily', value: 3),
  ];

  @override
  Widget build(BuildContext context) {
    StudentProfileCubit.get(context).getUserData(context: context);
    List<StudentHomeScreenModel> teacherList = [
      StudentHomeScreenModel(
          aboutTeacher:
              'Certified Primary & AP High School Classroom Teacher Since 2004',
          assetsImage: ImageAssets.profileExample,
          countryFlagName: 'eg',
          name: 'AbdelRahman Y.',
          numberOfReviews: '(60 reviews)',
          price: '200 EGP/Lesson',
          rate: 7,
          address: 'Alexandria,Mandra,33 AboAuf Street',
          subjectName: 'Math',
          endTime: 'to 10:00Pm',
          startTime: 'From 09:00Pm',
          classType: 'Revision(Exam Oral)',
          date: '09-01-2023',
          rateNumber: '4.5'),
      StudentHomeScreenModel(
          aboutTeacher:
              'Certified Primary & AP High School Classroom Teacher Since 2004',
          assetsImage: ImageAssets.userAvatar,
          countryFlagName: 'eg',
          name: 'Ali Y.',
          endTime: 'To 10:00Pm',
          startTime: 'From 09:00Pm',
          address: 'Alexandria,Mandra,33 AboAuf Street',
          classType: 'Revision(Lesson1)',
          date: '09-01-2023',
          numberOfReviews: '(60 reviews)',
          price: '300 EGP/Lesson',
          rate: 6,
          subjectName: 'History',
          rateNumber: '4.5'),
      StudentHomeScreenModel(
          aboutTeacher:
              'Certified Primary & AP High School Classroom Teacher Since 2004',
          assetsImage: ImageAssets.appBackGroundImage,
          countryFlagName: 'Usa',
          name: 'Mohy Y.',
          endTime: 'To 10:00Pm',
          startTime: 'From 09:00Pm',
          classType: 'Revision(Exam Lesson 2)',
          date: '09-01-2023',
          address: 'Alexandria,Mandra,33 AboAuf Street',
          numberOfReviews: '(60 reviews)',
          price: '100 EGP/Lesson',
          rate: 2,
          subjectName: 'History',
          rateNumber: '4.5'),
      StudentHomeScreenModel(
          aboutTeacher:
              'Certified Primary & AP High School Classroom Teacher Since 2004',
          assetsImage: ImageAssets.profileExample,
          countryFlagName: 'Ad',
          name: 'Handy Y.',
          numberOfReviews: '(60 reviews)',
          address: 'Alexandria,Mandra,33 AboAuf Street',
          subjectName: 'History',
          price: '100 EGP/Lesson',
          endTime: 'From 10:00Pm',
          startTime: 'To 09:00Pm',
          classType: 'Revision(Oral Exam)',
          date: '09-01-2023',
          rate: 3,
          rateNumber: '4.5')
    ];
    return BlocConsumer<StudentProfileCubit, StudentProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = StudentProfileCubit.get(context);
        return ConditionalBuilder(
          builder: (context) => Scaffold(
              backgroundColor:
                  ColorManager.textFormBorderColor.withOpacity(0.2),
              appBar: CustomAppBar(
                mycolor: ColorManager.mainPrimaryColor4,
                title: Text(''),
                isLeading: false,
                toolBarHeight: cubit.userDataEntity.userData
                                .isSecondStepCompleted ==
                            false ||
                        cubit.userDataEntity.userData.isFirstStepCompleted ==
                            false
                    ? myMediaQuery(context: context).height / 3
                    : myMediaQuery(context: context).height / 4,
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            LocaleKeys.appName.tr(),
                            style: getBoldStyle(
                              color: ColorManager.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.heart,
                              color: ColorManager.backGroundColor,
                            ))
                      ],
                    ),
                    if (cubit.userDataEntity.userData.isSecondStepCompleted ==
                            false ||
                        cubit.userDataEntity.userData.isFirstStepCompleted ==
                            false)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ClassMainWarningButtonWidget(
                            buttonText:
                                'Please Complete The Registration Steps ',
                            onTap: () async {
                              if (cubit.userDataEntity.userData
                                          .isFirstStepCompleted ==
                                      false &&
                                  cubit.userDataEntity.userData.typeId == 2) {
                                await AuthCubit.get(context)
                                    .getUserData(context: context);
                                navigateTo(context,
                                    routeName: Routes.registerStep2Route);
                              } else if (cubit.userDataEntity.userData
                                          .isSecondStepCompleted ==
                                      false &&
                                  cubit.userDataEntity.userData.typeId == 2) {
                                await AuthCubit.get(context)
                                    .getUserData(context: context);
                                navigateTo(context,
                                    routeName: Routes.studentRegisterRoute);
                              }
                            }),
                      ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              showBottomSheet(context: context);
                            },
                            icon: Icon(
                              Icons.filter_alt,
                              color: ColorManager.backGroundColor,
                            )),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              showBottomSheet(context: context);
                            },
                            icon: Icon(
                              Icons.sort,
                              color: ColorManager.backGroundColor,
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: ButtonList(
                        buttonList: Row(
                          children: [
                            MySliverButton(
                              buttonName: 'Arabic',
                              onTap: () {},
                            ),
                            MySliverButton(
                              buttonName: 'Math',
                              onTap: () {},
                            ),
                            MySliverButton(
                              buttonName: 'Science',
                              onTap: () {},
                            ),
                            MySliverButton(
                              buttonName: 'Social',
                              onTap: () {},
                            ),
                            MySliverButton(
                              buttonName: 'French',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => StudentHomeWidget(
                  rate: teacherList[index].rate,
                  isFavourite: false,
                  date: teacherList[index].date,
                  classType: teacherList[index].classType,
                  subject: teacherList[index].subjectName,
                  endTime: teacherList[index].endTime,
                  startTime: teacherList[index].startTime,
                  rateNumber: teacherList[index].rateNumber,
                  address: teacherList[index].address,
                  numberOfReviews: teacherList[index].numberOfReviews,
                  name: teacherList[index].name,
                  countryFlagName: teacherList[index].countryFlagName,
                  assetsImage: teacherList[index].assetsImage,
                  aboutTeacher: teacherList[index].aboutTeacher,
                  price: teacherList[index].price,
                ),
                separatorBuilder: (context, index) =>
                    const ClassesMainDivider(),
                itemCount: teacherList.length,
              )),
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: ColorManager.mainPrimaryColor4,
            ),
          ),
          condition: state is GetUserDataSuccessState,
        );
      },
    );
  }

  showBottomSheet({required BuildContext context}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => Container(
            color: Theme.of(context).backgroundColor,
            height: myMediaQuery(context: context).height / 1.5,
            child: Padding(
              // padding: EdgeInsets.all(15.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Stack(
                alignment: Alignment.bottomCenter,
                fit: StackFit.loose,
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const MyCustomDividerSize10(),
                        MyTextFormField(
                          readOnly: false,
                          prefix: Icon(
                            FontAwesomeIcons.idCard,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                          control: teacherNameController,
                          type: TextInputType.name,
                          label: LocaleKeys.teacherName.tr(),
                          isPassword: false,
                          onTap: () {},
                          onChanged: (value) {},
                        ),
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
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                          onTap: () {
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
                          onSubmit: (value) {},
                          validator: (value) {},
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
                                hint: '11:00 Am',
                                suffix: Icons.timer_outlined,
                                control: startTimeController,
                                type: TextInputType.number,
                                isPassword: false,
                                onTap: () {
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
                                hint: '01:00 Pm',
                                suffix: Icons.timer_outlined,
                                control: endTimeController,
                                type: TextInputType.number,
                                isPassword: false,
                                onTap: () {
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
                            enableSearch: false,
                            enableDropDown: true,
                            dropDownValueList: lessonType,
                            controller: lessonTypeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.lessonTypeErrorText.tr();
                              } else {
                                return null;
                              }
                            },
                            label: Text(
                                LocaleKeys.lessonTypeHintAndLabelText.tr())),
                        const MyCustomDividerSize5(),
                        const MyCustomDividerSize5(),
                        Text(
                          LocaleKeys.lessonPriceHintAndLabelText.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: ColorManager.error),
                        ),
                        //priceSlider
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SfRangeSlider(
                            min: 0,
                            max: 1000,
                            values: priceSlider,
                            interval: 200,
                            showTicks: false,
                            stepSize: 10,
                            shouldAlwaysShowTooltip: true,
                            // thumbShape:  const SfThumbShape(),
                            // tooltipTextFormatterCallback: (v,f){
                            //        return    f.toUpperCase();
                            // },
                            showLabels: false,
                            enableTooltip: true,
                            minorTicksPerInterval: 2,
                            activeColor: ColorManager.mainPrimaryColor4,
                            onChanged: (SfRangeValues values) {
                              setState(() {
                                priceSlider = values;
                              });
                            },
                          ),
                        ),
                        const MyCustomDividerSize5(),
                        MyCustomDropDown(
                            enableSearch: false,
                            enableDropDown: true,
                            dropDownValueList: repeatedType,
                            controller: repeatTypeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.repetitionHintAndLabelText
                                    .tr();
                              } else {
                                return null;
                              }
                            },
                            label: Text(
                                LocaleKeys.repetitionHintAndLabelText.tr())),
                        const MyCustomDividerSize10(),
                        Text(
                          LocaleKeys.distance.tr(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        //distanceSlider
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: SfRangeSlider(
                            min: 0,
                            max: 1000,
                            values: distanceSlider,
                            interval: 200,
                            showTicks: false,
                            stepSize: 10,
                            shouldAlwaysShowTooltip: true,
                            // thumbShape:  const SfThumbShape(),
                            // tooltipTextFormatterCallback: (v,f){
                            //        return    f.toUpperCase();
                            // },
                            showLabels: false,
                            enableTooltip: true,
                            minorTicksPerInterval: 2,
                            activeColor: ColorManager.mainPrimaryColor4,
                            onChanged: (SfRangeValues values) {
                              setState(() {
                                distanceSlider = values;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: myMediaQuery(context: context).height / 6,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(AppSize.size10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyElevatedButton(
                            height: AppSize.size50,
                            width: 120,
                            borderWidth: AppSize.size2,
                            radius: AppSize.size10,
                            fontSize: FontSize.size18,
                            onTap: () {},
                            buttonName: LocaleKeys.searchButton.tr(),
                            borderColor: ColorManager.mainPrimaryColor4,
                            buttonColor: ColorManager.mainPrimaryColor4),
                        MyElevatedButton(
                            height: AppSize.size50,
                            width: 120,
                            borderWidth: AppSize.size2,
                            radius: AppSize.size10,
                            fontSize: FontSize.size18,
                            onTap: () {},
                            buttonName: LocaleKeys.resetButtonText.tr(),
                            borderColor: ColorManager.mainPrimaryColor4,
                            buttonColor: ColorManager.mainPrimaryColor4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
