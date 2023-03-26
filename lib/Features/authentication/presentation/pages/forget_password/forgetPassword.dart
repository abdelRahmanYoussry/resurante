// ignore_for_file: avoid_print, unused_local_variable, avoid_unnecessary_containers, prefer_const_constructors, depend_on_referenced_packages, prefer_interpolation_to_compose_strings, must_be_immutable, unused_import, deprecated_member_use, use_build_context_synchronously, file_names

import 'dart:ui' as ui;

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../core/utils/api/api_constance.dart';
import '../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../../core/utils/shared/classes/password_validate.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/components/oldComponents/dropDownMenu.dart';
import '../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../core/utils/shared/widgets/changeStyleWidget.dart';
import '../../../../../core/utils/shared/widgets/changeThemeMode.dart';
import '../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../core/utils/shared/widgets/loclization_widget.dart';
import '../../../../../core/utils/shared/widgets/main_view_container.dart';
import '../../../../../core/utils/shared/widgets/my_country_picker.dart';
import '../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../../core/utils/shared/widgets/my_custom_divider_size_2.dart';
import '../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
import '../../../../../core/utils/shared/widgets/textButton.dart';
import '../../../../../core/utils/shared/widgets/textFormfield.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';
import '../register_verification/RegisterVerification.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var myLanguage =
        CacheHelper.getSharedPreferencesValue(key: AppStrings.localCode);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        String confirmPassword = "";
        return KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onPanUpdateDownDirection,
          ],
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: MainViewContainer(
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
                        Spacer(),
                        ChangeThemeMode(),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        LocaleKeys.changeYourPassword.tr(),
                        style: getBoldStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChangeStyleWidget(),
                      ],
                    ),
                  ],
                ),
                mainWidget: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyCustomDividerSize5(),
                        MyTextFormField(
                            readOnly: false,
                            control: passwordController,
                            type: TextInputType.visiblePassword,
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            isPassword: cubit.ispassword,
                            label: LocaleKeys.newPassword.tr(),
                            suffix: cubit.suffix,
                            suffixClicked: () {
                              cubit.changepasswordvisibilty();
                            },
                            hint: LocaleKeys.passwordLabelAndHint.tr(),
                            validator: (String? value) {
                              confirmPassword = value!;
                              if (value.isEmpty) {
                                return LocaleKeys.passwordIsEmpty.tr();
                              }
                              if (value.length < 8) {
                                return LocaleKeys.passwordIsToWeak.tr();
                              }
                              if (value.isNotEmpty) {
                                return validatePassword(value);
                              }
                              return null;
                            },
                            onTap: () {},
                            onSubmit: (String value) {},
                            onChanged: (String value) {}),
                        MyCustomDividerSize5(),
                        MyTextFormField(
                            readOnly: false,
                            control: confirmPasswordController,
                            type: TextInputType.visiblePassword,
                            isPassword: cubit.ispasswordConfirmed,
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            label: LocaleKeys.confirmPasswordLabelAndHint.tr(),
                            hint: LocaleKeys.confirmPasswordLabelAndHint.tr(),
                            suffix: cubit.suffixConfirm,
                            suffixClicked: () {
                              cubit.changeConfirmPasswordVisibilty();
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.confirmPasswordIsEmpty.tr();
                              }
                              if (value.trim() != confirmPassword.trim()) {
                                return LocaleKeys.confirmPasswordIsUnValid.tr();
                              }
                              return null;
                            },
                            onTap: () {},
                            onSubmit: (String value) {},
                            onChanged: (String value) {}),
                        MyCustomDividerSize5(),
                        MyElevatedButton(
                          onTap: () async {
                            print(ApiConstance.token());
                            print(cubit.userId);
                            if (formKey.currentState!.validate()) {
                              cubit.forgetPassword(
                                  password: passwordController.text,
                                  confirmPassword:
                                      confirmPasswordController.text,
                                  context: context);
                            }
                          },
                          buttonName: LocaleKeys.submiButton.tr(),
                          condition: state is! ForgetPasswordLoadingState,
                          height: myMediaQuery(context: context).height / 20,
                          width: double.infinity,
                          textColor: ColorManager.white,
                          borderColor: ColorManager.transparentColor,
                          borderWidth: AppSize.size_0,
                          fontSize: FontSize.size14,
                          radius: AppSize.size10,
                          buttonColor: ColorManager.mainPrimaryColor4,
                        ),
                        MyCustomDividerSize2(),
                        Row(
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
          ),
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
          height: myMediaQuery(context: context).height / 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(25),
                  //     color: ColorManager.mainPrimaryColor4,
                  //   ),
                  //   child: IconButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     icon: Icon(
                  //       Icons.clear_outlined,
                  //     ),
                  //     color: ColorManager.backGroundColor,
                  //   ),
                  // ),
                  SizedBox(
                    height: myMediaQuery(context: context).height / 30,
                  ),
                  Center(
                    child: Text(
                      LocaleKeys.termsAndConditionText.tr(),
                      style: getBoldStyle(
                        color: ColorManager.mainPrimaryColor4,
                        fontSize: FontSize.size22,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              'Agree Terms and Conditions Agree Terms and Conditions Agree Terms Agree Terms and Conditions Agree Terms Agree Terms and Conditions Agree Terms Agree Terms and Conditions Agree Terms Agree Terms and Conditions Agree Terms Agree Terms and Conditions Agree Terms',
                              style: TextStyle(
                                color: ColorManager.textFormBorderColor,
                              ),
                              overflow: TextOverflow.visible,
                              softWrap: true,
                              maxLines: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorManager.mainPrimaryColor4,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          LocaleKeys.doneText.tr(),
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText2!.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
