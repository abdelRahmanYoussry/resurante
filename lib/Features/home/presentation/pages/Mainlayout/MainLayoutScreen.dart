// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturente/Features/home/presentation/manager/home_cubit.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/components/components.dart';

import '../../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../student/presentation/pages/StudentPages/StudentHomeScreen/StudentsHomeScreen.dart';
import '../../../../student/presentation/pages/StudentPages/StudentLayout/StudentLayoutScreen.dart';
import '../../../../teacher/presentation/pages/TeacherPages/TeacherLayout/teacher_layout_screen.dart';
import '../Finance/FinnanceScreen.dart';

class MainLayout extends StatelessWidget {
  MainLayout({Key? key}) : super(key: key);
  List<Widget> studentHomeScreens = [
    StudentLayOutScreen(),
    StudentsHomeScreen(),
    FinanceScreen(),
  ];

  List<Widget> teacherHomeScreens = [
    TeacherLayOutScreen(),
    TeacherDashBoardScreen(),
    FinanceScreen(),
  ];

  List<BottomNavigationBarItem> studentBottomNavBarList = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.school,
      ),
      label: 'My Classes',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        label: 'Explore'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.money,
        ),
        label: 'Finance'),
  ];

  List<BottomNavigationBarItem> teacherBottomNavBarList = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.school,
      ),
      label: 'My Classes',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.dashboard,
        ),
        label: 'Dashboard'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.money,
        ),
        label: 'Finance'),
  ];
  @override
  Widget build(BuildContext context) {
    var isTeacher = CacheHelper.getSharedPreferencesValue(
      key: AppStrings.cachedTeacherBool,
    );

    // if (isTeacher == null) {
    //   isTeacher = false;
    // }
    debugPrint(isTeacher.toString());
    var cubit = HomeCubit.get(context);
    cubit.currentIndex = 1;

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: ColorManager.mainPrimaryColor2,
            statusBarIconBrightness: Brightness.light,
          ),
        );
        return Scaffold(
          body: isTeacher == true
              ? teacherHomeScreens[cubit.currentIndex]
              : studentHomeScreens[cubit.currentIndex],
          bottomNavigationBar: SizedBox(
              height: myMediaQuery(context: context).height / 12,
              width: myMediaQuery(context: context).width,
              child: BottomNavigationBar(
                backgroundColor: ColorManager.backGroundColor,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: const TextStyle(fontSize: 12),
                items: isTeacher == true
                    ? teacherBottomNavBarList
                    : studentBottomNavBarList,
                currentIndex: cubit.currentIndex,
                elevation: 10,
                unselectedItemColor: ColorManager.unSelectedIconButtonColor,
                selectedItemColor: ColorManager.mainPrimaryColor4,
                onTap: (index) {
                  cubit.changeNavBar(index);
                },
              )),
        );
      },
    );
  }
}
