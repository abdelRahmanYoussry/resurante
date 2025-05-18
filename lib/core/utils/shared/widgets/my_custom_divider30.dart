import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomDividerSize30 extends StatelessWidget {
  const MyCustomDividerSize30({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      // height: MediaQuery.of(context).size.height / AppSize.size70,
    );
  }
}
