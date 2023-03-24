// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_import, unused_local_variable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:hassy/Features/teacher/presentation/pages/TeacherProfile/teacher_edit_profile/teacher_update_profile_step_one.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../manager/TeacherProfile/teacher_profile_cubit.dart';
import '../../../manager/TeacherProfile/teacher_profile_state.dart';
import 'teacher_update_profile_step_two.dart';

class TeacherProfileMainLayout extends StatelessWidget {
  TeacherProfileMainLayout({Key? key}) : super(key: key);
  List<Widget> teacherProfileList = [
    TeacherUpdateProfileStepOne(),
    TeacherUpdateProfileStepTwo()
  ];
  @override
  Widget build(BuildContext context) {
    var cubit = TeacherProfileCubit.get(context);
    return BlocConsumer<TeacherProfileCubit, TeacherProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTabController(
          length: teacherProfileList.length,
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
                    onTap: (index) async {},
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
            body: TabBarView(children: teacherProfileList),
          ),
        );
      },
    );
  }
}
