// ignore_for_file: prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_state.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/app/values_manager.dart';
import 'package:hassy/core/utils/shared/app_routes/routes_manager.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:hassy/core/utils/shared/translations/locale_keys.g.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_10.dart';

import '../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../core/utils/shared/widgets/loclization_widget.dart';

class RegisterTypeScreen extends StatelessWidget {
  RegisterTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    cubit.setTeacherBool(isTeacher: false);
    cubit.setStudentBool(isStudent: false);
    cubit.setParentBool(isParent: false);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: ColorManager.mainPrimaryColor4,
            elevation: AppSize.size_0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              LocaleKeys.appName.tr(),
              style: const TextStyle(color: Colors.white),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                navigateTo(context, routeName: Routes.loginRoute);
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.padding20,
                ),
                child: LoclizationWidget(
                  context: context,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(
              AppPadding.padding20,
            ),
            child: Center(
              child: Container(
                height: AppSize.size350,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: ColorManager.mainPrimaryColor4,
                    ),
                    borderRadius: BorderRadius.circular(
                      AppSize.size80,
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyElevatedButton(
                        onTap: () {
                          AuthCubit.get(context)
                              .setTeacherBool(isTeacher: true);
                          navigateTo(context,
                              routeName: Routes.registerStep1Route);
                          CacheHelper.saveDataToSharedPreferences(
                              key: AppStrings.registerTypeNumber, value: 1);
                        },
                        /////
                        buttonName: LocaleKeys.registerAsTeacher.tr(),
                        height: AppSize.size50,
                        width: AppSize.size300,
                        textColor: Theme.of(context).textTheme.bodyText1!.color,
                        borderColor: ColorManager.transparentColor,
                        borderWidth: AppSize.size_0,
                        fontSize: FontSize.size14,
                        radius: AppSize.size10,
                        buttonColor: ColorManager.mainPrimaryColor4,
                      ),
                      const MyCustomDividerSize10(),
                      MyElevatedButton(
                        onTap: () {
                          AuthCubit.get(context).setParentBool(isParent: true);
                          navigateTo(context,
                              routeName: Routes.registerStep1Route);
                        },
                        buttonName: LocaleKeys.registerAsParent.tr(),
                        height: AppSize.size50,
                        width: AppSize.size300,
                        textColor: Theme.of(context).textTheme.bodyText1!.color,
                        borderColor: ColorManager.transparentColor,
                        borderWidth: AppSize.size_0,
                        fontSize: FontSize.size14,
                        radius: AppSize.size10,
                        buttonColor: ColorManager.mainPrimaryColor4,
                      ),
                      const MyCustomDividerSize10(),
                      MyElevatedButton(
                        onTap: () {
                          AuthCubit.get(context)
                              .setStudentBool(isStudent: true);
                          CacheHelper.saveDataToSharedPreferences(
                              key: AppStrings.registerTypeNumber, value: 2);
                          navigateTo(context,
                              routeName: Routes.registerStep1Route);
                        },
                        buttonName: LocaleKeys.registerAsStudent.tr(),
                        height: AppSize.size50,
                        width: AppSize.size300,
                        textColor: Theme.of(context).textTheme.bodyText1!.color,
                        borderColor: ColorManager.transparentColor,
                        borderWidth: AppSize.size_0,
                        fontSize: FontSize.size14,
                        radius: AppSize.size10,
                        buttonColor: ColorManager.mainPrimaryColor4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
