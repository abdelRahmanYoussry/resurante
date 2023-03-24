// ignore_for_file: must_be_immutable, unused_field, unnecessary_null_in_if_null_operators, unused_local_variable, deprecated_member_use, use_build_context_synchronously, avoid_print, unnecessary_null_comparison

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_state.dart';
import 'package:hassy/core/utils/shared/app/assets_manager.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/app/font_manager.dart';
import 'package:hassy/core/utils/shared/app/styles_manager.dart';
import 'package:hassy/core/utils/shared/app/values_manager.dart';
import 'package:hassy/core/utils/shared/classes/email_validator.dart';
import 'package:hassy/core/utils/shared/classes/number_validate.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:hassy/core/utils/shared/translations/locale_keys.g.dart';
import 'package:hassy/core/utils/shared/widgets/elevatedButton.dart';
import 'package:hassy/core/utils/shared/widgets/main_view_container.dart';
import 'package:hassy/core/utils/shared/widgets/textFormfield.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../core/utils/shared/widgets/loclization_widget.dart';
import '../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';

class RegisterStepTwoScreen extends StatelessWidget {
  RegisterStepTwoScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _idImagePathController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController _personalImagePathController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  // var isStudent = CacheHelper.getSharedPreferencesValue(
  //         key: AppStrings.cachedStudentBool) ??
  //     null;
  // bool isTeacher = CacheHelper.getSharedPreferencesValue(
  //         key: AppStrings.cachedTeacherBool) ??
  //     null;
  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var uploadProfileImage =
            AuthCubit.get(context).profileImageFile ?? null;
        return Form(
          key: formKey,
          child: KeyboardDismisser(
            gestures: const [
              GestureType.onTap,
              GestureType.onPanUpdateDownDirection,
            ],
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: MainViewContainer(
                  position: myMediaQuery(context: context).height / 3.8,
                  appBarHeight: AppSize.size3_5,
                  cardHeight: myMediaQuery(context: context).height / 3.8,
                  cardWidth: AppSize.size20,
                  titleWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: AppPadding.padding5, left: 5),
                            child: MyElevatedButton(
                              buttonName: LocaleKeys.skip.tr(),
                              buttonColor: ColorManager.mainPrimaryColor4,
                              onTap: () async {
                                await cubit.getUserData(context: context);
                                print(cubit.userDataEntity.userData.typeId);
                                // print(cubit.typeId);
                                if (cubit.typeId == 1) {
                                  navigateAndFinish(context,
                                      routeName: Routes.teacherMainScreenRoute);
                                } else if (cubit.typeId == 2) {
                                  navigateAndFinish(context,
                                      routeName: Routes.studentMainScreenRoute);
                                }
                                // if (nextRoute == 'teacher') {
                                //   navigateAndFinish(context,
                                //       routeName: Routes.teacherMainScreenRoute);
                                // } else if (nextRoute == 'student') {
                                //   navigateAndFinish(context,
                                //       routeName: Routes.studentMainScreenRoute);
                                // }
                              },
                              height: AppSize.size50,
                              width: AppSize.size100,
                              textColor: Colors.black,
                              borderColor: ColorManager.mainPrimaryColor4,
                              borderWidth: AppSize.size2,
                              radius: AppSize.size70,
                              fontSize: FontSize.size14,
                            ),
                          ),
                          const Spacer(),
                          LoclizationWidget(
                            context: context,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: myMediaQuery(context: context).height / 30,
                      ),
                      Text(
                        LocaleKeys.theregistrationCompletionStage.tr(),
                        style: getBoldStyle(
                          color: ColorManager.white,
                          fontSize: 22,
                        ),
                      ),
                      // Row(
                      //   children: const [
                      //     ChangeThemeMode(),
                      //     Spacer(),
                      //     ChangeStyleWidget(),
                      //   ],
                      // )
                    ],
                  ),
                  mainWidget: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const MyCustomDividerSize5(),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                  radius: 40,
                                  backgroundImage: uploadProfileImage == null
                                      ? const AssetImage(ImageAssets.userAvatar)
                                      : FileImage(uploadProfileImage)
                                          as ImageProvider),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: ColorManager.mainPrimaryColor4,
                                child: IconButton(
                                  onPressed: () async {
                                    await AuthCubit.get(context)
                                        .getProfileImage();
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.camera,
                                    color: ColorManager.white,
                                  ),
                                  iconSize: 14,
                                ),
                              )
                            ],
                          ),
                          const MyCustomDividerSize5(),
                          MyTextFormField(
                            readOnly: false,
                            control: _nameController,
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            // textInputFormat: "[a-z A-Z0-9]",
                            type: TextInputType.name,
                            isPassword: false,
                            hint: LocaleKeys.nameLabelAndHintText.tr(),
                            label: LocaleKeys.nameLabelAndHintText.tr(),
                            prefix: const Icon(
                              FontAwesomeIcons.person,
                              // color:
                              //     Theme.of(context).textTheme.subtitle1!.color,
                            ),
                            onTap: () {},
                            onSubmit: () {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return LocaleKeys.userNameIsEmpty.tr();
                              }
                              if (value.length == 3) {
                                return LocaleKeys.userAlreadyExit.tr();
                              }
                              if (value.isNotEmpty) {
                                // return validateStringWithNumber(
                                //     value.toString());
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                          const MyCustomDividerSize5(),
                          MyTextFormField(
                            readOnly: false,
                            control: _idController,
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            type: TextInputType.number,
                            isPassword: false,
                            hint: LocaleKeys.nationalityNumber.tr(),
                            label: LocaleKeys.nationalityNumber.tr(),
                            validator: (value) {
                              if (value.isEmpty) {
                                return LocaleKeys.idIsEmpty.tr();
                              }
                              if (value.isNotEmpty) {
                                return validateNumber(value);
                              }
                              return null;
                            },
                            prefix: const Icon(
                              FontAwesomeIcons.idCard,
                            ),
                            onTap: () {},
                            onSubmit: (value) {},
                            onChanged: (value) {},
                          ),
                          const MyCustomDividerSize5(),
                          MyTextFormField(
                            readOnly: true,
                            control: dateController,
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            type: TextInputType.name,
                            isPassword: false,
                            label: LocaleKeys.birthDateTimeText.tr(),
                            prefix: const Icon(
                              FontAwesomeIcons.calendarCheck,
                              // color:
                              //     Theme.of(context).textTheme.subtitle1!.color,
                            ),
                            onTap: () async {
                              await DatePicker.showSimpleDatePicker(context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1940),
                                  lastDate: DateTime(21160),
                                  dateFormat: "dd-MMMM-yyyy",
                                  locale: context.locale.languageCode == 'ar'
                                      ? DateTimePickerLocale.ar
                                      : DateTimePickerLocale.en_us,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  titleText: LocaleKeys.selectedDateText.tr(),
                                  cancelText: LocaleKeys.cancelText.tr(),
                                  confirmText: LocaleKeys.okText.tr(),
                                  looping: true,
                                  textColor: ColorManager.mainPrimaryColor4,
                                  pickerMode: DateTimePickerMode.date,
                                  itemTextStyle: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  )).then((value) {
                                var formatter =
                                    context.locale.languageCode == 'en'
                                        ? DateFormat('MM-dd-yyyy')
                                        : DateFormat('dd-MM-yyyy');
                                String formattedDate = formatter.format(value!);
                                dateController.text = formattedDate;
                              }).catchError((error) {});
                            },
                            onSubmit: (value) {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return LocaleKeys.birthDayValidation.tr();
                              }
                              if (value.isNotEmpty) {
                                return validateEmail(value);
                              }
                              return null;
                            },
                            onChanged: (value) {
                              print(value);
                            },
                          ),
                          const MyCustomDividerSize5(),
                          MyTextFormField(
                            readOnly: false,
                            control: _emailController,
                            type: TextInputType.emailAddress,
                            isPassword: false,
                            hint: LocaleKeys.emailLabelAndHint.tr(),
                            label: LocaleKeys.emailLabelAndHint.tr(),
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            prefix: const Icon(
                              Icons.email,
                              // color: Theme.of(context)
                              //     .textTheme
                              //     .subtitle1!
                              //     .color
                            ),
                            onTap: () {},
                            onSubmit: () {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return LocaleKeys.emailIsEmpty.tr();
                              }
                              if (value.isNotEmpty) {
                                return validateEmail(value);
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                          const MyCustomDividerSize5(),
                          MyTextFormField(
                            readOnly: false,
                            control: _addressController,
                            textInputFormat: "[a-z A-Z0-9 @ . أ-ي ]",
                            type: TextInputType.text,
                            isPassword: false,
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            hint: LocaleKeys.userAddress.tr(),
                            label: LocaleKeys.userAddress.tr(),
                            prefix: const Icon(
                              FontAwesomeIcons.locationArrow,
                              // color:
                              //     Theme.of(context).textTheme.subtitle1!.color,
                            ),
                            onTap: () {},
                            onSubmit: (value) {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return LocaleKeys.addressisEmpty.tr();
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                          const MyCustomDividerSize10(),
                          MyElevatedButton(
                              height: AppSize.size50,
                              width: double.infinity,
                              borderWidth: AppSize.size2,
                              radius: AppSize.size10,
                              condition: state is! RegisterStepTwoLoadingState,
                              fontSize: FontSize.size18,
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  await cubit.registerStepTwo(
                                      context: context,
                                      name: _nameController.text.toString(),
                                      address:
                                          _addressController.text.toString(),
                                      birthDate: dateController.text,
                                      idNumber: _idController.text.toString(),
                                      email: _emailController.text.toString(),
                                      image: uploadProfileImage);
                                  // if (CacheHelper.getSharedPreferencesValue(
                                  //         key: AppStrings
                                  //             .registerStepTwoSkipped) ==
                                  //     null) {
                                  //
                                  // }
                                  //
                                  // debugPrint(
                                  //     CacheHelper.getSharedPreferencesValue(
                                  //             key: AppStrings
                                  //                 .registerStepOneSkipped)
                                  //         .toString());
                                  // if (CacheHelper.getSharedPreferencesValue(
                                  //         key: AppStrings
                                  //             .registerStepOneSkipped) ==
                                  //     null) {
                                  //   debugPrint('normal register');
                                  //   await cubit.registerStepTwo(
                                  //       context: context,
                                  //       name: _nameController.text.toString(),
                                  //       address:
                                  //           _addressController.text.toString(),
                                  //       birthDate: dateController.text,
                                  //       idNumber: _idController.text.toString(),
                                  //       email: _emailController.text.toString(),
                                  //       image: uploadProfileImage);
                                  // } else {
                                  //   debugPrint('Edit  register');
                                  //   await StudentCubit.get(context)
                                  //       .updateUserBasicData(
                                  //           name:
                                  //               _nameController.text.toString(),
                                  //           address: _addressController.text
                                  //               .toString(),
                                  //           email: _emailController.text
                                  //               .toString(),
                                  //           birthDate: dateController.text,
                                  //           context: context);
                                }
                                // debugPrint(dateController.text);
                                // if (cubit.userDataEntity.userData.email ==
                                //     null) {
                                //   debugPrint('normaly register');
                                // } else {
                                //   debugPrint('Edit  register');
                                // }
                              },
                              buttonName: LocaleKeys.submiButton.tr(),
                              borderColor: ColorManager.mainPrimaryColor4,
                              buttonColor: ColorManager.mainPrimaryColor4),
                          // const SizedBox(
                          //   height: AppSize.size5,
                          // )
                        ],
                      ),
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
}
