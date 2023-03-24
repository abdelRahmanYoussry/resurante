// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/student/presentation/manager/student_profile_cubit/student_profile_cubit.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/components/components.dart';

import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../home/presentation/manager/home_cubit.dart';
import '../../StudentProfile/student_profile_screen.dart';
import '../StudentFinance/student_finance_screen.dart';
import '../StudentHomeScreen/StudentsHomeScreen.dart';
import '../StudentLayout/StudentLayoutScreen.dart';

class StudentMainScreen extends StatelessWidget {
  StudentMainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> studentBottomNavBarList = [
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.school,
        ),
        label: LocaleKeys.classesMainTextBottomNavBar.tr(),
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.search,
        ),
        label: LocaleKeys.exploreMainTextInBottomNavBar.tr(),
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
    List<Widget> studentHomeScreens = [
      StudentLayOutScreen(),
      StudentsHomeScreen(),
      StudentFinanceScreen(),
      StudentProfileScreen()
    ];
    var cubit = StudentProfileCubit.get(context);
    cubit.currentIndex = 1;
    return BlocConsumer<StudentProfileCubit, StudentProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: ColorManager.transparentColor,
            statusBarIconBrightness: Brightness.light,
          ),
        );
        return Scaffold(
          body: studentHomeScreens[cubit.currentIndex],
          bottomNavigationBar: SizedBox(
              height: myMediaQuery(context: context).height / 10,
              width: myMediaQuery(context: context).width,
              child: BottomNavigationBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(fontSize: 12, height: 1.2),
                items: studentBottomNavBarList,
                currentIndex: cubit.currentIndex,
                elevation: 10,
                unselectedItemColor: ColorManager.unSelectedIconButtonColor,
                selectedItemColor: HomeCubit.get(context).isDark
                    ? ColorManager.white
                    : ColorManager.mainPrimaryColor4,
                onTap: (index) async {
                  if (index == 3) {
                    await cubit.getUserData(context: context);
                    cubit.getStudentPersonalData();
                  }

                  cubit.changeNavBar(index);
                },
              )),
        );
      },
    );
  }
}
