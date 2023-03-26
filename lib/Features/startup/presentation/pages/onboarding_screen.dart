// ignore_for_file: library_private_types_in_public_api, avoid_print, must_be_immutable, use_build_context_synchronously, unused_import

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/shared/app/color_manager.dart';
import '../../../../core/utils/shared/app/font_manager.dart';
import '../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../core/utils/shared/app/values_manager.dart';
import '../../../../core/utils/shared/components/oldComponents/dropDownMenu.dart';
import '../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../core/utils/shared/widgets/loclization_widget.dart';
import '../manager/startup_cubit.dart';
import '../manager/startup_state.dart';
import '../widgets/onboarding_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  var boardingcontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OnBoardingCubit.get(context);
        return Scaffold(
          // backgroundColor: ColorManager.mainPrimaryColor4,
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoclizationWidget(context: context),
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.only(
                      right: AppPadding.padding5,
                    ),
                    child: SizedBox(
                      width: myMediaQuery(context: context).width / 4,
                      height: myMediaQuery(context: context).height / 20,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              ColorManager.mainPrimaryColor4),
                          side: MaterialStateProperty.all(BorderSide(
                              color: ColorManager.mainPrimaryColor1, width: 2)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: ColorManager.backGroundColor,
                          ),
                        ),
                        onPressed: () async {
                          navigateAndFinish(context,
                              routeName: Routes.loginRoute);
                          await cubit.setBoardingBool();
                        },
                      ),
                    )

                    // MyElevatedButton(
                    //   buttonName: LocaleKeys.skip.tr(),
                    //   buttonColor: ColorManager.mainPrimaryColor3,
                    //   onTap: () async {
                    //     navigateAndFinish(context, routeName: Routes.loginRoute);
                    //     await cubit.setBoardingBool();
                    //   },
                    //   height: 0,
                    //   width: AppSize.size68,
                    //   textColor: ColorManager.white,
                    //   borderColor: ColorManager.transparentColor,
                    //   borderWidth: AppSize.size_0,
                    //   radius: AppSize.size70,
                    //   fontSize: FontSize.size14,
                    // ),
                    ),
              ],
            ),
            actions: const [],
            backgroundColor: ColorManager.mainPrimaryColor4,
            elevation: AppSize.size_0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppPadding.padding10),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: boardingcontroller,
                    onPageChanged: (int index) {
                      cubit.changeBoardingIndex(index);
                    },
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildOnBoardingItem(
                      model: cubit.boarding[index],
                      context: context,
                    ),
                    itemCount: cubit.boarding.length,
                  ),
                ),
                const SizedBox(
                  height: AppSize.size70,
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardingcontroller,
                      count: cubit.boarding.length,
                      effect: ExpandingDotsEffect(
                        dotColor: ColorManager.grey1,
                        activeDotColor: ColorManager.mainPrimaryColor3,
                        dotHeight: AppSize.size10,
                        dotWidth: AppSize.size10,
                        spacing: AppSize.size5,
                        expansionFactor: AppSize.size4,
                      ),
                    ),
                    const Text(
                      '',
                      style: TextStyle(
                        fontSize: FontSize.size18,
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: ColorManager.mainPrimaryColor3,
                      onPressed: () async {
                        if (cubit.isLast) {
                          navigateAndFinish(context,
                              routeName: Routes.loginRoute);
                          await cubit.setBoardingBool();
                        } else {
                          boardingcontroller.nextPage(
                            duration: const Duration(
                              milliseconds: AppConstants.sliderAnimation,
                            ),
                            curve: Curves.easeInOutCirc,
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: ColorManager.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
