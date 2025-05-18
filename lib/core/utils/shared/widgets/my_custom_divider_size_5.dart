import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomDividerSize5 extends StatelessWidget {
  const MyCustomDividerSize5({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      // height: MediaQuery.of(context).size.height / AppSize.size70,
    );
  }
}
