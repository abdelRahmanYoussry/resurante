// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../core/utils/shared/app/color_manager.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      body: Center(
        child: Text('FinanceScreen'),
      ),
    );
  }
}
