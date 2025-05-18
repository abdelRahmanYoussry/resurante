//Static DropDownValue Model & ui
// List<DropDownValueModel> educationSystem = [
//   DropDownValueModel(name: 'Governmental', value: '1'),
//   DropDownValueModel(name: 'Arabic Experimental', value: '2'),
//   DropDownValueModel(name: 'Experimental Languages', value: '3'),
//   DropDownValueModel(name: 'Private', value: '4'),
//   DropDownValueModel(name: 'International', value: '5'),
//   DropDownValueModel(name: 'International', value: '5'),
//   DropDownValueModel(name: 'International', value: '5'),
//   DropDownValueModel(name: 'International', value: '5'),
// ];
// List<DropDownValueModel> educationLevel = [
//   DropDownValueModel(name: 'Primary', value: '1'),
//   DropDownValueModel(name: 'Preparatory', value: '2'),
//   DropDownValueModel(name: 'Secondary', value: '3'),
// ];
//
//
// List<DropDownValueModel> gradeLevel = [
//   DropDownValueModel(name: 'Fifth', value: '1'),
//   DropDownValueModel(name: 'Fourth', value: '2'),
//   DropDownValueModel(name: 'Third', value: '3'),
//   DropDownValueModel(name: 'Primary', value: '4'),
//   DropDownValueModel(name: 'KG', value: '5'),
//   DropDownValueModel(name: 'First', value: '6'),
//   DropDownValueModel(name: 'Sixth', value: '7'),
// ];
// List<DropDownValueModel> educationLanguage = [
//   DropDownValueModel(name: 'Arabic', value: '1'),
//   DropDownValueModel(name: 'Math', value: '2'),
//   DropDownValueModel(name: 'Science', value: '3'),
//   DropDownValueModel(name: 'Social', value: '4'),
//   DropDownValueModel(name: 'English', value: '5'),
//   DropDownValueModel(name: 'French', value: '6'),
//   DropDownValueModel(name: 'Germany', value: '7'),
//   DropDownValueModel(name: 'Chemistry', value: '8'),
//   DropDownValueModel(name: 'Physics', value: '9'),
// ];
// MyCustomDropDown(
//     isAutoValid: AutovalidateMode.onUserInteraction,
//     enableSearch: false,
//     enableDropDown: false,
//     dropDownValueList: educationLanguage,
//     controller: educationLanguageController,
//     validator: (value) {
//       if (value!.isEmpty) {
//         return LocaleKeys.educationMaterialError.tr();
//       } else {
//         return null;
//       }
//     },
//     label: Text(LocaleKeys.educationMaterial.tr())),

// void showToast({required String text, required ToastState state}) {
//   fToast = FToast();
//   fToast!.init(NavigationService.navigatorKey.currentContext!);
//
//   FToast().showToast(
//     child: Container(
//       width:
//           myMediaQuery(context: NavigationService.navigatorKey.currentContext!)
//               .width,
//       height: AppSize.size50.h,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
//       clipBehavior: Clip.antiAlias,
//       decoration: ShapeDecoration(
//         gradient: LinearGradient(
//           begin: const Alignment(1.00, -0.08),
//           end: const Alignment(-1, 0.08),
//           colors: state == ToastState.Success
//               ? [const Color(0xFF32BA71), const Color(0xFF2A9D8F)]
//               : [const Color(0xFFF6743E), const Color(0xFFD42424)],
//         ),
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//               width: 1,
//               color: state == ToastState.Success
//                   ? const Color(0xFF43D590)
//                   : const Color(0xFFF0863A)),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       child: Text(
//         text,
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 14,
//           fontFamily: 'DIN Next LT Arabic',
//           fontWeight: FontWeight.w700,
//           height: 1.3,
//         ),
//       ),
//     ),
//     toastDuration: const Duration(seconds: 2),
//     positionedToastBuilder: (context, child) {
//       return Positioned(
//         // top: 16.0,
//         bottom: 10.0,
//         width: myMediaQuery(
//                 context: NavigationService.navigatorKey.currentContext!)
//             .width,
//         child: child,
//       );
//     },
//   );
// }

