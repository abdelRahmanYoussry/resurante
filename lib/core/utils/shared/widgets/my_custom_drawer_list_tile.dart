import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/styles_manager.dart';

class MyCustomDrawerListTile extends StatelessWidget {
  MyCustomDrawerListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final String icon;
  final String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        minVerticalPadding: 20.h,
        leading: Container(
            width: 48.w,
            height: 48.h,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: ShapeDecoration(
              color: const Color(0xFFF4F6FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: SvgPicture.asset(
              height: 60.h,
              width: 60.w,
              fit: BoxFit.contain,
              icon,
            )),
        title: Text(
          title,
          style: getMediumBlack14Style(),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: ColorManager.textGrey,
        ),
        onTap: onTap,
      ),
    );
  }
}
