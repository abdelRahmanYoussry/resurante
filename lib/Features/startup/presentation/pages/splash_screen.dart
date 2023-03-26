// ignore_for_file: avoid_unnecessary_containers, unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hassy/Features/authentication/data/data_sources/AuthDataSourse.dart';
import 'package:hassy/core/utils/shared/app/assets_manager.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/app/constant_manager.dart';
import 'package:hassy/core/utils/shared/app/values_manager.dart';
import 'package:hassy/core/utils/shared/app_routes/routes_manager.dart';
import 'package:hassy/core/utils/shared/components/components.dart';

import '../../../../core/utils/shared/app/constant_manager.dart';
import '../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../core/utils/shared/components/components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    displaySplash();
    super.initState();
  }

  displaySplash() {
    Timer(
      const Duration(
        seconds: AppConstants.splashDelay,
      ),
      () async {
        // navigateToRoute(context, routeName: Routes.onBoardingRoute);
        navigateAndFinish(context, routeName: Routes.onBoardingRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainPrimaryColor4,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                    height: AppSize.size100,
                    width: AppSize.size100,
                    child: Center(
                      child: Image(
                        image: AssetImage(ImageAssets.splashLogo),
                      ),
                    )
                    // SizedBox(height: 20.0,),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
