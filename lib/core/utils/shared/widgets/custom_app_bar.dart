// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required this.mycolor,
    required this.title,
    this.routeName,
    required this.toolBarHeight,
    required this.isLeading,
    this.actions,
    this.updateData,
    this.flexibleSpace,
    this.bottomWidget,
    this.systemUiOverlayStyle,
  });

  final Color mycolor;
  final Widget title;
  String? routeName;
  final double toolBarHeight;
  final bool isLeading;
  bool? updateData;
  PreferredSize? bottomWidget;
  SystemUiOverlayStyle? systemUiOverlayStyle;
  List<Widget>? actions;
  Widget? flexibleSpace;
  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight);
  String getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: systemUiOverlayStyle ??
          const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
          ),
      title: title,
      leading: isLeading
          ? InkWell(
              onTap: () {
                // if (updateData == true) {
                //   Navigator.of(context).maybePop().then((_) {
                //     BlocProvider.of<AuthenticationCubit>(context)
                //         .getTeacherPersonalData();
                //   });
                // } else {
                Navigator.pop(context);
                // }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: ColorManager.textGrey6,
                  borderRadius: BorderRadius.circular(10),
                ),
                // radius: getDeviceType() == 'tablet' ? 30 : 10,
                // backgroundColor: ColorManager.textGrey6,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: getDeviceType() == 'tablet' ? 14.w : 20.w,
                  ),
                ),
              ),
            )
          : const SizedBox(),
      toolbarHeight: 50.h,
      centerTitle: true,
      elevation: 0,
      flexibleSpace: flexibleSpace,
      backgroundColor: mycolor,
      actions: actions,
      bottom: bottomWidget,
    );
  }
}
