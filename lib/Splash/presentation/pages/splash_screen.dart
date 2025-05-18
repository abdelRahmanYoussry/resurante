import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/app/assets_manager.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/strings_manager.dart';

import '../../../core/utils/shared/app/styles_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const AlignmentDirectional(9, 0),
            end: const AlignmentDirectional(0, 7),
            colors: [
              ColorManager.mainPrimaryColor1,
              ColorManager.mainPrimaryColor4,
              ColorManager.mainPrimaryColor1,
              ColorManager.mainPrimaryColor4,
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Center(
              child: Text(
                AppStrings.appName,
                style: getBoldWhite40Style(),
              ),
            ),
            Image.asset(
              ImageAssets.splashLogo2,
              width: 140.w,
              height: 180.h,
              fit: BoxFit.contain,
            ),
            Image.asset(
              ImageAssets.splashLogo1,
              width: 360.w,
              height: 160.h,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
