import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';

class ClassesMainDivider extends StatelessWidget {
  const ClassesMainDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 10.0, end: 10.0),
      child: Container(
        width: double.infinity,
        height: 10,
        color: ColorManager.textFormBorderColor.withOpacity(0.1),
      ),
    );
  }
}
