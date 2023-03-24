// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use, use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/components/components.dart';

import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../home/presentation/manager/home_cubit.dart';
import '../../../manager/TeacherHome/teacher_home_cubit.dart';
import '../../../manager/TeacherHome/teacher_home_state.dart';
import '../../../manager/TeacherMainClasses/teacher_classes_cubit.dart';
import '../../../manager/TeacherProfile/teacher_profile_cubit.dart';
import '../../TeacherProfile/teacher_edit_profile/teacher_profile_screen.dart';
import '../TeacherFinance/teacher_finance_screen.dart';
import '../TeacherHome/TeacherDashBoard.dart';
import '../TeacherLayout/teacher_layout_screen.dart';

class TeacherMainScreen extends StatelessWidget {
  TeacherMainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> teacherBottomNavBarList = [
      BottomNavigationBarItem(
        icon: const Icon(
          FontAwesomeIcons.piedPiper,
        ),
        label: LocaleKeys.tableTeacherTextInBottomNavBar.tr(),
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.dashboard,
        ),
        label: LocaleKeys.dashboardTeacherMainScreenInBottomNavBar.tr(),
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.money,
        ),
        label: LocaleKeys.financeMainTextInBottomNavBar.tr(),
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.settings_applications_outlined,
        ),
        label: LocaleKeys.profileMainTextInBottomNavBar.tr(),
      ),
    ];
    List<Widget> teacherHomeScreens = [
      TeacherLayOutScreen(),
      TeacherDashBoardScreen(),
      TeacherFinanceScreen(),
      TeacherProfileScreen()
    ];
    var cubit = TeacherHomeCubit.get(context);
    cubit.currentIndex = 1;
    cubit.getUserData(context: context);

    return BlocConsumer<TeacherHomeCubit, TeacherHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: ColorManager.transparentColor,
            statusBarIconBrightness: Brightness.light,
          ),
        );
        return Scaffold(
          body: teacherHomeScreens[cubit.currentIndex],
          bottomNavigationBar: SizedBox(
              height: myMediaQuery(context: context).height / 10,
              width: myMediaQuery(context: context).width,
              child: BottomNavigationBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: const TextStyle(fontSize: 12, height: 1.2),
                items: teacherBottomNavBarList,
                currentIndex: cubit.currentIndex,
                elevation: 10,
                unselectedItemColor: ColorManager.unSelectedIconButtonColor,
                selectedItemColor: HomeCubit.get(context).isDark
                    ? ColorManager.white
                    : ColorManager.mainPrimaryColor4,
                onTap: (index) async {
                  if (index == 3) {
                    var cubit = TeacherProfileCubit.get(context);
                    await cubit.getUserData(context: context);
                    await cubit.getTeacherPersonalData();
                  }
                  if (index == 0) {
                    var cubit = TeacherClassesCubit.get(context);
                    await cubit.getUserData(context: context);
                  }
                  cubit.changeNavBar(index);
                },
              )),
        );
      },
    );
  }
}
