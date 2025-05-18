import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';

class MyCustomDividerSizeGrey100 extends StatelessWidget {
  const MyCustomDividerSizeGrey100({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Divider(
        color: ColorManager.dividerColorGrey,
      ),
    );
  }
}
