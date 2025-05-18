// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app/color_manager.dart';
import '../app/styles_manager.dart';

class MyDropDown extends StatelessWidget {
  const MyDropDown({
    super.key,
    required this.controller,
    required this.list,
    required this.label,
    required this.leadingIcon,
    required this.requestFocusOnTap,
    required this.onSelected,
  });
  final TextEditingController controller;
  final List<DropdownMenuEntry> list;
  final Widget label;
  final Widget leadingIcon;
  final bool requestFocusOnTap;
  final Function(dynamic) onSelected;
  String getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: list,
      controller: controller,
      // width: myMediaQuery(context: context).width / 1.1,
      menuHeight: 380.h,
      menuStyle: MenuStyle(
          alignment: Alignment.centerRight,
          backgroundColor: MaterialStateProperty.all(ColorManager.white)),
      textStyle: getDeviceType() == 'tablet'
          ? getRegularBlack9Style()
          : getRegularBlack12Style(),
      label: label,
      enableSearch: false,
      enableFilter: false,
      requestFocusOnTap: false,
      expandedInsets: EdgeInsets.zero,
      onSelected: onSelected,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: ColorManager.textGrey3),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.w, color: ColorManager.textGrey3),
            borderRadius: BorderRadius.circular(8)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 3),
            borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      leadingIcon: leadingIcon,
    );
  }
}
