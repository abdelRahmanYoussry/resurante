// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, equal_keys_in_map, use_build_context_synchronously, unused_local_variable, avoid_print, unnecessary_null_comparison

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherMainClasses/teacher_classes_cubit.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/class_main_divider.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../manager/TeacherMainClasses/teacher_classes_state.dart';
import '../../../widget/ClassesWidgets/TeacherCurrentLessonWidget.dart';

class TeacherCurrentClassesScreen extends StatelessWidget {
  TeacherCurrentClassesScreen({Key? key}) : super(key: key);
  var myStaticCurrentClass = [
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': 'Alexandria,Mandra,33 AbnAuf Street,in Fornt Of',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': 'Alexandria,Mandra,33 AbnAuf Street,in Fornt Of',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': 'Alexandria,Mandra,33 AbnAuf Street,in Fornt Of',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': 'Alexandria,Mandra,33 AbnAuf Street,in Fornt Of',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': 'Alexandria,Mandra,33 AbnAuf Street,in Fornt Of',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': 'Alexandria,Mandra,33 AbnAuf Street,in Fornt Of',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': 'Alexandria,Mandra,33 AbnAuf Street,in Fornt Of',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': 'Alexandria,Mandra,33 AbnAuf Street,in Fornt Of',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': 'Alexandria,Mandra,33 AbnAuf Street,in Fornt Of',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': 'Alexandria,Mandra,33 AbnAuf Street,in Fornt Of',
      'count': '10',
      'educationlevel': 'Governmental',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = TeacherClassesCubit.get(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorManager.mainPrimaryColor4,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return BlocConsumer<TeacherClassesCubit, TeacherClassesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! GetDataLoadingState,
          builder: (context) {
            return Scaffold(
              backgroundColor: ColorManager.mainPrimaryColor4.withOpacity(0.1),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.padding10, horizontal: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyElevatedButton(
                            radius: 10,
                            textColor: ColorManager.backGroundColor,
                            height: myMediaQuery(context: context).height / 10,
                            width: myMediaQuery(context: context).width / 2,
                            borderColor: ColorManager.mainPrimaryColor4,
                            onTap: cubit.userDataEntity.userData
                                            .isFirstStepCompleted ==
                                        true &&
                                    cubit.userDataEntity.userData
                                            .isSecondStepCompleted ==
                                        true &&
                                    cubit.userDataEntity.userData != null
                                ? () async {
                                    await cubit.getEducationSystem(
                                        context: context);
                                    await cubit.getTeacherMaterial(
                                        context: context);
                                    await cubit.getLessonType(context: context);
                                    await cubit.getTeacherPlace(
                                        context: context);
                                    navigateTo(
                                      context,
                                      routeName: Routes.teacherAddLessonRoute,
                                    );
                                  }
                                : () {},
                            borderWidth: 2,
                            buttonName: LocaleKeys.addLessonTitle.tr(),
                            buttonColor: ColorManager.mainPrimaryColor4,
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.filter_alt,
                              color: ColorManager.mainPrimaryColor4,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.sort,
                              color: ColorManager.mainPrimaryColor4,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (cubit.userDataEntity.userData.isFirstStepCompleted ==
                              false &&
                          cubit.userDataEntity.userData.isSecondStepCompleted ==
                              false)
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Please Complete Registration Steps',
                                style: TextStyle(
                                    color: ColorManager.error, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ConditionalBuilder(
                        condition: myStaticCurrentClass.isNotEmpty,
                        builder: (context) {
                          return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return TeacherCurrentLessonWidget(
                                currentClasses: myStaticCurrentClass[index],
                                onDetailsTapped: () {
                                  navigateTo(
                                    context,
                                    routeName:
                                        Routes.teacherManagementClassRoute,
                                  );
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const ClassesMainDivider(),
                            itemCount: myStaticCurrentClass.length,
                          );
                        },
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          fallback: (context) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorManager.mainPrimaryColor4,
              ),
            );
          },
        );
      },
    );
  }
}
