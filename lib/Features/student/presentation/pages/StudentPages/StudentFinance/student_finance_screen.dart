// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';

class StudentFinanceScreen extends StatelessWidget {
  const StudentFinanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      body: Center(
        child: Text('Student  Finance Screen'),
      ),
    );
  }
}
