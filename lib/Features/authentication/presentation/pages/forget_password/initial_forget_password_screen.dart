// ignore_for_file: avoid_print, non_constant_identifier_names, must_be_immutable, unused_import, use_build_context_synchronously, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/components/oldComponents/dropDownMenu.dart';
import '../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../core/utils/shared/widgets/changeStyleWidget.dart';
import '../../../../../core/utils/shared/widgets/changeThemeMode.dart';
import '../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../core/utils/shared/widgets/loclization_widget.dart';
import '../../../../../core/utils/shared/widgets/main_view_container.dart';
import '../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
import '../../../../../core/utils/shared/widgets/textFormfield.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';

class InitialForgetPasswordScreen extends StatelessWidget {
  InitialForgetPasswordScreen({Key? key}) : super(key: key);
  final userController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          key: formKey,
          child: KeyboardDismisser(
            gestures: const [
              GestureType.onTap,
              GestureType.onPanUpdateDownDirection,
            ],
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: MainViewContainer(
                appBarHeight: 0,
                position: myMediaQuery(context: context).height / 3,
                cardHeight: myMediaQuery(context: context).height / 2,
                cardWidth: AppSize.size20,
                titleWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        LoclizationWidget(
                          context: context,
                        ),
                        const Spacer(),
                        const ChangeThemeMode(),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: myMediaQuery(context: context).height /
                          AppSize.size30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.padding8),
                      child: Text(
                        LocaleKeys.forgetPassword.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 35),
                      ),
                    ),
                    ChangeStyleWidget(),
                  ],
                ),
                mainWidget: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyCustomDividerSize5(),
                      MyTextFormField(
                        readOnly: false,
                        control: userController,
                        type: TextInputType.name,
                        isPassword: false,
                        isAutoValid: AutovalidateMode.onUserInteraction,
                        suffix: Icons.person_outline_rounded,
                        suffixClicked: () {},
                        label: LocaleKeys.userNameLabelAndHint.tr(),
                        hint: LocaleKeys.userNameLabelAndHint.tr(),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.userNameIsEmpty.tr();
                          } else if (value.length < 6) {
                            return LocaleKeys.enterUserNameLoginText.tr();
                          } else if (value.trim().toString().contains(" ")) {
                            return LocaleKeys.enterUserNameLoginText.tr();
                          }
                          return null;
                        },
                        onTap: () {},
                        onSubmit: (String value) {},
                        onChanged: (String value) {},
                      ),
                      const MyCustomDividerSize5(),
                      const SizedBox(
                        height: 30,
                      ),
                      MyElevatedButton(
                        condition: state is! InitialForgetPasswordLoadingState,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            cubit.initialForgetPassword(
                                userName: userController.text,
                                context: context);
                            cubit.timerCount = 61;
                            cubit.countDownTimer();
                            // await cubit.userLogin(
                            //   context: context,
                            //   password: passwordController.text,
                            //   userName: userController.text,
                            // );
                            // await cubit.getUserData(context: context);
                            // if (cubit.userLoginEntity.succeeded == false) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //       mySnackBar(
                            //           myMessage:
                            //               cubit.userLoginEntity.message));
                            // } else {
                            //   showToast(
                            //     text: 'تم تسجيل الدخول بنجاح',
                            //     state: ToastState.Success,
                            //   );
                            //   await cubit.getUserData(context: context);
                            //   var userType =
                            //       await CacheHelper.getSharedPreferencesValue(
                            //           key: AppStrings.registerTypeNumber);
                            //   if (userType != null) {
                            //     await chooseUserType(
                            //       type: userType,
                            //       context: context,
                            //     );
                            //   }
                            // }
                          }
                        },
                        buttonName: LocaleKeys.nextStep.tr(),
                        height: myMediaQuery(context: context).height / 15,
                        width: myMediaQuery(context: context).width,
                        textColor: Theme.of(context).textTheme.bodyText1!.color,
                        borderColor: ColorManager.transparentColor,
                        borderWidth: AppSize.size_0,
                        fontSize: FontSize.size14,
                        radius: AppSize.size10,
                        buttonColor: ColorManager.mainPrimaryColor4,
                      ),
                      const MyCustomDividerSize5(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              LocaleKeys.rememberYourPassword.tr(),
                              style: getSemiBoldStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color!,
                                  fontSize: FontSize.size14),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                navigateAndFinish(context,
                                    routeName: Routes.loginRoute);
                              },
                              child: Text(
                                LocaleKeys.loginMainButton.tr(),
                                style: TextStyle(
                                    color: ColorManager.mainPrimaryColor4,
                                    fontSize: 18),
                              )),
                        ],
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
