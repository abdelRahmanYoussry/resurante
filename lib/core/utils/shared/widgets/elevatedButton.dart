// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/components/components.dart';

class MyElevatedButton extends StatelessWidget {
  late double height;
  late double? width = double.infinity;
  double? borderWidth;
  late double? fontSize = 14.0;
  double? radius;
  void Function()? onTap;
  IconData? icon;
  AssetImage? image;
  final Color buttonColor;
  Color? borderColor = Colors.black;
  late Color? textColor;
  final String buttonName;
  bool? condition;
  MyElevatedButton(
      {required this.height,
      this.width,
      this.radius,
      this.fontSize,
      this.icon,
      this.image,
      required this.onTap,
      required this.buttonName,
      required this.buttonColor,
      this.textColor,
      this.condition = true,
      required this.borderColor,
      required this.borderWidth});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: myMediaQuery(context: context).height / 15,
      child: ConditionalBuilder(
        builder: (context) => ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonColor),
              side: MaterialStateProperty.all(
                  BorderSide(color: borderColor!, width: borderWidth!)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 0),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      icon,
                    ),
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: ColorManager.backGroundColor,
                  ),
                ),
              ],
            )),
        fallback: (context) => Center(
          child: CupertinoActivityIndicator(
            color: ColorManager.mainPrimaryColor4,
            radius: 20,
          ),
        ),
        condition: condition!,
      ),
    );
  }
}
