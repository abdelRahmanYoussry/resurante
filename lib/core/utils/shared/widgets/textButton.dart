// ignore: file_names
// ignore_for_file: must_be_immutable, file_names, duplicate_ignore

import 'package:flutter/material.dart';

import '../app/color_manager.dart';
import '../app/font_manager.dart';
import '../app/styles_manager.dart';
import '../app/values_manager.dart';

class MyTextButton extends StatelessWidget {
  MyTextButton(
      {Key? key,
      this.width = double.infinity,
      this.height = AppSize.size40,
      required this.text,
      required this.function,
      this.background,
      this.radius = AppSize.size10,
      this.isuppercase = false,
      required this.textColor})
      : super(key: key);
  double width;
  Color? background = ColorManager.primary;
  bool isuppercase = true;
  double radius = AppSize.size10;
  double height = AppSize.size40;
  Color textColor = ColorManager.primary;
  Function()? function;
  String text;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: background,
          ),
          child: MaterialButton(
            onPressed: function,
            height: height,
            child: Text(
              isuppercase ? text.toUpperCase() : text,
              overflow: TextOverflow.ellipsis,
              style: getBoldStyle(
                fontSize: FontSize.size16,
                color: textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
