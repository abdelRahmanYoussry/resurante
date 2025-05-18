import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomDividerSize20 extends StatelessWidget {
  const MyCustomDividerSize20({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      // height: MediaQuery.of(context).size.height / AppSize.size70,
    );
  }
}
