// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.mycolor,
    required this.title,
    this.routeName,
    required this.toolBarHeight,
    required this.isLeading,
    this.actions,
    this.flexibleSpace,
    this.bottomWidget,
  }) : super(key: key);

  final Color mycolor;
  final Widget title;
  String? routeName;
  final double toolBarHeight;
  final bool isLeading;
  PreferredSize? bottomWidget;
  List<Widget>? actions;
  Widget? flexibleSpace;
  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      title: title,
      leading: isLeading
          ? InkWell(
              onTap: () {
                // if (routeName != null) {
                //   Navigator.popAndPushNamed(context, routeName!);
                // } else {
                Navigator.pop(context);
                // }
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            )
          : const SizedBox(),
      toolbarHeight: toolBarHeight,
      centerTitle: true,
      elevation: 0,
      flexibleSpace: flexibleSpace,
      backgroundColor: mycolor,
      actions: actions,
      bottom: bottomWidget,
    );
  }
}
