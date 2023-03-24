// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/student/presentation/manager/student_profile_cubit/student_profile_cubit.dart';
import 'package:hassy/Features/student/presentation/pages/StudentProfile/editProfile/student_editProfile_layout/student_update_profile_step_one.dart';
import 'package:hassy/Features/student/presentation/pages/StudentProfile/editProfile/student_editProfile_layout/student_update_profile_step_two.dart';

import '../../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../../core/utils/shared/widgets/custom_app_bar.dart';

class StudentEditProfileLayout extends StatelessWidget {
  StudentEditProfileLayout({Key? key}) : super(key: key);
  List<Widget> studentEditProfileScreens = [
    StudentUpdateProfileStepOne(),
    StudentUpdateProfileStepTwo()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentProfileCubit, StudentProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTabController(
          length: studentEditProfileScreens.length,
          child: Scaffold(
            backgroundColor: ColorManager.textFormBorderColor.withOpacity(0.1),
            appBar: CustomAppBar(
              mycolor: ColorManager.mainPrimaryColor4,
              title: Text(
                LocaleKeys.profileMainLayout.tr(),
                style: getBoldStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.size20,
                ),
              ),
              isLeading: true,
              toolBarHeight: myMediaQuery(context: context).height / 6,
              bottomWidget: PreferredSize(
                preferredSize: Size.zero,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: TabBar(
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontSize: 16,
                    ),
                    physics: const BouncingScrollPhysics(),
                    unselectedLabelColor: Colors.black,
                    onTap: (index) async {
                      if (index == 1) {
                        await StudentProfileCubit.get(context)
                            .getStudentPersonalData();
                        // await StudentCubit.get(context)
                        //     .getEducationSystem(context: context);
                        // await StudentCubit.get(context).getEducationLevel(
                        //     educationSystemIdParameters:
                        //         StudentCubit.get(context).eductionSystemId,
                        //     context: context);
                        // await StudentCubit.get(context).getEducationGrade(
                        //     educationLevelId:
                        //         StudentCubit.get(context).eductionLevelId,
                        //     context: context);
                        // await Future.wait(
                        //     [cubit.getStudentPersonalData(context: context)]);
                      }
                    },
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
                      Tab(text: LocaleKeys.userMainData.tr()),
                      Tab(text: LocaleKeys.profileUpdateInformation.tr()),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(children: studentEditProfileScreens),
          ),
        );
      },
    );
  }
}
