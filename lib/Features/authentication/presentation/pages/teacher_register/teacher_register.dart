// ignore_for_file: avoid_print, must_be_immutable, deprecated_member_use, use_build_context_synchronously, unnecessary_null_comparison

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:hassy/Features/authentication/presentation/manager/auth_state.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../core/utils/shared/classes/year_validate.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../core/utils/shared/widgets/dropDownMultiSelect.dart';
import '../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../core/utils/shared/widgets/loclization_widget.dart';
import '../../../../../core/utils/shared/widgets/main_view_container.dart';
import '../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../../core/utils/shared/widgets/textFormfield.dart';

class TeacherRegisterScreen extends StatelessWidget {
  TeacherRegisterScreen({Key? key}) : super(key: key);
  bool isFileEmpty = false;
  final TextEditingController materialController = TextEditingController();
  final TextEditingController certificationName = TextEditingController();
  final TextEditingController certificationYear = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final MultiValueDropDownController multiValueDropDownController =
      MultiValueDropDownController();
  List<int> idsList = [];
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var cubit = AuthCubit.get(context);
    cubit.getTeacherMaterial(context: context);
    cubit.isFilePicked = false;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        );
        return KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onPanUpdateDownDirection,
          ],
          child: Scaffold(
            body: MainViewContainer(
              position: myMediaQuery(context: context).height / 4,
              cardHeight: myMediaQuery(context: context).height / 3.5,
              appBarHeight: AppSize.size3,
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
                            navigateAndFinish(context,
                                routeName: Routes.teacherMainScreenRoute);
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
                    LocaleKeys.teacherRegister.tr(),
                    style: getBoldStyle(
                      color: ColorManager.white,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              mainWidget: ConditionalBuilder(
                builder: (context) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            MyTextFormField(
                              readOnly: false,
                              control: certificationName,
                              isAutoValid: AutovalidateMode.onUserInteraction,
                              type: TextInputType.name,
                              isPassword: false,
                              hint: LocaleKeys.certificationLabelAndHint.tr(),
                              label: LocaleKeys.certificationLabelAndHint.tr(),
                              prefix: Icon(
                                Icons.history_edu_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .color,
                              ),
                              onTap: () {},
                              onSubmit: () {},
                              validator: (value) {
                                if (value.isEmpty) {
                                  return LocaleKeys.certificationNameErrorText
                                      .tr();
                                }
                                return null;
                              },
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MyTextFormField(
                              readOnly: false,
                              control: certificationYear,
                              isAutoValid: AutovalidateMode.onUserInteraction,
                              type: TextInputType.number,
                              isPassword: false,
                              hint: LocaleKeys.certificationYear.tr(),
                              label: LocaleKeys.certificationYear.tr(),
                              prefix: Icon(
                                Icons.date_range_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .color,
                              ),
                              onTap: () {},
                              onSubmit: () {},
                              validator: (value) {
                                if (value.isEmpty) {
                                  return LocaleKeys.certificationNameErrorText
                                      .tr();
                                }
                                if (value.isNotEmpty) {
                                  if (value.length > 4) {
                                    return LocaleKeys.yearMaxLength.tr();
                                  } else {
                                    return validateYear(value);
                                  }
                                }
                                return null;
                              },
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.uploadYourIdErrorText.tr(),
                                  style: getBoldStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color!),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Stack(
                              children: [
                                MyElevatedButton(
                                  height: mediaQuery.height / 18,
                                  width: double.infinity,
                                  borderWidth: AppSize.size2,
                                  radius: AppSize.size10,
                                  fontSize: AppSize.size18,
                                  onTap: () async {
                                    await cubit.uploadNewFile();
                                  },
                                  buttonName: LocaleKeys.uploadId.tr(),
                                  borderColor: ColorManager.mainPrimaryColor4,
                                  buttonColor: ColorManager.mainPrimaryColor4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.upload_file_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            cubit.isFilePicked &&
                                    cubit.teacherCertificationfilePath == null
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LocaleKeys.uploadYourIdErrorText.tr(),
                                          style: TextStyle(
                                              color: ColorManager.error,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            cubit.teacherCertificationfilePath == null
                                ? const SizedBox()
                                : Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Container(
                                        height: mediaQuery.height / 20,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorManager.darkGrey),
                                          color: ColorManager.grey1,
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  right: Radius.circular(
                                                      AppSize.size20),
                                                  left: Radius.circular(
                                                      AppSize.size20)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            AuthCubit.get(context)
                                                .teacherCertificationfilePath!
                                                .names
                                                .single
                                                .toString(),
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .color,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            await cubit.cancelUploadedFile();
                                          },
                                          icon: Icon(
                                            Icons.cancel,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          )),
                                    ],
                                  ),
                            const MyCustomDividerSize10(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.uploadCertificationLabel.tr(),
                                  style: getBoldStyle(
                                      // fontSize: 8,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color!),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Stack(
                              children: [
                                MyElevatedButton(
                                    height: mediaQuery.height / 18,
                                    width: double.infinity,
                                    borderWidth: AppSize.size2,
                                    radius: AppSize.size10,
                                    fontSize: AppSize.size18,
                                    onTap: () async {
                                      await AuthCubit.get(context)
                                          .uploadNewMultiFiles();
                                    },
                                    buttonName:
                                        LocaleKeys.uploadCertifications.tr(),
                                    borderColor: ColorManager.mainPrimaryColor4,
                                    buttonColor:
                                        ColorManager.mainPrimaryColor4),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.upload_file_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            cubit.isFilePicked &&
                                    cubit.myTeacherMultiFilesList.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LocaleKeys
                                              .selectCertificationErrorText
                                              .tr(),
                                          style: TextStyle(
                                              color: ColorManager.error,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            ConditionalBuilder(
                                condition:
                                    cubit.myTeacherMultiFilesList != null,
                                builder: (context) => Column(
                                      children: [
                                        GridView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.only(
                                            top: AppPadding.padding5,
                                            bottom: AppPadding.padding5,
                                            right: 1,
                                          ),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 4,
                                            mainAxisExtent: 50,
                                            crossAxisSpacing: 10,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: AuthCubit.get(context)
                                              .myTeacherMultiFilesList
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Stack(
                                              alignment: Alignment.centerLeft,
                                              // fit: StackFit.loose,
                                              children: [
                                                Container(
                                                  height:
                                                      mediaQuery.height / 20,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: ColorManager
                                                            .darkGrey),
                                                    color: ColorManager.grey1,
                                                    borderRadius:
                                                        const BorderRadius
                                                            .horizontal(
                                                      right: Radius.circular(
                                                        AppSize.size20,
                                                      ),
                                                      left: Radius.circular(
                                                        AppSize.size20,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 22.0,
                                                      right: 22,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        AuthCubit.get(context)
                                                            .myTeacherMultiFilesList[
                                                                index]
                                                            .path
                                                            .split('/')[7]
                                                            .split('/')[0],
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText2!
                                                                .color,
                                                            fontSize: 12),
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.right,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () async {
                                                    cubit.cancelFileFromList(
                                                        index);
                                                  },
                                                  icon: Icon(
                                                    Icons.cancel,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                fallback: (context) => Container(
                                      height: 0,
                                    )),
                            const MyCustomDividerSize10(),
                            DropDownMultiSelect(
                              list: cubit.teacherMaterialEntity!.materials.map(
                                (e) {
                                  return DropDownValueModel(
                                    name: e.materialName.toString(),
                                    value: e.id,
                                  );
                                },
                              ).toList(),
                              multiValueDropDownController:
                                  multiValueDropDownController,
                              onChanged: (value) {
                                idsList.clear();
                                value.forEach((newValue) {
                                  idsList.add(newValue.value);
                                });
                                // debugPrint(idsList.toString());
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LocaleKeys.selectMaterialErrorText
                                      .tr();
                                }
                                return null;
                              },
                              label: Text(LocaleKeys.educationMaterial.tr()),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyElevatedButton(
                              height: mediaQuery.height / 15,
                              width: double.infinity,
                              borderWidth: AppSize.size2,
                              radius: AppSize.size10,
                              fontSize: AppSize.size18,
                              onTap: cubit.teacherCertificationfilePath !=
                                          null &&
                                      cubit.myTeacherMultiFilesList.isNotEmpty
                                  ? () async {
                                      if (formKey.currentState!.validate()) {
                                        await cubit.teacherFinalRegister(
                                          context: context,
                                          certificationName:
                                              certificationName.text.toString(),
                                          certificationYear: int.parse(
                                              certificationYear.text
                                                  .toString()),
                                          material: idsList,
                                          attachment:
                                              cubit.myTeacherMultiFilesList,
                                          idImage:
                                              cubit.teacherCertificationFile!,
                                        );
                                      }
                                    }
                                  : () {
                                      cubit.changeFilePickedBool(
                                          isPicked: cubit.isFilePicked);
                                      print('c');
                                      print(cubit.myTeacherMultiFilesList);
                                    },
                              buttonName: LocaleKeys.submiButton.tr(),
                              borderColor: ColorManager.mainPrimaryColor4,
                              buttonColor: ColorManager.mainPrimaryColor4,
                              condition:
                                  state is! TeacherFinalRegisterLoadingtate,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                condition:
                    // true,
                    cubit.teacherMaterialEntity != null,
                fallback: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
