// import 'package:flutter/material.dart';
//
//
// import '../app/font_manager.dart';
// import '../app/styles_manager.dart';
//
// class MyCustomDropDown extends StatelessWidget {
//   // List<DropDownValueModel> dropDownValueList;
//   late dynamic validator;
//   Widget? label;
//   bool? enableSearch = false;
//   bool isEnable;
//   // Function? onChanged;
//   Function? onTap;
//   bool enableDropDown;
//   Widget? prefix;
//   String? hint;
//   // SingleValueDropDownController controller;
//   AutovalidateMode? isAutoValid = AutovalidateMode.onUserInteraction;
//   final ValueSetter<dynamic>? onChange;
//   MyCustomDropDown({
//     super.key,
//     required this.dropDownValueList,
//     required this.validator,
//     required this.enableDropDown,
//     required this.controller,
//     // this.onChanged,
//     this.hint,
//     this.onTap,
//     this.prefix,
//     this.isEnable = true,
//     this.enableSearch = false,
//     this.onChange,
//     this.isAutoValid = AutovalidateMode.onUserInteraction,
//     required this.label,
//   });
//   String getDeviceType() {
//     final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
//     return data.size.shortestSide < 600 ? 'phone' : 'tablet';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return NewDropDownTextField(
//       isEnabled: enableDropDown,
//       dropDownList: dropDownValueList,
//       textFieldFocusNode: FocusNode(canRequestFocus: true),
//       listSpace: -50,
//       clearOption: true,
//       onChanged: onChange,
//
//       // dropDownItemCount: 100,
//       dropdownRadius: 10,
//
//       controller: controller,
//       // enableSearch: enableSearch!,
//       enableSearch: false,
//       // autovalidateMode: isAutoValid,
//       listTextStyle: getMediumBlack10Style(),
//       dropDownIconProperty: IconProperty(
//         icon: Icons.keyboard_arrow_down,
//         color: enableDropDown ? ColorManager.textGrey7 : ColorManager.unSelectedIconButtonColor,
//       ),
//       validator: validator,
//       clearIconProperty: IconProperty(
//         color: ColorManager.mainPrimaryColor4,
//       ),
//       textFieldDecoration: InputDecoration(
//         contentPadding: const EdgeInsets.all(20),
//         prefixIcon: prefix,
//         hintText: hint,
//         hintStyle: getDeviceType() == 'tablet' ? getRegularGray10Style() : getRegularGray12Style(),
//         disabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: ColorManager.textGrey3, width: 1),
//             borderRadius: BorderRadius.circular(AppSize.size8)),
//         enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: ColorManager.textGrey3, width: 1),
//             borderRadius: BorderRadius.circular(AppSize.size8)),
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: ColorManager.textGrey3, width: 1),
//             borderRadius: BorderRadius.circular(AppSize.size8)),
//         errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.red, width: 2),
//             borderRadius: BorderRadius.circular(AppSize.size8)),
//         focusedErrorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.red, width: 3),
//             borderRadius: BorderRadius.circular(AppSize.size8)),
//         errorStyle: TextStyle(
//           fontSize: FontSize.size12.sp,
//           fontWeight: FontWeight.bold,
//           color: ColorManager.error,
//         ),
//         // errorText: 'Error',
//         label: label,
//         fillColor: Theme.of(context).scaffoldBackgroundColor,
//         filled: true,
//         labelStyle: isEnable ? getBoldBlack12Style() : getRegularGray12Style(),
//       ),
//       textStyle: getDeviceType() == 'tablet' ? getBoldBlack9Style() : getBoldBlack12Style(),
//       dropdownColor: Colors.white,
//       autovalidateMode: isAutoValid,
//       searchShowCursor: false,
//     );
//   }
// }
