import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';

class EmptyTextWidget extends StatelessWidget {
  const EmptyTextWidget({super.key, required this.title, this.color});

  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: color ?? ColorManager.grey1.withOpacity(0.8),
      ),
    );
  }
}
