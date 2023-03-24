// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/components/components.dart';

import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../StudentCurrentClasses/StudentCurrentClassesScreen.dart';
import '../ٍStudentPerviousClasses/ٍStudentPerviousClassesPage.dart';

class StudentLayOutScreen extends StatelessWidget {
  StudentLayOutScreen({Key? key}) : super(key: key);
  List<Widget> studentPagesList = [
    StudentCurrentClassesScreen(),
    StudentPreviousClassesScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: studentPagesList.length,
      child: Scaffold(
          backgroundColor: ColorManager.textFormBorderColor.withOpacity(0.1),
          appBar: CustomAppBar(
            mycolor: ColorManager.mainPrimaryColor4,
            title: Text(
              LocaleKeys.myClassMainTitle.tr(),
              style: getBoldStyle(
                color: ColorManager.white,
                fontSize: FontSize.size20,
              ),
            ),
            isLeading: false,
            toolBarHeight: myMediaQuery(context: context).height / 6,
            bottomWidget: PreferredSize(
              preferredSize: Size.zero,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: TabBar(
                  labelColor: Colors.black,
                  labelStyle: getBoldStyle(
                    fontSize: 15,
                    color: ColorManager.mainPrimaryColor1,
                  ),
                  indicatorColor: ColorManager.backGroundColor,
                  physics: const BouncingScrollPhysics(),
                  unselectedLabelColor: Colors.black.withOpacity(0.5),
                  indicatorWeight: 5,
                  indicator: BoxDecoration(
                    color: ColorManager.backGroundColor,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20),
                      left: Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: LocaleKeys.currentClasses.tr()),
                    Tab(text: LocaleKeys.previousClass.tr()),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(children: studentPagesList)),
    );
  }
}
