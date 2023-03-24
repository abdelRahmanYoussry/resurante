// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, deprecated_member_use, unused_local_variable, avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/app/font_manager.dart';
import 'package:hassy/core/utils/shared/app/styles_manager.dart';

import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/class_main_warnning_button.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../authentication/presentation/manager/auth_cubit.dart';
import '../../../manager/TeacherHome/teacher_home_cubit.dart';
import '../../../manager/TeacherHome/teacher_home_state.dart';

class TeacherDashBoardScreen extends StatelessWidget {
  TeacherDashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TeacherHomeCubit.get(context);
    cubit.getStudentData();
    return BlocConsumer<TeacherHomeCubit, TeacherHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.userDataEntity != null,
          builder: (context) {
            return Scaffold(
              appBar: CustomAppBar(
                mycolor: ColorManager.mainPrimaryColor4,
                title: Text(''),
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (cubit.userDataEntity!.userData.isSecondStepCompleted ==
                            false ||
                        cubit.userDataEntity!.userData.isFirstStepCompleted ==
                            false)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ClassMainWarningButtonWidget(
                          buttonText: 'Please Complete The Registration Steps ',
                          onTap: () async {
                            var auth = AuthCubit.get(context);
                            await auth.getTeacherMaterial(context: context);
                            print(cubit.userDataEntity!.userData.typeId);
                            print(cubit
                                .userDataEntity!.userData.isFirstStepCompleted);
                            print(cubit.userDataEntity!.userData
                                .isSecondStepCompleted);
                            if (cubit.userDataEntity!.userData
                                        .isFirstStepCompleted ==
                                    false &&
                                cubit.userDataEntity!.userData.typeId == 1) {
                              navigateTo(context,
                                  routeName: Routes.registerStep2Route);
                            } else if (cubit.userDataEntity!.userData
                                        .isSecondStepCompleted ==
                                    false &&
                                cubit.userDataEntity!.userData.typeId == 1) {
                              navigateTo(context,
                                  routeName: Routes.teacherRegisterRoute);
                            }
                          },
                        ),
                      ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showBottomSheet(context: context);
                          },
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            color: ColorManager.backGroundColor,
                          ),
                        ),
                        SizedBox(
                          width: myMediaQuery(context: context).width / 4,
                        ),
                        Text(
                          LocaleKeys.appName.tr(),
                          style: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.size22,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                isLeading: false,
                toolBarHeight: cubit.userDataEntity!.userData
                                .isSecondStepCompleted ==
                            false ||
                        cubit.userDataEntity!.userData.isFirstStepCompleted ==
                            false
                    ? myMediaQuery(context: context).height / 6
                    : myMediaQuery(context: context).height / 10,
              ),
              body: Center(
                child: Text(
                  'Teacher DashBoard Screen',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
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

  showBottomSheet({required BuildContext context}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: myMediaQuery(context: context).height,
          child: Scaffold(
            backgroundColor: ColorManager.grey.withOpacity(0.3),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorManager.mainPrimaryColor4,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.clear_outlined,
                        ),
                        color: ColorManager.backGroundColor,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        int customIndex = index + 1;
                        String customDate = '';
                        if (customIndex < 10) {
                          customDate = '0$customIndex';
                        } else {
                          customDate = customIndex.toString();
                        }
                        String dateStart = '$customDate-02-2023 05:57:58';
                        DateFormat inputFormat = DateFormat('dd-MM-yyyy hh:mm');
                        DateTime input = inputFormat.parse(dateStart);
                        String date =
                            DateFormat('dd-MM-yyyy hh:mm').format(input);
                        return Card(
                          elevation: 6,
                          child: SizedBox(
                            height: myMediaQuery(context: context).height / 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      myMediaQuery(context: context).height /
                                          14,
                                ),
                                Text(
                                  '  تم حجز الحصة بتاريخ ${index + 1} -02-2023',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        MyElevatedButton(
                                          onTap: () {
                                            debugPrint(customIndex.toString());
                                          },
                                          buttonName:
                                              LocaleKeys.detailsButton.tr(),
                                          height: myMediaQuery(context: context)
                                                  .height /
                                              20,
                                          width: myMediaQuery(context: context)
                                                  .width /
                                              3,
                                          textColor: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                          borderColor:
                                              ColorManager.transparentColor,
                                          borderWidth: AppSize.size_0,
                                          fontSize: FontSize.size14,
                                          radius: AppSize.size10,
                                          buttonColor:
                                              ColorManager.mainPrimaryColor4,
                                        ),
                                        Spacer(),
                                        Text(
                                          date,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: BouncingScrollPhysics(),
                    //   itemBuilder: (context, index) {
                    //     return TeacherGetStudentWidget(
                    //       list: TeacherCubit.get(context)
                    //           .getStudentEntity
                    //           .studentData[index],
                    //       onTap: () {
                    //         debugPrint(index.toString());
                    //       },
                    //     );
                    //   },
                    //   itemCount: TeacherCubit.get(context)
                    //       .getStudentEntity
                    //       .studentData
                    //       .length,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
