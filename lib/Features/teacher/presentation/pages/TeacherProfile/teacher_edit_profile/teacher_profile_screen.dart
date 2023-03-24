// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, unused_local_variable, unrelated_type_equality_checks, use_build_context_synchronously, unnecessary_null_comparison

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/home/presentation/manager/home_cubit.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_state.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_5.dart';

import '../../../../../../core/utils/shared/app/assets_manager.dart';
import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/changeThemeMode.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_drawer_list_tile.dart';
import '../../../manager/TeacherProfile/teacher_profile_cubit.dart';

class TeacherProfileScreen extends StatelessWidget {
  const TeacherProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TeacherProfileCubit.get(context);
    return BlocConsumer<TeacherProfileCubit, TeacherProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            mycolor: ColorManager.mainPrimaryColor4,
            isLeading: false,
            toolBarHeight: myMediaQuery(context: context).height / 10,
            title: Text(
              LocaleKeys.profileMainTextInBottomNavBar.tr(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const MyCustomDividerSize5(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Material(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppSize.size80),
                      ),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: CircleAvatar(
                            backgroundImage:
                                cubit.userDataEntity.userData.userImagePath ==
                                        null
                                    ? const AssetImage(ImageAssets.userAvatar)
                                    : NetworkImage(cubit
                                        .userDataEntity.userData.userImagePath
                                        .toString()) as ImageProvider),
                      ),
                    ),
                  ),
                  MyCustomDividerSize5(),
                  Center(
                    child: Text(
                      cubit.userDataEntity.userData.userName.toString(),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color),
                    ),
                  ),
                  MyCustomDividerSize5(),
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
                        onPressed: () async {
                          await cubit.fillListOfPaths();
                          await cubit.getTeacherMaterial(context: context);
                          await cubit.getTeacherPersonalData();
                          navigateTo(context,
                              routeName: Routes.teacherProfileMainLayOut);
                        },
                        child: Text(
                          LocaleKeys.editProfile.tr(),
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                      ),
                    ),
                  if (cubit.userDataEntity.userData.isFirstStepCompleted ==
                          true &&
                      cubit.userDataEntity.userData.isSecondStepCompleted ==
                          true)
                    MyCustomDrawerListTile(
                      icon: Icons.location_on_outlined,
                      title: LocaleKeys.locationsTextInProfile.tr(),
                      onTap: () async {
                        await cubit.getTeacherPlace(context: context);
                        navigateTo(context,
                            routeName: Routes.teacherMainPlacesRoute);
                      },
                    ),
                  MyCustomDrawerListTile(
                    icon: Icons.people_alt_outlined,
                    title: LocaleKeys.myStudentInProfileScreen.tr(),
                    onTap: () {
                      navigateTo(context,
                          routeName: Routes.teacherMyStudentRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.contacts_outlined,
                    title: LocaleKeys.contactParentInProfileScreen.tr(),
                    onTap: () {
                      navigateTo(context,
                          routeName: Routes.teacherContactParentRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.privacy_tip_outlined,
                    title: LocaleKeys.privacyPolicyText.tr(),
                    onTap: () async {
                      await cubit.getPrivacyPolicy(context: context);
                      navigateTo(context,
                          routeName: Routes.teacherPrivacyPolicyRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.verified_user_outlined,
                    title: LocaleKeys.usagepolicyText.tr(),
                    onTap: () {
                      navigateTo(context,
                          routeName: Routes.teacherUsagePolicyRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.question_answer_outlined,
                    title: LocaleKeys.commonQuestionsText.tr(),
                    onTap: () async {
                      await cubit.getCommonQuestions(context: context);
                      navigateTo(context,
                          routeName: Routes.teacherCommonQuestionRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.help_outline,
                    title: LocaleKeys.helpAndComplaintsText.tr(),
                    onTap: () async {
                      await cubit.getComplaintsType(context: context);
                      navigateTo(context,
                          routeName: Routes.teacherHelpAndComplaintsRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.settings_outlined,
                    title: LocaleKeys.settingProfileScreen.tr(),
                    onTap: () {
                      navigateTo(context,
                          routeName: Routes.teacherSettingRoute);
                    },
                  ),
                  MyCustomDrawerListTile(
                    icon: Icons.logout_outlined,
                    title: LocaleKeys.logoutText.tr(),
                    onTap: () {
                      HomeCubit.get(context).signOut(context: context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: const ChangeThemeMode(),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
