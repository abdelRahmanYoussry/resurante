// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/utils/shared/app/color_manager.dart';
import '../../../../core/utils/shared/app/font_manager.dart';
import '../../../../core/utils/shared/app/styles_manager.dart';

class ClassesReserveDetailsWidget extends StatelessWidget {
  ClassesReserveDetailsWidget(
      {Key? key,
      required this.classTitleString,
      required this.classNoteString,
      this.maxTextLines,
      required this.classNoteColor})
      : super(key: key);
  final String classTitleString;
  final String classNoteString;
  int? maxTextLines;
  final Color classNoteColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          classTitleString,
          style: getBoldStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSize.size18,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            classNoteString,
            maxLines: maxTextLines,
            overflow: TextOverflow.ellipsis,
            style: getBoldStyle(
              color: classNoteColor,
              fontSize: FontSize.size16,
            ),
          ),
        ),
      ],
    );
  }
}
