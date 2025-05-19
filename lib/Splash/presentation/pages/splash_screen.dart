import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/app/assets_manager.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app_routes/routes_manager.dart';
import 'package:resturente/core/utils/shared/components/components.dart';

import '../../../core/utils/shared/app/strings_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
   navigateAndFinish(context, routeName: Routes.mainScreen);
    });
  }
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
            Positioned(
              top: 282.h, // adjust as needed
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  AppStrings.appName,
                  style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
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
