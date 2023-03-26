import 'package:flutter/material.dart';

import '../app/color_manager.dart';
import '../app/values_manager.dart';

class MyCustomDivider extends StatelessWidget {
  const MyCustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: AppSize.size10,
      color: ColorManager.mainPrimaryColor4,
      thickness: AppSize.size1_5,
    );
  }
}
