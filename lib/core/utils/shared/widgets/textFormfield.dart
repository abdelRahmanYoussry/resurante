import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/font_manager.dart';
import 'package:resturente/core/utils/shared/app/styles_manager.dart';

class MyTextFormField extends StatelessWidget {
  late bool readOnly = false;
  final TextEditingController control;
  final TextInputType type;
  late dynamic validator;
  Function? onSubmit;
  Function? onChanged;
  double? contentPadding;
  Function()? onTap;
  late bool isPassword = false;
  bool? isEnabled = false;
  bool? alignLabelWithHint = true;
  String? label;
  String? hint;
  Widget? prefix;
  IconData? suffix;
  String? svgImage;
  Function()? suffixClicked;
  TextStyle? hintStyle = getRegularGray14Style();
  Color borderColor = Colors.grey;
  Color labelColor = ColorManager.mainPrimaryColor3;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.blueGrey;
  Color? prefixIconColor = Colors.limeAccent;
  Color? suffixIconColor = ColorManager.mainPrimaryColor4;
  String? textInputFormat;
  AutovalidateMode? isAutoValid;
  TextAlign textAlign;
  int? maxText;

  MyTextFormField({
    super.key,
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
    this.alignLabelWithHint,
    this.maxText,
    this.suffixClicked,
    this.textAlign = TextAlign.start,
    this.textInputFormat,
    this.hintStyle,
    this.svgImage,
    this.contentPadding,
    this.isAutoValid,
  });
  String getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: const [
        // FilteringTextInputFormatter.allow(RegExp('$textInputFormat')),
      ],
      readOnly: readOnly,
      autovalidateMode: isAutoValid,
      // textAlignVertical: TextAlignVertical.center,
      textAlign: textAlign,
      // onTapOutside: (event) => FocusScope.of(context).unfocus(),
      maxLines: maxText ?? 1,
      controller: control,
      keyboardType: type,
      validator: validator,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onTap: onTap,
      obscureText: isPassword,
      enabled: isEnabled,
      onChanged: (value) {
        onChanged!(value);
      },
      style: getDeviceType() == 'tablet'
          ? getBoldBlack16Style()
          : getBoldBlack14Style(),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(contentPadding ?? 20.0),
        errorStyle: TextStyle(
          fontSize: getDeviceType() == 'tablet'
              ? FontSize.size12.sp
              : FontSize.size10.sp,
          fontWeight: FontWeight.bold,
          color: ColorManager.error,
        ),
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        filled: true,
        labelText: label,
        hintText: hint,
        labelStyle: getDeviceType() == 'tablet'
            ? getBoldBlack14Style()
            : getBoldBlack12Style(),
        hintStyle: hintStyle ?? getRegularGray12Style(),
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixClicked!();
                },
                icon: svgImage != null
                    ? SvgPicture.asset(svgImage!)
                    : Icon(
                        suffix,
                        color: ColorManager.textGrey,
                      ),
              )
            : null,
        // Theme.of(context).backgroundColor
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
        alignLabelWithHint: alignLabelWithHint,
      ),
    );
  }
}
