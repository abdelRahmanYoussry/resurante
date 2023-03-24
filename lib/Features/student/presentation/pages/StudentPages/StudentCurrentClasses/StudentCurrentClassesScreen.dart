// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, non_constant_identifier_names, deprecated_member_use

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:hassy/core/utils/shared/translations/locale_keys.g.dart';
import 'package:hassy/core/utils/shared/widgets/elevatedButton.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/widgets/CustomDropDown.dart';
import '../../../../../../core/utils/shared/widgets/class_main_divider.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
import '../../../../../../core/utils/shared/widgets/textFormfield.dart';
import '../../../widgets/StudentCurrentLessonWidget.dart';
import '../StudentCompeleteReserve/student_compelete_reserve_screen.dart';

class StudentCurrentScreenModel {
  final String Name;
  final double rate;
  final String price;
  final String subjectName;
  final String lessonType;
  final String startTime;
  final String endTime;
  final String lessonDate;
  final String Address;

  StudentCurrentScreenModel({
    required this.price,
    required this.rate,
    required this.Name,
    required this.subjectName,
    required this.endTime,
    required this.lessonType,
    required this.startTime,
    required this.Address,
    required this.lessonDate,
  });
}

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

class StudentCurrentClassesScreen extends StatelessWidget {
  StudentCurrentClassesScreen({
    Key? key,
  }) : super(key: key);

  List<StudentCurrentScreenModel> studentHomeList = [
    StudentCurrentScreenModel(
        Name: 'AbdelRahman Y.',
        price: '200 EGP',
        rate: 7,
        subjectName: 'Math',
        Address: 'Alexandria,Mandra,abo Auf Street',
        endTime: 'To 12:30 Pm',
        startTime: 'From 10:30 Am',
        lessonDate: 'Date:\n 09-01-2023',
        lessonType: 'Revision'),
    StudentCurrentScreenModel(
        Name: 'Hamdy Y.',
        price: '260 EGP',
        rate: 1,
        subjectName: 'DataBase',
        Address: 'Alexandria,Sidi basr,abo Auf Street',
        endTime: 'To 9:30 Pm',
        startTime: 'From 11:30 Am',
        lessonDate: 'Date:\n 11-01-2023',
        lessonType: 'Exam'),
    StudentCurrentScreenModel(
        Name: 'Mohy Y.',
        price: '10 EGP',
        rate: 7,
        subjectName: 'Html',
        Address: 'Alexandria,Sidi basr,abo Auf Street',
        endTime: 'To 9:30 Pm',
        startTime: 'From 11:30 Am',
        lessonDate: 'Date:\n 11-01-2023',
        lessonType: 'Explained'),
    StudentCurrentScreenModel(
        Name: 'Ali Y.',
        price: '200 EGP',
        rate: 7,
        subjectName: 'History',
        Address: 'Alexandria,Miami,abo Auf Street',
        endTime: 'To 9:30 Pm',
        startTime: 'From 11:30 Am',
        lessonDate: 'Date: \n11-01-2023',
        lessonType: 'Oral'),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: ColorManager.mainPrimaryColor4.withOpacity(0.1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // MyElevatedButton(
                  //     textColor: ColorManager.backGroundColor,
                  //     radius: 10,
                  //     height: myMediaQuery(context: context).height / 10,
                  //     width: myMediaQuery(context: context).width / 2,
                  //     borderColor: ColorManager.mainPrimaryColor4,
                  //     onTap: () {
                  //       // navigateTo(context,
                  //       //     routeName: Routes.studentAddLessonRoute);
                  //       navigateAndFinish(context,
                  //           routeName: Routes.studentMainScreenRoute);
                  //     },
                  //     borderWidth: 2,
                  //     buttonName: LocaleKeys.classesReservation.tr(),
                  //     buttonColor: ColorManager.mainPrimaryColor4),

                  IconButton(
                    onPressed: () async {
                      await showBottomSheet(context: context);
                    },
                    color: ColorManager.mainPrimaryColor4,
                    icon: Icon(
                      Icons.filter_alt,
                      size: 30,
                    ),
                  ),
                  Spacer(),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.sort,
                      color: ColorManager.mainPrimaryColor4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  ConditionalBuilder(
                    condition: studentHomeList.isNotEmpty,
                    builder: (context) {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return StudentCurrentLessonWidget(
                            startTime: studentHomeList[index].startTime,
                            lessonType: studentHomeList[index].lessonType,
                            lessonDate: studentHomeList[index].lessonDate,
                            endTime: studentHomeList[index].endTime,
                            address: studentHomeList[index].Address,
                            rate: studentHomeList[index].rate,
                            name: studentHomeList[index].Name,
                            price: studentHomeList[index].price,
                            subjectName: studentHomeList[index].subjectName,
                            onDetailsTapped: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ClassesReserveDetailsScreen(
                                          isPrevious: true,
                                        )),
                              );
                            },
                            onCancelTapped: () {
                              debugPrint(index.toString());
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const ClassesMainDivider(),
                        itemCount: studentHomeList.length,
                      );
                    },
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Stack(
                alignment: Alignment.bottomCenter,
                fit: StackFit.loose,
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
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
                    height: 50,
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
