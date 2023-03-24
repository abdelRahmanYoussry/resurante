// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/student/presentation/manager/student_profile_cubit/student_profile_cubit.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/app_routes/routes_manager.dart';
import 'package:hassy/core/utils/shared/translations/locale_keys.g.dart';
import 'package:hassy/core/utils/shared/widgets/custom_app_bar.dart';

import '../../../../../core/utils/shared/app/assets_manager.dart';
import '../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
import '../../../../../core/utils/shared/widgets/my_custom_drawer_list_tile.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var authCubit = AuthCubit.get(context);
    // Future.sync(() async {
    //   await AuthCubit.get(context).getUserData(context: context);
    // });
    var cubit = StudentProfileCubit.get(context);

    return BlocConsumer<StudentProfileCubit, StudentProfileState>(
      listener: (context, state) async {
        if (state is UpdateUserBasicDataSuccessState) {
          await StudentProfileCubit.get(context).getUserData(context: context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            mycolor: ColorManager.mainPrimaryColor4,
            isLeading: false,
            toolBarHeight: myMediaQuery(context: context).height / 14,
            title: Text(
              LocaleKeys.profileMainTextInBottomNavBar.tr(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: ListView(
            children: [
              const MyCustomDividerSize10(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Material(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppSize.size80),
                      ),
                      // elevation: AppSize.size_0,
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: CircleAvatar(
                          backgroundImage:
                              cubit.userDataEntity.userData.userImagePath ==
                                      null
                                  ? const AssetImage(
                                      ImageAssets.userAvatar,
                                    ) as ImageProvider
                                  : NetworkImage(cubit
                                      .userDataEntity.userData.userImagePath
                                      .toString()),
                        ),
                      ),
                    ),
                  ),
                  const MyCustomDividerSize5(),
                  Center(
                    child: cubit.userDataEntity.userData.name != null
                        ? Text(
                            cubit.userDataEntity.userData.name.toString(),
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color),
                          )
                        : Text(
                            cubit.userDataEntity.userData.userName.toString(),
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color),
                          ),
                  ),
                  const MyCustomDividerSize5(),
                  Center(
                    child: Text(
                      cubit.userDataEntity.userData.phoneNumber.toString(),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color),
                    ),
                  ),
                  if (cubit.userDataEntity.userData.isFirstStepCompleted ==
                          true &&
                      cubit.userDataEntity.userData.isSecondStepCompleted ==
                          true)
                    Center(
                      child: TextButton(
                        onPressed: () {
                          cubit.getEducationSystem(context: context);
                          cubit.getEducationLevel(
                              educationSystemIdParameters:
                                  cubit.eductionSystemId,
                              context: context);
                          cubit.getEducationGrade(
                              educationLevelId: cubit.eductionLevelId,
                              context: context);
                          // navigateTo2(context,
                          //     routeName: Routes.studentProfileMainLayOut);

                          // Navigator.of(context).push(
                          //     SlideRight(page: StudentEditProfileLayout()));
                          //
                          navigateTo(context,
                              routeName: Routes.studentProfileMainLayOut);
                        },
                        child: Text(
                          LocaleKeys.editProfile.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorManager.mainPrimaryColor4,
                          ),
                        ),
                      ),
                    ),
                  MyCustomDrawerListTile(
                    icon: Icons.location_on_outlined,
                    title: LocaleKeys.locationsTextInProfile.tr(),
                    onTap: () {
                      navigateTo(context, routeName: Routes.studentMyPlaces);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.people_alt_outlined,
                    title: LocaleKeys.myTeachersInProfileScreen.tr(),
                    onTap: () {
                      navigateTo(context,
                          routeName: Routes.studentMyTeachersRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.privacy_tip_outlined,
                    title: LocaleKeys.privacyPolicyText.tr(),
                    onTap: () async {
                      await cubit.getPrivacyPolicy(context: context);
                      navigateTo(context,
                          routeName: Routes.studentPrivacyPolicyRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.verified_user_outlined,
                    title: LocaleKeys.usagepolicyText.tr(),
                    onTap: () {
                      navigateTo(context,
                          routeName: Routes.studentUsagePolicyRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.question_answer_outlined,
                    title: LocaleKeys.commonQuestionsText.tr(),
                    onTap: () async {
                      await cubit.getCommonQuestions(context: context);
                      navigateTo(context,
                          routeName: Routes.studentCommonQuestionRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.help_outline,
                    title: LocaleKeys.helpAndComplaintsText.tr(),
                    onTap: () async {
                      await cubit.getComplaintsType(context: context);
                      navigateTo(context,
                          routeName: Routes.studentHelpAndComplaintsRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.settings_outlined,
                    title: LocaleKeys.settingProfileScreen.tr(),
                    onTap: () {
                      navigateTo(context,
                          routeName: Routes.studentSettingRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.logout_outlined,
                    title: LocaleKeys.logoutText.tr(),
                    onTap: () async {
                      await cubit.signOut(context: context);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
