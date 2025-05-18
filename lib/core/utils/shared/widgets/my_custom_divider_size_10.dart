import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app/values_manager.dart';

class MyCustomDividerSize10 extends StatelessWidget {
  const MyCustomDividerSize10({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 10.h);
  }
}

class MyCustomDividerSize50 extends StatelessWidget {
  const MyCustomDividerSize50({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / AppSize.size5,
    );
  }
}

// class MyCustomDividerSize30 extends StatelessWidget {
//   const MyCustomDividerSize30({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       height: AppSize.size30,
//     );
//   }
// }
