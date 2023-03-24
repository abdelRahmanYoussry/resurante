// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, deprecated_member_use

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/CustomDropDown.dart';
import '../../../../../../core/utils/shared/widgets/class_main_divider.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
import '../../../../../../core/utils/shared/widgets/textFormfield.dart';
import '../../../widgets/StudentPreviousLessonWidget.dart';
import '../StudentCompeleteReserve/student_compelete_reserve_screen.dart';
import '../StudentCurrentClasses/StudentCurrentClassesScreen.dart';

class StudentPreviousClassesScreen extends StatelessWidget {
  StudentPreviousClassesScreen({Key? key}) : super(key: key);
  List<StudentCurrentScreenModel> studentPreviousList = [
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
    return Scaffold(
      backgroundColor: ColorManager.mainPrimaryColor4.withOpacity(0.1),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.padding10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      await showBottomSheet(context: context);
                    },
                    icon: Icon(
                      Icons.filter_alt,
                      color: ColorManager.mainPrimaryColor4,
                      size: 30,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sort,
                        color: ColorManager.mainPrimaryColor4,
                      ))
                ],
              ),
              ConditionalBuilder(
                condition: studentPreviousList.isNotEmpty,
                builder: (context) {
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return StudentPreviousLessonWidget(
                        price: studentPreviousList[index].price,
                        name: studentPreviousList[index].Name,
                        rate: studentPreviousList[index].rate,
                        address: studentPreviousList[index].Address,
                        endTime: studentPreviousList[index].endTime,
                        lessonDate: studentPreviousList[index].lessonDate,
                        lessonType: studentPreviousList[index].lessonType,
                        startTime: studentPreviousList[index].startTime,
                        subjectName: studentPreviousList[index].subjectName,
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
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const ClassesMainDivider(),
                    itemCount: studentPreviousList.length,
                  );
                },
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
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
      backgroundColor: Theme.of(context).backgroundColor,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => Container(
            height: myMediaQuery(context: context).height / 1.5,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)),
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
