import 'package:flutter/material.dart';


import '../app/color_manager.dart';
import '../app/font_manager.dart';
import '../app/styles_manager.dart';
import '../app/values_manager.dart';

class MyTextButton extends StatelessWidget {
  MyTextButton({
    Key? key,
    this.width = double.infinity,
    this.height = AppSize.size40,
    required this.text,
    required this.function,
    this.fontSize,
    this.background,
    this.textHeight = 0.15,
    this.fontWeight = FontWeightManager.bold,
    this.radius = AppSize.size10,
    this.isUppercase = false,
    required this.textColor,
  }) : super(key: key);
  double width;
  Color? background = ColorManager.primary;
  bool isUppercase = true;
  double radius = AppSize.size10;
  double? height = AppSize.size40;
  double? fontSize = FontSize.size14;
  double? textHeight = 0.0;
  FontWeight? fontWeight = FontWeightManager.bold;
  Color textColor = ColorManager.primary;
  Function()? function;
  String text;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Container(
          // width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: background,
          ),
          child: MaterialButton(
            onPressed: function,
            padding: EdgeInsets.zero,
            height: height,
            child: Text(isUppercase ? text.toUpperCase() : text,
                overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.end,
                style: getBoldBlue14style()
                // textScaleFactor: 1.0,
                ),
          ),
        ),
      ],
    );
  }
}
