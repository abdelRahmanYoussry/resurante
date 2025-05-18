import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app/color_manager.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget(
      {super.key,
      required this.isChecked,
      required this.onChanged,
      required this.borderColor});

  final bool isChecked;
  final Color borderColor;
  final ValueChanged<bool?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: SizedBox(
        width: 24.w,
        height: 24.h,
        child: Transform.scale(
          scale: 0.8,
          child: Checkbox(
            value: isChecked,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: ColorManager.mainBlue,
              ),
              borderRadius: BorderRadius.circular(1),
            ),
            activeColor: ColorManager.mainPrimaryColor4,
            side: WidgetStateBorderSide.resolveWith(
              (states) => BorderSide(
                width: 1.50,
                color: borderColor,
              ),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            fillColor: WidgetStateColor.resolveWith(
              (states) => ColorManager.white,
            ),
            checkColor: ColorManager.mainBlue,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
