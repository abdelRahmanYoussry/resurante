// ignore_for_file: must_be_immutable, unused_import, deprecated_member_use, use_build_context_synchronously, avoid_print, file_names

import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_state.dart';
import 'package:hassy/Features/authentication/presentation/pages/register_level_2/register_level_2_screen.dart';
import 'package:hassy/Features/home/presentation/manager/home_cubit.dart';
import 'package:hassy/core/utils/shared/app/constant_manager.dart';
import 'package:hassy/core/utils/shared/app/styles_manager.dart';
import 'package:hassy/core/utils/shared/app_routes/routes_manager.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../core/utils/shared/components/oldComponents/dropDownMenu.dart';
import '../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../core/utils/shared/widgets/changeThemeMode.dart';
import '../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../core/utils/shared/widgets/loclization_widget.dart';
import '../../../../../core/utils/shared/widgets/main_view_container.dart';
import '../../../../../core/utils/shared/widgets/textButton.dart';

class RegisterVerificationScreen extends StatelessWidget {
  RegisterVerificationScreen(
      {Key? key, required this.phoneNumber, required this.countryCode})
      : super(key: key);
  final formKey = GlobalKey<FormState>();
  late int verificationCode;
  final String phoneNumber;
  final String countryCode;
  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onPanUpdateDownDirection,
          ],
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: MainViewContainer(
              appBarHeight: AppSize.size5,
              position: myMediaQuery(context: context).height / 3.5,
              cardHeight: myMediaQuery(context: context).height / 2.5,
              cardWidth: AppSize.size20,
              titleWidget: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      LocaleKeys.verificationTitle.tr(),
                      style: getBoldStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              mainWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LocaleKeys.verificationMainText.tr(),
                    style: TextStyle(
                      height: 1.3,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${LocaleKeys.yourPhoneNumber.tr()}+$countryCode$phoneNumber',
                    style: TextStyle(
                      height: 1.3,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Directionality(
                        textDirection: ui.TextDirection.ltr,
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: getBoldStyle(
                            color: Colors.green.shade600,
                          ),
                          length: 6,
                          obscureText: false,
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 6) {
                              return LocaleKeys.confirmValidateMessage.tr();
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: AppSize.size50,
                            inactiveFillColor: ColorManager.mainPrimaryColor4,
                            fieldWidth: AppSize.size40,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: ColorManager.white,
                          animationDuration: const Duration(
                            milliseconds: AppConstants.sliderAnimation,
                          ),
                          enableActiveFill: true,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: AppSize.size10,
                            )
                          ],
                          textStyle: const TextStyle(color: Colors.black),
                          onCompleted: (v) {
                            verificationCode = int.parse(v);
                            debugPrint(verificationCode.toString());
                            debugPrint("Completed");
                          },
                          onChanged: (value) {},
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            return true;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '${cubit.timerCount}   Seconds',
                        style: getBoldStyle(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color!,
                            fontSize: FontSize.size14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          LocaleKeys.notReceiveCode.tr(),
                          style: getBoldStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color!,
                              fontSize: FontSize.size14),
                        ),
                      ),
                      MyTextButton(
                        text: LocaleKeys.resendButton.tr(),
                        width: AppSize.size138,
                        function: cubit.timerCount == 0
                            ? () async {
                                cubit.timerCount = 61;
                                cubit.countDownTimer();
                                print(cubit.initialRegisterEntity.data);
                                await cubit.resendVerification(
                                    userId: int.parse(
                                        cubit.initialRegisterEntity.data),
                                    context: context);
                              }
                            : null,
                        textColor: cubit.timerCount == 0
                            ? ColorManager.mainPrimaryColor4
                            : ColorManager.error,
                        ////
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyElevatedButton(
                    buttonName: LocaleKeys.confirmButton.tr(),
                    height: AppSize.size50,
                    width: double.infinity,
                    textColor: ColorManager.white,
                    borderColor: ColorManager.transparentColor,
                    borderWidth: AppSize.size_0,
                    fontSize: FontSize.size14,
                    radius: AppSize.size10,
                    buttonColor: ColorManager.mainPrimaryColor4,
                    condition: state is! VerificationRegisterLoadingState,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await cubit.verificationRegister(
                            context: context,
                            userId: int.parse(cubit.initialRegisterEntity.data),
                            verificationCode: verificationCode);

                        if (cubit.verificationRegisterEntity.succeeded ==
                            true) {
                          showToast(
                              text: LocaleKeys.verificationMessage.tr(),
                              state: ToastState.Success);
                          navigateAndFinish(context,
                              routeName: Routes.registerStep2Route);
                        }
                      }
                    },
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
