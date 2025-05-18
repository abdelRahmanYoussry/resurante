import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';

import '../app/styles_manager.dart';
import '../app/values_manager.dart';
import 'loading_progress_widget.dart';

class MyElevatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderWidth;
  final double? fontSize;
  final double? radius;
  final void Function()? onTap;
  final IconData? icon;
  final Color? iconColor;
  final AssetImage? image;
  final Color buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final String buttonName;
  final bool condition;
  final bool changeColor;
  final TextStyle? buttonTextStyle;
  final MainAxisAlignment? mainAxisAlignment;

  const MyElevatedButton({
    super.key,
    this.height = 55,
    this.width,
    this.radius = AppSize.size10,
    this.fontSize = 14.0,
    this.icon,
    this.image,
    this.iconColor,
    this.mainAxisAlignment,
    required this.onTap,
    required this.buttonName,
    required this.buttonColor,
    this.textColor = Colors.white,
    this.changeColor = false,
    this.condition = true,
    this.buttonTextStyle,
    required this.borderColor,
    required this.borderWidth,
  });

  String getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  @override
  Widget build(BuildContext context) {
    // Show loading widget if `condition` is false
    if (!condition) {
      return const LoadingWidget();
    }

    return SizedBox(
      width: width ?? 328.w,
      height: height?.h ?? 55.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          side: BorderSide(color: borderColor!, width: borderWidth!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: iconColor ?? ColorManager.white,
                size: getDeviceType() == 'tablet' ? 45 : 25,
              ),
            if (image != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: image!,
                  fit: BoxFit.cover,
                  width: 20,
                ),
              ),
            Text(
              buttonName,
              style: buttonTextStyle ?? getMediumWhite20Style(),
            ),
          ],
        ),
      ),
    );
  }
}