// showLessonDetailsBottomCheat(
//     {required BuildContext context,
//     required FilterClassesData filterClassesData}) {
//   return showModalBottomSheet(
//     isScrollControlled: true,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         top: Radius.circular(20),
//       ),
//     ),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     context: context,
//     builder: (context) {
//       return StatefulBuilder(
//         builder: (context, setState) => Container(
//           height: 400.h,
//           color: Theme.of(context).scaffoldBackgroundColor,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 300.h,
//                   // color: ColorManager.mainPrimaryColor4.withOpacity(0.1),
//                   child: SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     child: Column(
//                       children: [
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Center(
//                           child: Text(
//                             LocaleKeys.lessonDetailsText.tr(),
//                             style: getBoldBlack24Style(
//                                 // color: Theme.of(context)
//                                 //     .textTheme
//                                 //     .headlineMedium!
//                                 //     .color,
//                                 // fontSize: FontSize.size22.sp,
//                                 ),
//                           ),
//                         ),
//                         const MyCustomDividerSize5(),
//                         ClassesReserveDetailsWidget(
//                           classTitleString:
//                               '${LocaleKeys.classMaterialNameText.tr()} :',
//                           classNoteString: filterClassesData.materialName!,
//                           classNoteColor: ColorManager.mainPrimaryColor4,
//                         ),
//                         const MyCustomDividerSize5(),
//                         ClassesReserveDetailsWidget(
//                           classTitleString:
//                               '${LocaleKeys.classTeacherNameText.tr()} :',
//                           classNoteString: filterClassesData.teacherName!,
//                           classNoteColor: ColorManager.mainPrimaryColor4,
//                         ),
//                         const MyCustomDividerSize5(),
//                         ClassesReserveDetailsWidget(
//                           classTitleString:
//                               '${LocaleKeys.lessonTitleMainTextAndLabel.tr()} :',
//                           classNoteString: filterClassesData.title!,
//                           classNoteColor: ColorManager.mainPrimaryColor4,
//                         ),
//                         const MyCustomDividerSize5(),
//                         ClassesReserveDetailsWidget(
//                           classTitleString: '${LocaleKeys.maxCount.tr()} :',
//                           classNoteString:
//                               filterClassesData.maxStudentCount.toString(),
//                           classNoteColor: ColorManager.mainPrimaryColor4,
//                         ),
//                         const MyCustomDividerSize5(),
//                         ClassesReserveDetailsWidget(
//                           classTitleString:
//                               '${LocaleKeys.lessonPriceHintAndLabelText.tr()} :',
//                           maxTextLines: 2,
//                           classNoteString:
//                               '${filterClassesData.netPrice} EGP',
//                           classNoteColor: ColorManager.mainPrimaryColor4,
//                         ),
//                         const MyCustomDividerSize5(),
//                         ClassesReserveDetailsWidget(
//                           classTitleString:
//                               '${LocaleKeys.noteAddressAndHintLabel.tr()} :',
//                           maxTextLines: 2,
//                           classNoteString: filterClassesData.description!,
//                           classNoteColor: ColorManager.mainPrimaryColor4,
//                         ),
//                         const MyCustomDividerSize5(),
//                         ClassesReserveDetailsWidget(
//                           classTitleString: '${LocaleKeys.date.tr()} :',
//                           classNoteString:
//                               DateFormat('yyyy-MM-dd', ApiConstance.lang())
//                                   .format(filterClassesData.lessonDate!)
//                                   .toString(),
//                           classNoteColor: ColorManager.mainPrimaryColor4,
//                         ),
//                         const MyCustomDividerSize5(),
//                         InkWell(
//                           onTap: () {
//                             // navigateToWithoutRoute(context,
//                             //     widget: StudentsSessionsMapScreen(
//                             //       book: true,
//                             //       filterClassesData: widget.model,
//                             //       lat: double.parse(widget.model.latitude!),
//                             //       lon: double.parse(widget.model.longitude!),
//                             //       myMarker: myMarker,
//                             //       title: widget.model.title!,
//                             //     ));
//                           },
//                           child: SizedBox(
//                               width:
//                                   myMediaQuery(context: context).width / 1.2,
//                               height: 100,
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.horizontal(
//                                   right: Radius.circular(20),
//                                   left: Radius.circular(20),
//                                 ),
//                                 child: GoogleMap(
//                                     zoomControlsEnabled: false,
//                                     zoomGesturesEnabled: false,
//                                     mapType: MapType.normal,
//                                     // indoorViewEnabled: true,
//                                     // padding: EdgeInsets.all(10),
//                                     onMapCreated: (controller) {
//                                       debugPrint('Teeeeeeeeeeeeeeeeeet');
//
//                                       // _controller.(controller);
//                                     },
//                                     // liteModeEnabled: true,
//                                     markers: myMarker,
//                                     onTap: (latLong) {
//                                       // navigateToWithoutRoute(context,
//                                       //     widget: StudentsSessionsMapScreen(
//                                       //       book: true,
//                                       //       filterClassesData: widget.model,
//                                       //       lat: latLong.latitude,
//                                       //       lon: latLong.longitude,
//                                       //       myMarker: myMarker,
//                                       //       title: widget.model.title!,
//                                       //     ));
//                                     },
//                                     initialCameraPosition: CameraPosition(
//                                         target: LatLng(
//                                             double.parse(
//                                                 widget.model.latitude!),
//                                             double.parse(
//                                                 widget.model.longitude!)),
//                                         zoom: 16)),
//                               )),
//                         ),
//                         const MyCustomDividerSize5(),
//                         Row(
//                           // alignment: myLocale == 'ar'
//                           //     ? Alignment.centerLeft
//                           //     : Alignment.centerRight,
//                           children: [
//                             Text(
//                               '${LocaleKeys.classPlaceText.tr()} :',
//                               style: TextStyle(
//                                   color: Theme.of(context)
//                                       .textTheme
//                                       .headlineMedium!
//                                       .color,
//                                   fontSize: 16.sp),
//                             ),
//                             Text(
//                               filterClassesData.teacherPlaceName!,
//                               maxLines: 2,
//                               style: TextStyle(
//                                   color: ColorManager.mainPrimaryColor4,
//                                   fontSize: 16.sp),
//                             ),
//                             Icon(
//                               Icons.map_outlined,
//                               size: 25,
//                               color: ColorManager.mainPrimaryColor4,
//                             ),
//                           ],
//                         ),
//                         const MyCustomDividerSize5(),
//                         Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             const Spacer(),
//                             Container(
//                               width: myMediaQuery(context: context).width / 4,
//                               height: 50,
//                               padding: const EdgeInsets.all(2),
//                               decoration: BoxDecoration(
//                                 // color: ColorManager.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(
//                                   color: ColorManager.mainPrimaryColor4,
//                                   width: AppSize.size1_5,
//                                 ),
//                               ),
//                               child: ClassesReserveDetailsWidget(
//                                 classTitleString: '',
//                                 // LocaleKeys.classTimeFromTimeText.tr(),
//                                 classNoteString:
//                                     DateFormat.jm(ApiConstance.lang())
//                                         .format(filterClassesData.fromTime!),
//                                 classNoteColor: Theme.of(context)
//                                     .textTheme
//                                     .headlineMedium!
//                                     .color!,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Container(
//                               width: myMediaQuery(context: context).width / 4,
//                               height: 50,
//                               padding: const EdgeInsets.all(2),
//                               decoration: BoxDecoration(
//                                 // color: ColorManager.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(
//                                   color: ColorManager.mainPrimaryColor4,
//                                   width: AppSize.size1_5,
//                                 ),
//                               ),
//                               child: ClassesReserveDetailsWidget(
//                                   classTitleString: '',
//                                   // LocaleKeys.classTimeToTimeText.tr(),
//                                   classNoteString:
//                                       DateFormat.jm(ApiConstance.lang())
//                                           .format(filterClassesData.toTime!),
//                                   classNoteColor: Theme.of(context)
//                                       .textTheme
//                                       .headlineMedium!
//                                       .color!),
//                             ),
//                             const Spacer(),
//                           ],
//                         ),
//                         const MyCustomDividerSize10(),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 MyElevatedButton(
//                   textColor: ColorManager.textFormBorderColor,
//                   radius: 10,
//                   fontSize: 18.sp,
//                   height: 50.h,
//                   width: myMediaQuery(context: context).width / 1.50,
//                   borderColor: ColorManager.mainPrimaryColor4,
//                   onTap: () {
//                     // navigateTo(context,
//                     //     routeName: Routes.studentPaymentRoute);
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => StudentPaymentScreen(
//                                   filterClassesData: widget.model,
//                                 )));
//                   },
//                   borderWidth: 2,
//                   buttonName: LocaleKeys.reserve.tr(),
//                   buttonColor: ColorManager.mainPrimaryColor4,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
