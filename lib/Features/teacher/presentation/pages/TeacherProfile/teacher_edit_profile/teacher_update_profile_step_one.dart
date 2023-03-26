// ignore_for_file: deprecated_member_use, unused_local_variable, unnecessary_null_in_if_null_operators

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_cubit.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_state.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../../core/utils/shared/app/assets_manager.dart';
import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/classes/email_validator.dart';
import '../../../../../../core/utils/shared/classes/user_name_validate.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
import '../../../../../../core/utils/shared/widgets/textFormfield.dart';
import '../../../manager/TeacherProfile/teacher_profile_cubit.dart';

class TeacherUpdateProfileStepOne extends StatelessWidget {
  TeacherUpdateProfileStepOne({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController personalImagePathController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = TeacherProfileCubit.get(context);
    var formatter = context.locale.languageCode == 'en'
        ? DateFormat('MM-dd-yyyy')
        : DateFormat('dd-MM-yyyy');
    String formattedDate = '';
    if (cubit.userDataEntity.userData.birthDate != null) {
      formattedDate = formatter.format(
          DateTime.parse(cubit.userDataEntity.userData.birthDate.toString()));
    }
    dateController.text = formattedDate;
    nameController.text = cubit.userDataEntity.userData.name.toString();
    idController.text = cubit.userDataEntity.userData.idNumber.toString();
    dateController.text = formattedDate;
    emailController.text = cubit.userDataEntity.userData.email.toString();
    addressController.text = cubit.userDataEntity.userData.address.toString();
    return BlocConsumer<TeacherProfileCubit, TeacherProfileState>(
      listener: (context, state) {
        // if (state is UpdateUserProfileImageLoadingState) {
        //   cubit.profileImageFile = null;
        //   cubit.getUserData(context: context);
        // }
      },
      builder: (context, state) {
        var uploadProfileImage = cubit.profileImageFile ?? null;
        return Form(
          key: formKey,
          child: KeyboardDismisser(
            gestures: const [
              GestureType.onTap,
              GestureType.onPanUpdateDownDirection,
            ],
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: [
                        if (state is UpdateUserProfileImageLoadingState)
                          const LinearProgressIndicator(),
                        const MyCustomDividerSize5(),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                                radius: 40,
                                backgroundImage: cubit.userDataEntity.userData
                                                .userImagePath ==
                                            null &&
                                        uploadProfileImage == null
                                    ? const AssetImage(ImageAssets.userAvatar)
                                    : uploadProfileImage == null
                                        ? NetworkImage(cubit.userDataEntity
                                            .userData.userImagePath
                                            .toString())
                                        : FileImage(uploadProfileImage)
                                            as ImageProvider),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: ColorManager.mainPrimaryColor4,
                              child: IconButton(
                                onPressed: () async {
                                  await cubit.getProfileImage();
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
                          control: nameController,
                          isAutoValid: AutovalidateMode.onUserInteraction,
                          type: TextInputType.name,
                          isPassword: false,
                          hint: LocaleKeys.nameLabelAndHintText.tr(),
                          label: LocaleKeys.nameLabelAndHintText.tr(),
                          prefix: Icon(
                            FontAwesomeIcons.person,
                            color: Theme.of(context).textTheme.subtitle1!.color,
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
                              return validateStringWithNumber(value.toString());
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                        const MyCustomDividerSize5(),
                        const MyCustomDividerSize5(),
                        MyTextFormField(
                          readOnly: true,
                          control: dateController,
                          isAutoValid: AutovalidateMode.onUserInteraction,
                          type: TextInputType.name,
                          isPassword: false,
                          label: LocaleKeys.birthDateTimeText.tr(),
                          prefix: Icon(
                            FontAwesomeIcons.calendarCheck,
                            color: Theme.of(context).textTheme.subtitle1!.color,
                          ),
                          onTap: () async {
                            await DatePicker.showSimpleDatePicker(
                              context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1940),
                              lastDate: DateTime(21160),
                              dateFormat: "dd-MMMM-yyyy",
                              titleText: LocaleKeys.selectedDateText.tr(),
                              cancelText: LocaleKeys.cancelText.tr(),
                              confirmText: LocaleKeys.okText.tr(),
                              looping: true,
                              pickerMode: DateTimePickerMode.date,
                            ).then((value) {
                              var formatter =
                                  context.locale.languageCode == 'en'
                                      ? DateFormat('MM-dd-yyyy')
                                      : DateFormat('MM-dd-yyyy');
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
                          onChanged: (value) {},
                        ),
                        const MyCustomDividerSize5(),
                        MyTextFormField(
                          readOnly: false,
                          control: emailController,
                          type: TextInputType.emailAddress,
                          isPassword: false,
                          hint: LocaleKeys.emailLabelAndHint.tr(),
                          label: LocaleKeys.emailLabelAndHint.tr(),
                          isAutoValid: AutovalidateMode.onUserInteraction,
                          prefix: Icon(Icons.email,
                              color:
                                  Theme.of(context).textTheme.subtitle1!.color),
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
                          control: addressController,
                          textInputFormat: "[a-z A-Z0-9 @ . أ-ي ]",
                          type: TextInputType.text,
                          isPassword: false,
                          isAutoValid: AutovalidateMode.onUserInteraction,
                          hint: LocaleKeys.userAddress.tr(),
                          label: LocaleKeys.userAddress.tr(),
                          prefix: Icon(
                            FontAwesomeIcons.locationArrow,
                            color: Theme.of(context).textTheme.subtitle1!.color,
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
                          fontSize: FontSize.size18,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              if (uploadProfileImage == null) {
                                cubit.teacherUpdateBasicData(
                                  name: nameController.text,
                                  address: addressController.text,
                                  email: emailController.text,
                                  birthDate: dateController.text,
                                  context: context,
                                );
                              } else {
                                cubit.teacherUpdateBasicData(
                                  name: nameController.text,
                                  address: addressController.text,
                                  email: emailController.text,
                                  birthDate: dateController.text,
                                  context: context,
                                );
                                await cubit.updateUserProfileImage(
                                    image: uploadProfileImage,
                                    context: context);
                              }
                            }
                          },
                          buttonName: LocaleKeys.submiButton.tr(),
                          borderColor: ColorManager.mainPrimaryColor4,
                          buttonColor: ColorManager.mainPrimaryColor4,
                          condition:
                              state is! TeacherUpdateBasicDataLoadingState,
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
}
