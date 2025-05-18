import 'package:flutter/material.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/values_manager.dart';


class MyCustomDivider extends StatelessWidget {
  const MyCustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: AppSize.size10,
      color: ColorManager.mainPrimaryColor4,
      thickness: AppSize.size1_5,
    );
  }
}
