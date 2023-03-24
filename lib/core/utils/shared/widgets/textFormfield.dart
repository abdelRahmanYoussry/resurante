// ignore_for_file: file_names, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/app/font_manager.dart';
import 'package:hassy/core/utils/shared/app/values_manager.dart';

import '../../../../Features/home/presentation/manager/home_cubit.dart';

class MyTextFormField extends StatelessWidget {
  late bool readOnly = false;
  final TextEditingController control;
  final TextInputType type;
  late dynamic validator;
  Function? onSubmit;
  Function? onChanged;
  Function()? onTap;
  late bool isPassword = false;
  bool? isEnabled = false;
  String? label;
  String? hint;
  Widget? prefix;
  IconData? suffix;
  Function()? suffixClicked;
  TextStyle? hintStyle = TextStyle(
    color: ColorManager.textFormBorderColor,
    fontSize: FontSize.size12,
  );
  Color borderColor = Colors.grey;
  Color labelColor = ColorManager.mainPrimaryColor3;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.blueGrey;
  Color? prefixIconColor = Colors.limeAccent;
  Color? suffixIconColor = ColorManager.mainPrimaryColor4;
  String? textInputFormat;
  AutovalidateMode? isAutoValid;
  int maxText = 1;

  MyTextFormField(
      {Key? key,
      required this.readOnly,
      required this.control,
      this.hint,
      required this.type,
      this.validator,
      this.onSubmit,
      this.onChanged,
      this.onTap,
      required this.isPassword,
      this.isEnabled,
      this.label,
      this.prefix,
      this.suffix,
      this.maxText = 1,
      this.suffixClicked,
      this.textInputFormat,
      this.hintStyle,
      this.isAutoValid})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: const [
        // FilteringTextInputFormatter.allow(RegExp('$textInputFormat')),
      ],
      readOnly: readOnly,
      autovalidateMode: isAutoValid,
      maxLines: maxText,
      controller: control,
      keyboardType: type,
      validator: validator,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onTap: () {
        onTap!();
      },
      obscureText: isPassword,
      enabled: isEnabled,
      onChanged: (value) {
        onChanged!(value);
      },
      style: TextStyle(
        //textColor
        color: Theme.of(context).textTheme.bodyText1!.color,
        fontSize: FontSize.size16,
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          // fontSize: FontSize.size10,
          color: ColorManager.error,
        ),
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        filled: true,
        labelText: label,
        hintText: hint,
        // labelColor
        labelStyle: TextStyle(
            color: HomeCubit.get(context).isDark
                ? ColorManager.white
                : ColorManager.mainPrimaryColor4,
            height: 1.5,
            fontSize: FontSize.size14),
        hintStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
            height: 1.5,
            fontSize: FontSize.size12),
        prefixIcon: prefix,
        prefixIconColor: HomeCubit.get(context).isDark
            ? ColorManager.white
            : ColorManager.mainPrimaryColor4,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixClicked!();
                },
                icon: Icon(suffix,
                    // suffixIconColor
                    color: ColorManager.mainPrimaryColor4),
              )
            : null,
        // Theme.of(context).backgroundColor
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.bodyText1!.color!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppSize.size10),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).textTheme.bodyText1!.color!, width: 2),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 3),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
