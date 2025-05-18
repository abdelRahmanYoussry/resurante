// ignore_for_file: prefer_final_fields, must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/styles_manager.dart';
import 'package:resturente/core/utils/shared/widgets/svg_widget.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     //let's add some padding press alt enter
      //     SizedBox(
      //       height: 10.h,
      //     ),
      //     Container(
      //       padding: const EdgeInsets.symmetric(horizontal: 10),
      //       child: Row(
      //         children: [
      //           StepperComponent(
      //             currentIndex: _currentIndex,
      //             index: 0,
      //             onTap: () {
      //               setState(() {
      //                 _currentIndex = 0;
      //               });
      //               _pageController.jumpToPage(0);
      //             },
      //           ),
      //           StepperComponent(
      //             currentIndex: _currentIndex,
      //             index: 1,
      //             onTap: () {
      //               setState(() {
      //                 _currentIndex = 1;
      //               });
      //               _pageController.jumpToPage(1);
      //             },
      //           ),
      //           StepperComponent(
      //             currentIndex: _currentIndex,
      //             index: 2,
      //             onTap: () {
      //               setState(() {
      //                 _currentIndex = 2;
      //               });
      //               _pageController.jumpToPage(2);
      //             },
      //           ),
      //           StepperComponent(
      //             currentIndex: _currentIndex,
      //             index: 3,
      //             isLast: true,
      //             onTap: () {
      //               setState(() {
      //                 _currentIndex = 3;
      //               });
      //               _pageController.jumpToPage(3);
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //         child: PageView.builder(
      //             //only scroll with bubbles
      //             physics: const NeverScrollableScrollPhysics(),
      //             controller: _pageController,
      //             itemCount: 4,
      //             itemBuilder: (context, index) {
      //               return Center(
      //                 child: Text('Page $index'),
      //               );
      //             })),
      //   ],
      // ),
    );
  }
}

class StepperComponent extends StatelessWidget {
  // index describe the position of our bubble
  int index;
  //currentIndex is index that is gonna change on Tap
  int currentIndex;
  //onTap CallBack
  VoidCallback onTap;
  String imageName;
  String changedImageName;
  String stepTitle;
  bool isLast;
  bool isActive;
  StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    required this.imageName,
    required this.stepTitle,
    required this.changedImageName,
    required this.isActive,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    //now let's remove the line at the end of the row but also we need to remove unnecessary padding thus we need to remove the expanded
    //widget
    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  //this is the bubble
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 70,
                      height: 56,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: isActive
                            ? ColorManager.mainPrimaryColor4
                            : ColorManager.mainObjectsBackGroundColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isActive
                              ? ColorManager.mainPrimaryColor4
                              : ColorManager.mainObjectsBackGroundColor,
                        ),
                      ),
                      child: SvgWidget(
                        imagePath: isActive ? imageName : changedImageName,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: isActive
                        ? ColorManager.mainPrimaryColor4
                        : ColorManager.mainObjectsBackGroundColor,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    stepTitle,
                    style: getMediumBlack12Style().copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    softWrap: false,
                  ),
                ],
              ),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    //this is the bubble
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 70,
                        height: 56,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 23,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          // color: index == currentIndex
                          // color: index <= currentIndex
                          //     ? ColorManager.mainPrimaryColor4
                          //     : ColorManager.mainObjectsBackGroundColor,
                          color: isActive
                              ? ColorManager.mainPrimaryColor4
                              : ColorManager.mainObjectsBackGroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            // color: currentIndex >= index + 1
                            //     ? ColorManager.mainPrimaryColor4
                            //     : ColorManager.mainObjectsBackGroundColor,
                            color: isActive
                                ? ColorManager.mainPrimaryColor4
                                : ColorManager.mainObjectsBackGroundColor,
                          ),
                        ),
                        child: SvgWidget(
                          // imagePath: index + 1 >= 0 || isLast
                          //     ? imageName
                          //     : changedImageName,
                          imagePath: isActive ? imageName : changedImageName,
                        ),
                      ),
                    ),
                    //this the line
                    Expanded(
                        child: Container(
                      height: 2,
                      //why index+1 we want to turn the line orange that precede the active bubble
                      // color: currentIndex >= index + 1
                      // ? ColorManager.mainPrimaryColor4
                      // : ColorManager.mainObjectsBackGroundColor,
                      color: isActive
                          ? ColorManager.mainPrimaryColor4
                          : ColorManager.mainObjectsBackGroundColor,
                    )),
                  ],
                ),
                //index+1 we don't wanna show 0 in the screen since our index will start at 0
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    stepTitle,
                    style: getMediumBlack12Style().copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
