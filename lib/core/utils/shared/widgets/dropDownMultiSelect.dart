// ignore_for_file: file_names, must_be_immutable, deprecated_member_use

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app/color_manager.dart';
import '../app/values_manager.dart';
import '../translations/locale_keys.g.dart';

class DropDownMultiSelect extends StatelessWidget {
  DropDownMultiSelect({
    Key? key,
    required this.multiValueDropDownController,
    required this.list,
    required this.label,
    this.validator,
    this.onChanged,
  }) : super(key: key);
  final MultiValueDropDownController multiValueDropDownController;
  final List<DropDownValueModel> list;
  late dynamic validator;
  late dynamic intialValue;
  Widget? label;
  Function? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropDownTextField.multiSelection(
        controller: multiValueDropDownController,
        validator: validator,
        submitButtonText: LocaleKeys.choose.tr(),
        submitButtonColor: Colors.transparent,
        submitButtonTextStyle: TextStyle(color: ColorManager.mainPrimaryColor4),
        dropDownItemCount: 5,
        listTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 14,
          locale: context.locale,
          fontWeight: FontWeight.bold,
        ),
        textStyle: TextStyle(color: Colors.black, locale: context.locale),
        dropdownRadius: 10,
        dropDownList: list,
        textFieldDecoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.unSelectedIconButtonColor, width: 1),
            borderRadius: BorderRadius.circular(AppSize.size10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).textTheme.bodyText1!.color!, width: 1),
            borderRadius: BorderRadius.circular(AppSize.size10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).textTheme.bodyText1!.color!, width: 2),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 3),
          ),
          errorStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          label: label,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          filled: true,
          labelStyle: TextStyle(
              fontSize: 18,
              color: Theme.of(context).textTheme.subtitle1!.color),
        ),
        dropDownIconProperty:
            IconProperty(color: Theme.of(context).textTheme.subtitle1!.color),
        onChanged: (value) {
          onChanged!(value);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        dropdownColor: const Color(0XffFAF9F6));
  }
}
