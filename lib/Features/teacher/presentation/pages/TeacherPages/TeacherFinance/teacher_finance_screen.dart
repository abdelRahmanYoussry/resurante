// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';

class TeacherFinanceScreen extends StatelessWidget {
  TeacherFinanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      body: Center(
        child: Text('Teacher  Finance Screen'),
      ),
    );
  }
}
