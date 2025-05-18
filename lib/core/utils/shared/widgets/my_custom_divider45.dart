import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomDividerSize45 extends StatelessWidget {
  const MyCustomDividerSize45({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      // height: MediaQuery.of(context).size.height / AppSize.size70,
    );
  }
}
