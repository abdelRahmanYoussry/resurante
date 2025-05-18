import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app/color_manager.dart';
import '../app/font_manager.dart';
import '../app/values_manager.dart';
import '../translations/locale_keys.g.dart';

class DropDownMultiSelect extends StatelessWidget {
  DropDownMultiSelect({
    Key? key,
    required this.dropDownController,
    required this.list,
    required this.label,
    this.validator,
    this.onChanged,
  }) : super(key: key);
  final MultiValueDropDownController dropDownController;
  final List<DropDownValueModel> list;
  late dynamic validator;
  // late dynamic intialValue;
  Widget? label;
  Function? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropDownTextField.multiSelection(
      controller: dropDownController,
      validator: validator,
      submitButtonText: LocaleKeys.choose.tr(),
      submitButtonColor: ColorManager.mainPrimaryColor4,
      submitButtonTextStyle: TextStyle(color: ColorManager.white),
      // dropDownItemCount: 5,
      isEnabled: true,
      listTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        locale: context.locale,
        fontWeight: FontWeight.bold,
      ),
      textStyle: TextStyle(color: Colors.black, locale: context.locale),
      // dropdownRadius: 10,
      dropDownList: list,
      // listSpace: -290,
      checkBoxProperty:
          CheckBoxProperty(activeColor: ColorManager.mainPrimaryColor4),
      textFieldDecoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManager.unSelectedIconButtonColor, width: 1),
          borderRadius: BorderRadius.circular(AppSize.size10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.textGrey3, width: 1),
          borderRadius: BorderRadius.circular(AppSize.size10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.textGrey3, width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 3),
        ),
        errorStyle: TextStyle(
          fontSize: FontSize.size12.sp,
          fontWeight: FontWeight.bold,
          color: ColorManager.error,
        ),
        label: label,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        filled: true,
        labelStyle: TextStyle(
          fontSize: 18.sp,
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
      ),
      dropDownIconProperty: IconProperty(
        color: ColorManager.textGrey4,
        icon: Icons.keyboard_arrow_down_outlined,
      ),
      // onChanged: (value) {
      //   onChanged!(value);
      // },
      onChanged: (value) {
        onChanged!(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // dropdownColor: const Color(
      //   0XffFAF9F6,
      // ),

      displayCompleteItem: false,
    );
  }
}
