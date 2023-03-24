// ignore_for_file: file_names
// // ignore_for_file: file_names
//
// import 'package:another_stepper/dto/stepper_data.dart';
// import 'package:another_stepper/widgets/another_stepper.dart';
// import 'package:dropdown_textfield/dropdown_textfield.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import '../../../../core/utils/shared/app/color_manager.dart';
// import '../../../../core/utils/shared/app/font_manager.dart';
// import '../../../../core/utils/shared/app/values_manager.dart';
// import '../../../../core/utils/shared/components/components.dart';
// import '../../../../core/utils/shared/translations/locale_keys.g.dart';
// import '../../../../core/utils/shared/widgets/CustomDropDown.dart';
// import '../../../../core/utils/shared/widgets/custom_app_bar.dart';
// import '../../../../core/utils/shared/widgets/elevatedButton.dart';
// import '../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
// import '../../../../core/utils/shared/widgets/textFormfield.dart';
//
// class TeacherStepper extends StatefulWidget {
//   const TeacherStepper({Key? key}) : super(key: key);
//
//   @override
//   State<TeacherStepper> createState() => _TeacherStepperState();
// }
//
// class _TeacherStepperState extends State<TeacherStepper> {
//   final TextEditingController addressController = TextEditingController();
//
//   final TextEditingController noteController = TextEditingController();
//
//   final TextEditingController dateController = TextEditingController();
//
//   final TextEditingController priceController = TextEditingController();
//
//   final TextEditingController lessonCountController = TextEditingController();
//
//   final TextEditingController lessonRepeatController = TextEditingController();
//   final TextEditingController materialController = TextEditingController();
//   var startTimeController = TextEditingController();
//   var endTimeController = TextEditingController();
//   late SingleValueDropDownController educationSystemController;
//   late SingleValueDropDownController educationLevelController;
//   late SingleValueDropDownController educationLanguageController;
//   late SingleValueDropDownController gradeLevelController;
//   late SingleValueDropDownController lessonTypeController;
//   late SingleValueDropDownController repeatTypeController;
//   late SingleValueDropDownController classPlaceController;
//   String? mySystem;
//
//   String? myLevel;
//   String? myLessonType;
//   List<DropDownValueModel> educationSystem = [
//     const DropDownValueModel(name: 'Governmental', value: '1'),
//     const DropDownValueModel(name: 'Arabic Experimental', value: '2'),
//     const DropDownValueModel(name: 'Experimental Languages', value: '3'),
//     const DropDownValueModel(name: 'Private', value: '4'),
//     const DropDownValueModel(name: 'International', value: '5'),
//     const DropDownValueModel(name: 'International', value: '5'),
//     const DropDownValueModel(name: 'International', value: '5'),
//     const DropDownValueModel(name: 'International', value: '5'),
//   ];
//
//   List<DropDownValueModel> educationLevel = [
//     const DropDownValueModel(name: 'Primary', value: '1'),
//     const DropDownValueModel(name: 'Preparatory', value: '2'),
//     const DropDownValueModel(name: 'Secondary', value: '3'),
//   ];
//   List<DropDownValueModel> classPlaces = [
//     const DropDownValueModel(name: 'asafra', value: '1'),
//     const DropDownValueModel(name: 'shabby', value: '2'),
//     const DropDownValueModel(name: 'said bishop', value: '3'),
//   ];
//   List<DropDownValueModel> educationLanguage = [
//     const DropDownValueModel(name: 'Arabic', value: '12'),
//     const DropDownValueModel(name: 'Math', value: '2'),
//     const DropDownValueModel(name: 'Science', value: '3'),
//     const DropDownValueModel(name: 'Social', value: '4'),
//     const DropDownValueModel(name: 'English', value: '5'),
//     const DropDownValueModel(name: 'French', value: '6'),
//     const DropDownValueModel(name: 'Germany', value: '7'),
//     const DropDownValueModel(name: 'Chemistry', value: '8'),
//     const DropDownValueModel(name: 'Physics', value: '9'),
//   ];
//   List<DropDownValueModel> gradeLevel = [
//     const DropDownValueModel(name: 'Fifth', value: '1'),
//     const DropDownValueModel(name: 'Fourth', value: '2'),
//     const DropDownValueModel(name: 'Third', value: '3'),
//     const DropDownValueModel(name: 'Primary', value: '4'),
//     const DropDownValueModel(name: 'KG', value: '5'),
//     const DropDownValueModel(name: 'First', value: '6'),
//     const DropDownValueModel(name: 'Sixth', value: '7'),
//   ];
//   List<DropDownValueModel> lessonType = [
//     const DropDownValueModel(name: 'Review lesson', value: 1),
//     const DropDownValueModel(name: 'Oral lesson', value: 2),
//     const DropDownValueModel(name: 'Exam', value: 3),
//     const DropDownValueModel(name: 'Editorial Lesson', value: 4),
//   ];
//   List<DropDownValueModel> repeatedType = [
//     const DropDownValueModel(name: 'Weekly', value: 1),
//     const DropDownValueModel(name: 'Monthly', value: 2),
//     const DropDownValueModel(name: 'Daily', value: 3),
//   ];
//   @override
//   void initState() {
//     classPlaceController = SingleValueDropDownController();
//     educationSystemController = SingleValueDropDownController();
//     educationLevelController = SingleValueDropDownController();
//     educationLanguageController = SingleValueDropDownController();
//     gradeLevelController = SingleValueDropDownController();
//     lessonTypeController = SingleValueDropDownController();
//     repeatTypeController = SingleValueDropDownController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     educationSystemController.dispose();
//     educationLevelController.dispose();
//     educationLanguageController.dispose();
//     gradeLevelController.dispose();
//     lessonTypeController.dispose();
//     repeatTypeController.dispose();
//     classPlaceController.dispose();
//     super.dispose();
//   }
//
//   final formKey = GlobalKey<FormState>();
//   bool isRepeated = false;
//
//   @override
//   Widget build(BuildContext context) {
//     List<StepperData> stepperData = [
//       StepperData(
//         title: StepperText(
//           "Add Class",
//           textStyle: const TextStyle(color: Colors.black, fontSize: 14),
//         ),
//         iconWidget: InkWell(
//           onTap: () {
//             showDialog(
//                 useSafeArea: true,
//                 context: context,
//                 builder: (context) {
//                   return SimpleDialog(
//                     elevation: 0.8,
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.horizontal(
//                       left: Radius.circular(20),
//                       right: Radius.circular(20),
//                     )),
//                     title: Center(
//                         child: Text(
//                       LocaleKeys.lessonTitleMainTextAndLabel.tr(),
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: ColorManager.darkGrey),
//                     )),
//                     backgroundColor: ColorManager.backGroundColor,
//                     children: [
//                       SizedBox(
//                         width: myMediaQuery(context: context).width / 1.5,
//                         child: Column(
//                           children: [
//                             MyTextFormField(
//                               readOnly: false,
//                               control: noteController,
//                               isAutoValid: AutovalidateMode.onUserInteraction,
//                               type: TextInputType.name,
//                               isPassword: false,
//                               hint: LocaleKeys.lessonTitleMainTextAndLabel.tr(),
//                               label:
//                                   LocaleKeys.lessonTitleMainTextAndLabel.tr(),
//                               prefix: Icon(
//                                 FontAwesomeIcons.noteSticky,
//                                 color: ColorManager.mainPrimaryColor4,
//                               ),
//                               onTap: () {},
//                               onSubmit: () {},
//                               validator: (value) {
//                                 if (value.isEmpty) {
//                                   return LocaleKeys.lessonTitleErrorText.tr();
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {},
//                             ),
//                             const MyCustomDividerSize5(),
//                             MyTextFormField(
//                               readOnly: false,
//                               control: noteController,
//                               isAutoValid: AutovalidateMode.onUserInteraction,
//                               type: TextInputType.name,
//                               isPassword: false,
//                               hint: LocaleKeys.noteAddressAndHintLabel.tr(),
//                               label: LocaleKeys.noteAddressAndHintLabel.tr(),
//                               prefix: Icon(
//                                 FontAwesomeIcons.noteSticky,
//                                 color: ColorManager.mainPrimaryColor4,
//                               ),
//                               onTap: () {},
//                               onSubmit: () {},
//                               validator: (value) {
//                                 if (value.isEmpty) {
//                                   return LocaleKeys.lessonDetailsErrorText.tr();
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {},
//                             ),
//                             const MyCustomDividerSize5(),
//                             MyCustomDropDown(
//                                 borderColor: ColorManager.textFormBorderColor,
//                                 focusedBorderColor:
//                                     ColorManager.mainPrimaryColor4,
//                                 enableSearch: false,
//                                 dropDownValueList: classPlaces,
//                                 controller: classPlaceController,
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return LocaleKeys.addressisEmpty.tr();
//                                   } else {
//                                     return null;
//                                   }
//                                 },
//                                 label: Text(LocaleKeys.userAddress.tr())),
//                             const MyCustomDividerSize5(),
//                             MyTextFormField(
//                               readOnly: true,
//                               control: dateController,
//                               isAutoValid: AutovalidateMode.onUserInteraction,
//                               type: TextInputType.name,
//                               isPassword: false,
//                               hint: LocaleKeys.lessonDateHintAndLabelText.tr(),
//                               prefix: Icon(
//                                 FontAwesomeIcons.calendarCheck,
//                                 color: ColorManager.mainPrimaryColor4,
//                               ),
//                               onTap: () async {
//                                 showDatePicker(
//                                         context: context,
//                                         initialDate: DateTime.now(),
//                                         firstDate: DateTime.now(),
//                                         lastDate: DateTime(21160))
//                                     .then((value) {
//                                   dateController.text =
//                                       DateFormat.yMd().format(value!);
//                                 }).catchError((error) {});
//                               },
//                               onSubmit: () {},
//                               validator: (value) {
//                                 if (value.isEmpty) {
//                                   return LocaleKeys.lessonDateErrorText.tr();
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {},
//                             ),
//                             SizedBox(
//                               height:
//                                   myMediaQuery(context: context).height / 1.5,
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 8.0, vertical: 10),
//                                 child: Stack(
//                                   alignment: Alignment.bottomCenter,
//                                   fit: StackFit.loose,
//                                   children: [
//                                     // SingleChildScrollView(
//                                     //   child: Column(
//                                     //     children: [
//                                     //       MyTextFormField(
//                                     //         readOnly: false,
//                                     //         prefix: Icon(
//                                     //           FontAwesomeIcons.idCard,
//                                     //           color: ColorManager.mainPrimaryColor4,
//                                     //         ),
//                                     //         control: teacherNameController,
//                                     //         type: TextInputType.name,
//                                     //         label: LocaleKeys.teacherName.tr(),
//                                     //         isPassword: false,
//                                     //         borderColor: ColorManager.textFormBorderColor,
//                                     //         labelColor: ColorManager.mainPrimaryColor4,
//                                     //         textColor:
//                                     //         Theme.of(context).textTheme.bodyText1!.color!,
//                                     //         backgroundColor: ColorManager.backGroundColor,
//                                     //         onTap: () {},
//                                     //         onChanged: (value) {},
//                                     //       ),
//                                     //       const MyCustomDividerSize5(),
//                                     //       MyTextFormField(
//                                     //         readOnly: true,
//                                     //         control: dateController,
//                                     //         isAutoValid: AutovalidateMode.onUserInteraction,
//                                     //         type: TextInputType.name,
//                                     //         isPassword: false,
//                                     //         hint: LocaleKeys.lessonDateHintAndLabelText.tr(),
//                                     //         prefix: Icon(
//                                     //           FontAwesomeIcons.calendarCheck,
//                                     //           color: ColorManager.mainPrimaryColor4,
//                                     //         ),
//                                     //         onTap: () {
//                                     //           showDatePicker(
//                                     //               context: context,
//                                     //               initialDate: DateTime.now(),
//                                     //               firstDate: DateTime.now(),
//                                     //               lastDate: DateTime(21160))
//                                     //               .then((value) {
//                                     //             dateController.text =
//                                     //                 DateFormat.yMd().format(value!);
//                                     //           }).catchError((error) {});
//                                     //         },
//                                     //         onSubmit: (value) {},
//                                     //         validator: (value) {},
//                                     //         onChanged: (value) {},
//                                     //         borderColor: ColorManager.grey2,
//                                     //         labelColor: ColorManager.mainPrimaryColor4,
//                                     //         textColor:
//                                     //         Theme.of(context).textTheme.bodyText1!.color!,
//                                     //         backgroundColor: ColorManager.backGroundColor,
//                                     //       ),
//                                     //       const MyCustomDividerSize5(),
//                                     //       Padding(
//                                     //         padding: const EdgeInsets.only(left: 5.0),
//                                     //         child: Row(
//                                     //           children: [
//                                     //             Expanded(
//                                     //                 child: Text(
//                                     //                   LocaleKeys.startTime.tr(),
//                                     //                   style: getBoldStyle(
//                                     //                       color: Theme.of(context)
//                                     //                           .textTheme
//                                     //                           .bodyText1!
//                                     //                           .color!),
//                                     //                 )),
//                                     //             const SizedBox(
//                                     //               width: 10,
//                                     //             ),
//                                     //             Expanded(
//                                     //                 child: Text(LocaleKeys.endTime.tr(),
//                                     //                     style: getBoldStyle(
//                                     //                         color: Theme.of(context)
//                                     //                             .textTheme
//                                     //                             .bodyText1!
//                                     //                             .color!))),
//                                     //           ],
//                                     //         ),
//                                     //       ),
//                                     //       const SizedBox(
//                                     //         height: 2,
//                                     //       ),
//                                     //       Row(
//                                     //         children: [
//                                     //           Expanded(
//                                     //             child: MyTextFormField(
//                                     //               readOnly: true,
//                                     //               hint: '11:00 Am',
//                                     //               suffix: Icons.timer_outlined,
//                                     //               suffixIconColor: Theme.of(context)
//                                     //                   .textTheme
//                                     //                   .subtitle1!
//                                     //                   .color!,
//                                     //               control: startTimeController,
//                                     //               type: TextInputType.number,
//                                     //               isPassword: false,
//                                     //               borderColor: ColorManager.textFormBorderColor,
//                                     //               labelColor: ColorManager.mainPrimaryColor4,
//                                     //               textColor: Theme.of(context)
//                                     //                   .textTheme
//                                     //                   .bodyText1!
//                                     //                   .color!,
//                                     //               backgroundColor: ColorManager.backGroundColor,
//                                     //               onTap: () {
//                                     //                 showTimePicker(
//                                     //                     context: context,
//                                     //                     initialTime: TimeOfDay.now())
//                                     //                     .then((value) {
//                                     //                   startTimeController.text =
//                                     //                       value!.format(context).toString();
//                                     //                 }).catchError((error) {});
//                                     //               },
//                                     //             ),
//                                     //           ),
//                                     //           const SizedBox(
//                                     //             width: 10,
//                                     //           ),
//                                     //           Expanded(
//                                     //             child: MyTextFormField(
//                                     //               readOnly: true,
//                                     //               hint: '01:00 Pm',
//                                     //               suffix: Icons.timer_outlined,
//                                     //               suffixIconColor: Theme.of(context)
//                                     //                   .textTheme
//                                     //                   .subtitle1!
//                                     //                   .color!,
//                                     //               control: endTimeController,
//                                     //               type: TextInputType.number,
//                                     //               isPassword: false,
//                                     //               borderColor: ColorManager.textFormBorderColor,
//                                     //               labelColor: ColorManager.mainPrimaryColor4,
//                                     //               textColor: Theme.of(context)
//                                     //                   .textTheme
//                                     //                   .bodyText1!
//                                     //                   .color!,
//                                     //               backgroundColor: ColorManager.backGroundColor,
//                                     //               onTap: () {
//                                     //                 showTimePicker(
//                                     //                     context: context,
//                                     //                     initialTime: TimeOfDay.now())
//                                     //                     .then((value) {
//                                     //                   endTimeController.text =
//                                     //                       value!.format(context).toString();
//                                     //                 }).catchError((error) {});
//                                     //               },
//                                     //             ),
//                                     //           ),
//                                     //         ],
//                                     //       ),
//                                     //       const MyCustomDividerSize5(),
//                                     //       MyCustomDropDown(
//                                     //           borderColor: ColorManager.textFormBorderColor,
//                                     //           focusedBorderColor: ColorManager.mainPrimaryColor4,
//                                     //           enableSearch: false,
//                                     //           dropDownValueList: lessonType,
//                                     //           controller: lessonTypeController,
//                                     //           validator: (value) {
//                                     //             if (value!.isEmpty) {
//                                     //               return LocaleKeys.lessonTypeErrorText.tr();
//                                     //             } else {
//                                     //               return null;
//                                     //             }
//                                     //           },
//                                     //           label: Text(
//                                     //               LocaleKeys.lessonTypeHintAndLabelText.tr())),
//                                     //       const MyCustomDividerSize5(),
//                                     //       const MyCustomDividerSize5(),
//                                     //       Text(
//                                     //         LocaleKeys.lessonPriceHintAndLabelText.tr(),
//                                     //         style: TextStyle(
//                                     //             fontSize: 20, color: ColorManager.error),
//                                     //       ),
//                                     //       //priceSlider
//                                     //       Padding(
//                                     //         padding: const EdgeInsets.only(top: 15.0),
//                                     //         child: SfRangeSlider(
//                                     //           min: 0,
//                                     //           max: 1000,
//                                     //           values: priceSlider,
//                                     //           interval: 200,
//                                     //           showTicks: false,
//                                     //           stepSize: 10,
//                                     //           shouldAlwaysShowTooltip: true,
//                                     //           // thumbShape:  const SfThumbShape(),
//                                     //           // tooltipTextFormatterCallback: (v,f){
//                                     //           //        return    f.toUpperCase();
//                                     //           // },
//                                     //           showLabels: false,
//                                     //           enableTooltip: true,
//                                     //           minorTicksPerInterval: 2,
//                                     //           activeColor: ColorManager.mainPrimaryColor4,
//                                     //           onChanged: (SfRangeValues values) {
//                                     //             setState(() {
//                                     //               priceSlider = values;
//                                     //             });
//                                     //           },
//                                     //         ),
//                                     //       ),
//                                     //       const MyCustomDividerSize5(),
//                                     //       MyCustomDropDown(
//                                     //           borderColor: ColorManager.textFormBorderColor,
//                                     //           focusedBorderColor: ColorManager.mainPrimaryColor4,
//                                     //           enableSearch: false,
//                                     //           dropDownValueList: repeatedType,
//                                     //           controller: repeatTypeController,
//                                     //           validator: (value) {
//                                     //             if (value!.isEmpty) {
//                                     //               return LocaleKeys.repetitionHintAndLabelText
//                                     //                   .tr();
//                                     //             } else {
//                                     //               return null;
//                                     //             }
//                                     //           },
//                                     //           label: Text(
//                                     //               LocaleKeys.repetitionHintAndLabelText.tr())),
//                                     //       const MyCustomDividerSize10(),
//                                     //       Text(
//                                     //         LocaleKeys.distance.tr(),
//                                     //         style: TextStyle(
//                                     //             fontSize: 20, color: ColorManager.darkGrey),
//                                     //       ),
//                                     //       //distanceSlider
//                                     //       Padding(
//                                     //         padding: const EdgeInsets.only(top: 5.0),
//                                     //         child: SfRangeSlider(
//                                     //           min: 0,
//                                     //           max: 1000,
//                                     //           values: distanceSlider,
//                                     //           interval: 200,
//                                     //           showTicks: false,
//                                     //           stepSize: 10,
//                                     //           shouldAlwaysShowTooltip: true,
//                                     //           // thumbShape:  const SfThumbShape(),
//                                     //           // tooltipTextFormatterCallback: (v,f){
//                                     //           //        return    f.toUpperCase();
//                                     //           // },
//                                     //           showLabels: false,
//                                     //           enableTooltip: true,
//                                     //           minorTicksPerInterval: 2,
//                                     //           activeColor: ColorManager.mainPrimaryColor4,
//                                     //           onChanged: (SfRangeValues values) {
//                                     //             setState(() {
//                                     //               distanceSlider = values;
//                                     //             });
//                                     //           },
//                                     //         ),
//                                     //       ),
//                                     //       SizedBox(
//                                     //         height: myMediaQuery(context: context).height / 6,
//                                     //       ),
//                                     //     ],
//                                     //   ),
//                                     // ),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: ColorManager.white,
//                                         borderRadius: BorderRadius.circular(
//                                             AppSize.size10),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           MyElevatedButton(
//                                               height: AppSize.size50,
//                                               width: 120,
//                                               borderWidth: AppSize.size2,
//                                               radius: AppSize.size10,
//                                               fontSize: FontSize.size18,
//                                               onTap: () {},
//                                               buttonName:
//                                                   LocaleKeys.searchButton.tr(),
//                                               borderColor: ColorManager
//                                                   .mainPrimaryColor4,
//                                               buttonColor: ColorManager
//                                                   .mainPrimaryColor4),
//                                           MyElevatedButton(
//                                               height: AppSize.size50,
//                                               width: 120,
//                                               borderWidth: AppSize.size2,
//                                               radius: AppSize.size10,
//                                               fontSize: FontSize.size18,
//                                               onTap: () {},
//                                               buttonName: LocaleKeys
//                                                   .resetButtonText
//                                                   .tr(),
//                                               borderColor: ColorManager
//                                                   .mainPrimaryColor4,
//                                               buttonColor: ColorManager
//                                                   .mainPrimaryColor4),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   );
//                 });
//           },
//           child: Container(
//             padding: const EdgeInsets.all(8),
//             decoration: const BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.all(Radius.circular(30))),
//             child: const Icon(Icons.looks_one, color: Colors.white),
//           ),
//         ),
//         subtitle: StepperText("Class Title"),
//       ),
//       StepperData(
//         title: StepperText(
//           "Add Class",
//           textStyle: const TextStyle(color: Colors.black, fontSize: 14),
//         ),
//         iconWidget: InkWell(
//           onTap: () {
//             showModalBottomSheet(
//                 context: context,
//                 builder: (context) {
//                   return StatefulBuilder(
//                     builder: (context, setState) => SizedBox(
//                       height: myMediaQuery(context: context).height / 1.5,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8.0, vertical: 10),
//                         child: Stack(
//                           alignment: Alignment.bottomCenter,
//                           fit: StackFit.loose,
//                           children: [
//                             // SingleChildScrollView(
//                             //   child: Column(
//                             //     children: [
//                             //       MyTextFormField(
//                             //         readOnly: false,
//                             //         prefix: Icon(
//                             //           FontAwesomeIcons.idCard,
//                             //           color: ColorManager.mainPrimaryColor4,
//                             //         ),
//                             //         control: teacherNameController,
//                             //         type: TextInputType.name,
//                             //         label: LocaleKeys.teacherName.tr(),
//                             //         isPassword: false,
//                             //         borderColor: ColorManager.textFormBorderColor,
//                             //         labelColor: ColorManager.mainPrimaryColor4,
//                             //         textColor:
//                             //         Theme.of(context).textTheme.bodyText1!.color!,
//                             //         backgroundColor: ColorManager.backGroundColor,
//                             //         onTap: () {},
//                             //         onChanged: (value) {},
//                             //       ),
//                             //       const MyCustomDividerSize5(),
//                             //       MyTextFormField(
//                             //         readOnly: true,
//                             //         control: dateController,
//                             //         isAutoValid: AutovalidateMode.onUserInteraction,
//                             //         type: TextInputType.name,
//                             //         isPassword: false,
//                             //         hint: LocaleKeys.lessonDateHintAndLabelText.tr(),
//                             //         prefix: Icon(
//                             //           FontAwesomeIcons.calendarCheck,
//                             //           color: ColorManager.mainPrimaryColor4,
//                             //         ),
//                             //         onTap: () {
//                             //           showDatePicker(
//                             //               context: context,
//                             //               initialDate: DateTime.now(),
//                             //               firstDate: DateTime.now(),
//                             //               lastDate: DateTime(21160))
//                             //               .then((value) {
//                             //             dateController.text =
//                             //                 DateFormat.yMd().format(value!);
//                             //           }).catchError((error) {});
//                             //         },
//                             //         onSubmit: (value) {},
//                             //         validator: (value) {},
//                             //         onChanged: (value) {},
//                             //         borderColor: ColorManager.grey2,
//                             //         labelColor: ColorManager.mainPrimaryColor4,
//                             //         textColor:
//                             //         Theme.of(context).textTheme.bodyText1!.color!,
//                             //         backgroundColor: ColorManager.backGroundColor,
//                             //       ),
//                             //       const MyCustomDividerSize5(),
//                             //       Padding(
//                             //         padding: const EdgeInsets.only(left: 5.0),
//                             //         child: Row(
//                             //           children: [
//                             //             Expanded(
//                             //                 child: Text(
//                             //                   LocaleKeys.startTime.tr(),
//                             //                   style: getBoldStyle(
//                             //                       color: Theme.of(context)
//                             //                           .textTheme
//                             //                           .bodyText1!
//                             //                           .color!),
//                             //                 )),
//                             //             const SizedBox(
//                             //               width: 10,
//                             //             ),
//                             //             Expanded(
//                             //                 child: Text(LocaleKeys.endTime.tr(),
//                             //                     style: getBoldStyle(
//                             //                         color: Theme.of(context)
//                             //                             .textTheme
//                             //                             .bodyText1!
//                             //                             .color!))),
//                             //           ],
//                             //         ),
//                             //       ),
//                             //       const SizedBox(
//                             //         height: 2,
//                             //       ),
//                             //       Row(
//                             //         children: [
//                             //           Expanded(
//                             //             child: MyTextFormField(
//                             //               readOnly: true,
//                             //               hint: '11:00 Am',
//                             //               suffix: Icons.timer_outlined,
//                             //               suffixIconColor: Theme.of(context)
//                             //                   .textTheme
//                             //                   .subtitle1!
//                             //                   .color!,
//                             //               control: startTimeController,
//                             //               type: TextInputType.number,
//                             //               isPassword: false,
//                             //               borderColor: ColorManager.textFormBorderColor,
//                             //               labelColor: ColorManager.mainPrimaryColor4,
//                             //               textColor: Theme.of(context)
//                             //                   .textTheme
//                             //                   .bodyText1!
//                             //                   .color!,
//                             //               backgroundColor: ColorManager.backGroundColor,
//                             //               onTap: () {
//                             //                 showTimePicker(
//                             //                     context: context,
//                             //                     initialTime: TimeOfDay.now())
//                             //                     .then((value) {
//                             //                   startTimeController.text =
//                             //                       value!.format(context).toString();
//                             //                 }).catchError((error) {});
//                             //               },
//                             //             ),
//                             //           ),
//                             //           const SizedBox(
//                             //             width: 10,
//                             //           ),
//                             //           Expanded(
//                             //             child: MyTextFormField(
//                             //               readOnly: true,
//                             //               hint: '01:00 Pm',
//                             //               suffix: Icons.timer_outlined,
//                             //               suffixIconColor: Theme.of(context)
//                             //                   .textTheme
//                             //                   .subtitle1!
//                             //                   .color!,
//                             //               control: endTimeController,
//                             //               type: TextInputType.number,
//                             //               isPassword: false,
//                             //               borderColor: ColorManager.textFormBorderColor,
//                             //               labelColor: ColorManager.mainPrimaryColor4,
//                             //               textColor: Theme.of(context)
//                             //                   .textTheme
//                             //                   .bodyText1!
//                             //                   .color!,
//                             //               backgroundColor: ColorManager.backGroundColor,
//                             //               onTap: () {
//                             //                 showTimePicker(
//                             //                     context: context,
//                             //                     initialTime: TimeOfDay.now())
//                             //                     .then((value) {
//                             //                   endTimeController.text =
//                             //                       value!.format(context).toString();
//                             //                 }).catchError((error) {});
//                             //               },
//                             //             ),
//                             //           ),
//                             //         ],
//                             //       ),
//                             //       const MyCustomDividerSize5(),
//                             //       MyCustomDropDown(
//                             //           borderColor: ColorManager.textFormBorderColor,
//                             //           focusedBorderColor: ColorManager.mainPrimaryColor4,
//                             //           enableSearch: false,
//                             //           dropDownValueList: lessonType,
//                             //           controller: lessonTypeController,
//                             //           validator: (value) {
//                             //             if (value!.isEmpty) {
//                             //               return LocaleKeys.lessonTypeErrorText.tr();
//                             //             } else {
//                             //               return null;
//                             //             }
//                             //           },
//                             //           label: Text(
//                             //               LocaleKeys.lessonTypeHintAndLabelText.tr())),
//                             //       const MyCustomDividerSize5(),
//                             //       const MyCustomDividerSize5(),
//                             //       Text(
//                             //         LocaleKeys.lessonPriceHintAndLabelText.tr(),
//                             //         style: TextStyle(
//                             //             fontSize: 20, color: ColorManager.error),
//                             //       ),
//                             //       //priceSlider
//                             //       Padding(
//                             //         padding: const EdgeInsets.only(top: 15.0),
//                             //         child: SfRangeSlider(
//                             //           min: 0,
//                             //           max: 1000,
//                             //           values: priceSlider,
//                             //           interval: 200,
//                             //           showTicks: false,
//                             //           stepSize: 10,
//                             //           shouldAlwaysShowTooltip: true,
//                             //           // thumbShape:  const SfThumbShape(),
//                             //           // tooltipTextFormatterCallback: (v,f){
//                             //           //        return    f.toUpperCase();
//                             //           // },
//                             //           showLabels: false,
//                             //           enableTooltip: true,
//                             //           minorTicksPerInterval: 2,
//                             //           activeColor: ColorManager.mainPrimaryColor4,
//                             //           onChanged: (SfRangeValues values) {
//                             //             setState(() {
//                             //               priceSlider = values;
//                             //             });
//                             //           },
//                             //         ),
//                             //       ),
//                             //       const MyCustomDividerSize5(),
//                             //       MyCustomDropDown(
//                             //           borderColor: ColorManager.textFormBorderColor,
//                             //           focusedBorderColor: ColorManager.mainPrimaryColor4,
//                             //           enableSearch: false,
//                             //           dropDownValueList: repeatedType,
//                             //           controller: repeatTypeController,
//                             //           validator: (value) {
//                             //             if (value!.isEmpty) {
//                             //               return LocaleKeys.repetitionHintAndLabelText
//                             //                   .tr();
//                             //             } else {
//                             //               return null;
//                             //             }
//                             //           },
//                             //           label: Text(
//                             //               LocaleKeys.repetitionHintAndLabelText.tr())),
//                             //       const MyCustomDividerSize10(),
//                             //       Text(
//                             //         LocaleKeys.distance.tr(),
//                             //         style: TextStyle(
//                             //             fontSize: 20, color: ColorManager.darkGrey),
//                             //       ),
//                             //       //distanceSlider
//                             //       Padding(
//                             //         padding: const EdgeInsets.only(top: 5.0),
//                             //         child: SfRangeSlider(
//                             //           min: 0,
//                             //           max: 1000,
//                             //           values: distanceSlider,
//                             //           interval: 200,
//                             //           showTicks: false,
//                             //           stepSize: 10,
//                             //           shouldAlwaysShowTooltip: true,
//                             //           // thumbShape:  const SfThumbShape(),
//                             //           // tooltipTextFormatterCallback: (v,f){
//                             //           //        return    f.toUpperCase();
//                             //           // },
//                             //           showLabels: false,
//                             //           enableTooltip: true,
//                             //           minorTicksPerInterval: 2,
//                             //           activeColor: ColorManager.mainPrimaryColor4,
//                             //           onChanged: (SfRangeValues values) {
//                             //             setState(() {
//                             //               distanceSlider = values;
//                             //             });
//                             //           },
//                             //         ),
//                             //       ),
//                             //       SizedBox(
//                             //         height: myMediaQuery(context: context).height / 6,
//                             //       ),
//                             //     ],
//                             //   ),
//                             // ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: ColorManager.white,
//                                 borderRadius:
//                                     BorderRadius.circular(AppSize.size10),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   MyElevatedButton(
//                                       height: AppSize.size50,
//                                       width: 120,
//                                       borderWidth: AppSize.size2,
//                                       radius: AppSize.size10,
//                                       fontSize: FontSize.size18,
//                                       onTap: () {},
//                                       buttonName: LocaleKeys.searchButton.tr(),
//                                       borderColor:
//                                           ColorManager.mainPrimaryColor4,
//                                       buttonColor:
//                                           ColorManager.mainPrimaryColor4),
//                                   MyElevatedButton(
//                                       height: AppSize.size50,
//                                       width: 120,
//                                       borderWidth: AppSize.size2,
//                                       radius: AppSize.size10,
//                                       fontSize: FontSize.size18,
//                                       onTap: () {},
//                                       buttonName:
//                                           LocaleKeys.resetButtonText.tr(),
//                                       borderColor:
//                                           ColorManager.mainPrimaryColor4,
//                                       buttonColor:
//                                           ColorManager.mainPrimaryColor4),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 });
//           },
//           child: Container(
//             padding: const EdgeInsets.all(8),
//             decoration: const BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.all(Radius.circular(30))),
//             child: const Icon(Icons.looks_one, color: Colors.white),
//           ),
//         ),
//         subtitle: StepperText("Class Title"),
//       ),
//     ];
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: Text(LocaleKeys.addLessonTitle.tr()),
//         mycolor: ColorManager.mainPrimaryColor4,
//         toolBarHeight: myMediaQuery(context: context).height / 10,
//         isLeading: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 20, left: 20),
//             child: AnotherStepper(
//               stepperList: stepperData,
//               stepperDirection: Axis.horizontal,
//               gap: 20,
//               iconWidth: 40,
//               iconHeight: 40,
//               activeBarColor: Colors.green,
//               inActiveBarColor: Colors.black,
//               activeIndex: 1,
//               barThickness: 8,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   showBottomSheet({required BuildContext context}) {
//     return showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) => SizedBox(
//             height: myMediaQuery(context: context).height / 1.5,
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 fit: StackFit.loose,
//                 children: [
//                   // SingleChildScrollView(
//                   //   child: Column(
//                   //     children: [
//                   //       MyTextFormField(
//                   //         readOnly: false,
//                   //         prefix: Icon(
//                   //           FontAwesomeIcons.idCard,
//                   //           color: ColorManager.mainPrimaryColor4,
//                   //         ),
//                   //         control: teacherNameController,
//                   //         type: TextInputType.name,
//                   //         label: LocaleKeys.teacherName.tr(),
//                   //         isPassword: false,
//                   //         borderColor: ColorManager.textFormBorderColor,
//                   //         labelColor: ColorManager.mainPrimaryColor4,
//                   //         textColor:
//                   //         Theme.of(context).textTheme.bodyText1!.color!,
//                   //         backgroundColor: ColorManager.backGroundColor,
//                   //         onTap: () {},
//                   //         onChanged: (value) {},
//                   //       ),
//                   //       const MyCustomDividerSize5(),
//                   //       MyTextFormField(
//                   //         readOnly: true,
//                   //         control: dateController,
//                   //         isAutoValid: AutovalidateMode.onUserInteraction,
//                   //         type: TextInputType.name,
//                   //         isPassword: false,
//                   //         hint: LocaleKeys.lessonDateHintAndLabelText.tr(),
//                   //         prefix: Icon(
//                   //           FontAwesomeIcons.calendarCheck,
//                   //           color: ColorManager.mainPrimaryColor4,
//                   //         ),
//                   //         onTap: () {
//                   //           showDatePicker(
//                   //               context: context,
//                   //               initialDate: DateTime.now(),
//                   //               firstDate: DateTime.now(),
//                   //               lastDate: DateTime(21160))
//                   //               .then((value) {
//                   //             dateController.text =
//                   //                 DateFormat.yMd().format(value!);
//                   //           }).catchError((error) {});
//                   //         },
//                   //         onSubmit: (value) {},
//                   //         validator: (value) {},
//                   //         onChanged: (value) {},
//                   //         borderColor: ColorManager.grey2,
//                   //         labelColor: ColorManager.mainPrimaryColor4,
//                   //         textColor:
//                   //         Theme.of(context).textTheme.bodyText1!.color!,
//                   //         backgroundColor: ColorManager.backGroundColor,
//                   //       ),
//                   //       const MyCustomDividerSize5(),
//                   //       Padding(
//                   //         padding: const EdgeInsets.only(left: 5.0),
//                   //         child: Row(
//                   //           children: [
//                   //             Expanded(
//                   //                 child: Text(
//                   //                   LocaleKeys.startTime.tr(),
//                   //                   style: getBoldStyle(
//                   //                       color: Theme.of(context)
//                   //                           .textTheme
//                   //                           .bodyText1!
//                   //                           .color!),
//                   //                 )),
//                   //             const SizedBox(
//                   //               width: 10,
//                   //             ),
//                   //             Expanded(
//                   //                 child: Text(LocaleKeys.endTime.tr(),
//                   //                     style: getBoldStyle(
//                   //                         color: Theme.of(context)
//                   //                             .textTheme
//                   //                             .bodyText1!
//                   //                             .color!))),
//                   //           ],
//                   //         ),
//                   //       ),
//                   //       const SizedBox(
//                   //         height: 2,
//                   //       ),
//                   //       Row(
//                   //         children: [
//                   //           Expanded(
//                   //             child: MyTextFormField(
//                   //               readOnly: true,
//                   //               hint: '11:00 Am',
//                   //               suffix: Icons.timer_outlined,
//                   //               suffixIconColor: Theme.of(context)
//                   //                   .textTheme
//                   //                   .subtitle1!
//                   //                   .color!,
//                   //               control: startTimeController,
//                   //               type: TextInputType.number,
//                   //               isPassword: false,
//                   //               borderColor: ColorManager.textFormBorderColor,
//                   //               labelColor: ColorManager.mainPrimaryColor4,
//                   //               textColor: Theme.of(context)
//                   //                   .textTheme
//                   //                   .bodyText1!
//                   //                   .color!,
//                   //               backgroundColor: ColorManager.backGroundColor,
//                   //               onTap: () {
//                   //                 showTimePicker(
//                   //                     context: context,
//                   //                     initialTime: TimeOfDay.now())
//                   //                     .then((value) {
//                   //                   startTimeController.text =
//                   //                       value!.format(context).toString();
//                   //                 }).catchError((error) {});
//                   //               },
//                   //             ),
//                   //           ),
//                   //           const SizedBox(
//                   //             width: 10,
//                   //           ),
//                   //           Expanded(
//                   //             child: MyTextFormField(
//                   //               readOnly: true,
//                   //               hint: '01:00 Pm',
//                   //               suffix: Icons.timer_outlined,
//                   //               suffixIconColor: Theme.of(context)
//                   //                   .textTheme
//                   //                   .subtitle1!
//                   //                   .color!,
//                   //               control: endTimeController,
//                   //               type: TextInputType.number,
//                   //               isPassword: false,
//                   //               borderColor: ColorManager.textFormBorderColor,
//                   //               labelColor: ColorManager.mainPrimaryColor4,
//                   //               textColor: Theme.of(context)
//                   //                   .textTheme
//                   //                   .bodyText1!
//                   //                   .color!,
//                   //               backgroundColor: ColorManager.backGroundColor,
//                   //               onTap: () {
//                   //                 showTimePicker(
//                   //                     context: context,
//                   //                     initialTime: TimeOfDay.now())
//                   //                     .then((value) {
//                   //                   endTimeController.text =
//                   //                       value!.format(context).toString();
//                   //                 }).catchError((error) {});
//                   //               },
//                   //             ),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //       const MyCustomDividerSize5(),
//                   //       MyCustomDropDown(
//                   //           borderColor: ColorManager.textFormBorderColor,
//                   //           focusedBorderColor: ColorManager.mainPrimaryColor4,
//                   //           enableSearch: false,
//                   //           dropDownValueList: lessonType,
//                   //           controller: lessonTypeController,
//                   //           validator: (value) {
//                   //             if (value!.isEmpty) {
//                   //               return LocaleKeys.lessonTypeErrorText.tr();
//                   //             } else {
//                   //               return null;
//                   //             }
//                   //           },
//                   //           label: Text(
//                   //               LocaleKeys.lessonTypeHintAndLabelText.tr())),
//                   //       const MyCustomDividerSize5(),
//                   //       const MyCustomDividerSize5(),
//                   //       Text(
//                   //         LocaleKeys.lessonPriceHintAndLabelText.tr(),
//                   //         style: TextStyle(
//                   //             fontSize: 20, color: ColorManager.error),
//                   //       ),
//                   //       //priceSlider
//                   //       Padding(
//                   //         padding: const EdgeInsets.only(top: 15.0),
//                   //         child: SfRangeSlider(
//                   //           min: 0,
//                   //           max: 1000,
//                   //           values: priceSlider,
//                   //           interval: 200,
//                   //           showTicks: false,
//                   //           stepSize: 10,
//                   //           shouldAlwaysShowTooltip: true,
//                   //           // thumbShape:  const SfThumbShape(),
//                   //           // tooltipTextFormatterCallback: (v,f){
//                   //           //        return    f.toUpperCase();
//                   //           // },
//                   //           showLabels: false,
//                   //           enableTooltip: true,
//                   //           minorTicksPerInterval: 2,
//                   //           activeColor: ColorManager.mainPrimaryColor4,
//                   //           onChanged: (SfRangeValues values) {
//                   //             setState(() {
//                   //               priceSlider = values;
//                   //             });
//                   //           },
//                   //         ),
//                   //       ),
//                   //       const MyCustomDividerSize5(),
//                   //       MyCustomDropDown(
//                   //           borderColor: ColorManager.textFormBorderColor,
//                   //           focusedBorderColor: ColorManager.mainPrimaryColor4,
//                   //           enableSearch: false,
//                   //           dropDownValueList: repeatedType,
//                   //           controller: repeatTypeController,
//                   //           validator: (value) {
//                   //             if (value!.isEmpty) {
//                   //               return LocaleKeys.repetitionHintAndLabelText
//                   //                   .tr();
//                   //             } else {
//                   //               return null;
//                   //             }
//                   //           },
//                   //           label: Text(
//                   //               LocaleKeys.repetitionHintAndLabelText.tr())),
//                   //       const MyCustomDividerSize10(),
//                   //       Text(
//                   //         LocaleKeys.distance.tr(),
//                   //         style: TextStyle(
//                   //             fontSize: 20, color: ColorManager.darkGrey),
//                   //       ),
//                   //       //distanceSlider
//                   //       Padding(
//                   //         padding: const EdgeInsets.only(top: 5.0),
//                   //         child: SfRangeSlider(
//                   //           min: 0,
//                   //           max: 1000,
//                   //           values: distanceSlider,
//                   //           interval: 200,
//                   //           showTicks: false,
//                   //           stepSize: 10,
//                   //           shouldAlwaysShowTooltip: true,
//                   //           // thumbShape:  const SfThumbShape(),
//                   //           // tooltipTextFormatterCallback: (v,f){
//                   //           //        return    f.toUpperCase();
//                   //           // },
//                   //           showLabels: false,
//                   //           enableTooltip: true,
//                   //           minorTicksPerInterval: 2,
//                   //           activeColor: ColorManager.mainPrimaryColor4,
//                   //           onChanged: (SfRangeValues values) {
//                   //             setState(() {
//                   //               distanceSlider = values;
//                   //             });
//                   //           },
//                   //         ),
//                   //       ),
//                   //       SizedBox(
//                   //         height: myMediaQuery(context: context).height / 6,
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: ColorManager.white,
//                       borderRadius: BorderRadius.circular(AppSize.size10),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         MyElevatedButton(
//                             height: AppSize.size50,
//                             width: 120,
//                             borderWidth: AppSize.size2,
//                             radius: AppSize.size10,
//                             fontSize: FontSize.size18,
//                             onTap: () {},
//                             buttonName: LocaleKeys.searchButton.tr(),
//                             borderColor: ColorManager.mainPrimaryColor4,
//                             buttonColor: ColorManager.mainPrimaryColor4),
//                         MyElevatedButton(
//                             height: AppSize.size50,
//                             width: 120,
//                             borderWidth: AppSize.size2,
//                             radius: AppSize.size10,
//                             fontSize: FontSize.size18,
//                             onTap: () {},
//                             buttonName: LocaleKeys.resetButtonText.tr(),
//                             borderColor: ColorManager.mainPrimaryColor4,
//                             buttonColor: ColorManager.mainPrimaryColor4),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
