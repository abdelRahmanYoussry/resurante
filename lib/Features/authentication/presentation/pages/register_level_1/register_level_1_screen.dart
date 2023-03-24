// ignore_for_file: avoid_print, unused_local_variable, avoid_unnecessary_containers, prefer_const_constructors, depend_on_referenced_packages, prefer_interpolation_to_compose_strings, must_be_immutable, unused_import, deprecated_member_use, use_build_context_synchronously

import 'dart:ui' as ui;

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:hassy/Features/authentication/presentation/pages/login/login_screen.dart';
import 'package:hassy/core/utils/shared/app/strings_manager.dart';
import 'package:hassy/core/utils/shared/app_routes/routes_manager.dart';
import 'package:hassy/core/utils/shared/chace_helper/cache_helper.dart';
import 'package:hassy/core/utils/shared/classes/phone_number_validate.dart';
import 'package:hassy/core/utils/shared/classes/user_name_validate.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../core/utils/shared/classes/password_validate.dart';
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
import '../../manager/auth_state.dart';
import '../register_verification/RegisterVerification.dart';

class RegisterBeforeLoginScreen extends StatelessWidget {
  RegisterBeforeLoginScreen({Key? key}) : super(key: key);
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String newValue = '20';

  @override
  Widget build(BuildContext context) {
    AuthCubit.get(context).confirmAgree = false;
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
                position: myMediaQuery(context: context).height / 3.5,
                cardHeight: myMediaQuery(context: context).height / 3.2,
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
                        LocaleKeys.registerMainButton.tr(),
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
                          control: userNameController,
                          type: TextInputType.name,
                          isAutoValid: AutovalidateMode.onUserInteraction,
                          isPassword: false,
                          suffixClicked: () {},
                          label: LocaleKeys.userNameLabelAndHint.tr(),
                          hint: LocaleKeys.userNameLabelAndHint.tr(),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.userNameIsEmpty.tr();
                            } else if (value.length < 6) {
                              // print('hello ali1');
                              return LocaleKeys.userNameIsNotValid.tr();
                            } else if (value.isNotEmpty) {
                              if (value.toString().contains(' ')) {
                                // print('hello ali3');
                                return LocaleKeys.enterUserNameLoginText.tr();
                              } else {
                                // return validateStringWithNumber(
                                //     value.toString());
                              }
                            }
                            return null;
                          },
                          onTap: () {},
                          onSubmit: (String value) {},
                          onChanged: (String value) {},
                        ),
                        MyCustomDividerSize5(),
                        Directionality(
                          textDirection: ui.TextDirection.ltr,
                          child: MyTextFormField(
                            readOnly: false,
                            control: phoneController,
                            type: TextInputType.number,
                            isPassword: false,
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            label: LocaleKeys.phoneLabelAndHint.tr(),
                            hint: LocaleKeys.phoneLabelAndHint.tr(),
                            prefix: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: CountryPickerDropdown(
                                  initialValue: 'EG',
                                  isExpanded: false,
                                  iconSize: 14,
                                  dropdownColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  iconEnabledColor: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                  itemBuilder: buildCountryDropdownItem,
                                  priorityList: [
                                    CountryPickerUtils.getCountryByIsoCode(
                                        'GB'),
                                    CountryPickerUtils.getCountryByIsoCode(
                                        'CN'),
                                  ],
                                  sortComparator: (Country a, Country b) =>
                                      a.isoCode.compareTo(b.isoCode),
                                  onValuePicked: (Country country) {
                                    newValue = country.phoneCode.toString();
                                  },
                                ),
                              ),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.phoneIsEmpty.tr();
                              }
                              if (value.isNotEmpty) {
                                if (value.startsWith('0')) {
                                  return LocaleKeys.phoneNumberStartWithOne
                                      .tr();
                                } else {
                                  return validatePhoneNumber(value.toString());
                                }
                              }
                              return null;
                            },
                            onTap: () {},
                            onSubmit: (String value) {},
                            onChanged: (String value) {},
                            suffixClicked: () {},
                          ),
                        ),
                        MyCustomDividerSize5(),
                        MyTextFormField(
                            readOnly: false,
                            control: passwordController,
                            type: TextInputType.visiblePassword,
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            isPassword: cubit.ispassword,
                            label: LocaleKeys.passwordLabelAndHint.tr(),
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Checkbox(
                              activeColor: ColorManager.mainPrimaryColor4,
                              value: cubit.isAgree,
                              onChanged: (value) {
                                cubit.changeRepeatBool();
                              },
                            ),
                            Text(
                              LocaleKeys.agree.tr(),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            InkWell(
                              onTap: () {
                                showBottomSheet(context: context);
                              },
                              child: Text(
                                myLanguage == 'ar'
                                    ? LocaleKeys.conditions.tr()
                                    : LocaleKeys.terms.tr(),
                                style: TextStyle(
                                  color: ColorManager.mainPrimaryColor4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              LocaleKeys.and.tr(),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            InkWell(
                              onTap: () {
                                showBottomSheet(context: context);
                              },
                              child: Text(
                                myLanguage == 'ar'
                                    ? LocaleKeys.terms.tr()
                                    : LocaleKeys.conditions.tr(),
                                style: TextStyle(
                                    color: ColorManager.mainPrimaryColor4,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        if (cubit.isAgree == false &&
                            cubit.confirmAgree == true)
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                              LocaleKeys.agreeTermsAndConditionErrorText.tr(),
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorManager.error,
                              ),
                            ),
                          ),
                        MyCustomDividerSize5(),
                        MyElevatedButton(
                          onTap: () async {
                            if (formKey.currentState!.validate() &&
                                cubit.isAgree == true) {
                              await cubit.initialRegister(
                                  context: context,
                                  password: passwordController.text,
                                  passwordConfirmed:
                                      confirmPasswordController.text,
                                  phone: phoneController.text,
                                  typeId: cubit.registerType,
                                  userName: userNameController.text);
                              if (cubit.initialRegisterEntity.succeeded ==
                                  true) {
                                cubit.timerCount = 60;
                                cubit.countDownTimer();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                  return RegisterVerificationScreen(
                                    phoneNumber:
                                        phoneController.text.toString(),
                                    countryCode: newValue,
                                  );
                                }));
                              }
                            } else {
                              if (cubit.confirmAgree == true) {
                                return;
                              }
                              cubit.confirmChangeAgree();
                            }
                          },
                          buttonName: LocaleKeys.registerMainButton.tr(),
                          condition: state is! InitialRegisterLoadingState,
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
                                LocaleKeys.alreadyHaveAccount.tr(),
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
