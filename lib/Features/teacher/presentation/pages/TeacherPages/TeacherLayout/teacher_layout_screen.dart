// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherHome/teacher_home_cubit.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherHome/teacher_home_state.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../TeacherCurrentClasses/teacher_current_classes_screen.dart';
import '../TeacherPreviousClasses/teacher_previous_classes_screen.dart';

class TeacherLayOutScreen extends StatelessWidget {
  TeacherLayOutScreen({Key? key}) : super(key: key);
  List<Widget> teacherPagesList = [
    TeacherCurrentClassesScreen(),
    TeacherPreviousClassesScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeacherHomeCubit, TeacherHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTabController(
          length: teacherPagesList.length,
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
                    labelStyle: TextStyle(
                      fontSize: 16,
                      // color: ColorManager.mainPrimaryColor4,
                    ),
                    physics: const BouncingScrollPhysics(),
                    unselectedLabelColor: Colors.black,
                    indicator: BoxDecoration(
                      color: ColorManager.backGroundColor,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(10),
                        left: Radius.circular(10),
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
            body: TabBarView(children: teacherPagesList),
          ),
        );
      },
    );
  }
}
