// ignore_for_file: deprecated_member_use, file_names

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_10.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/CustomDropDown.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
import '../../../../../../core/utils/shared/widgets/textFormfield.dart';
import '../../../manager/student_profile_cubit/student_profile_cubit.dart';

// ignore: must_be_immutable
class StudentHelpAndComplaintsScreen extends StatelessWidget {
  StudentHelpAndComplaintsScreen({Key? key}) : super(key: key);
  late SingleValueDropDownController classPlaceController =
      SingleValueDropDownController();
  final TextEditingController compTitleController = TextEditingController();
  final TextEditingController compSubjectController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = StudentProfileCubit.get(context);
    int complainId = 0;
    return BlocConsumer<StudentProfileCubit, StudentProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onPanUpdateDownDirection,
          ],
          child: Scaffold(
            appBar: CustomAppBar(
              title: Text(
                LocaleKeys.helpAndComplaintsText.tr(),
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText2!.color),
              ),
              mycolor: ColorManager.mainPrimaryColor4,
              toolBarHeight: myMediaQuery(context: context).height / 10,
              isLeading: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const MyCustomDividerSize10(),
                      MyCustomDropDown(
                          enableSearch: false,
                          enableDropDown: true,
                          dropDownValueList:
                              cubit.getComplaintsEntity.complaintsData.map((e) {
                            return DropDownValueModel(
                                name: e.name.toString(), value: e.id);
                          }).toList(),
                          isAutoValid: AutovalidateMode.onUserInteraction,
                          controller: classPlaceController,
                          onChanged: (value) {
                            if (value == "") {
                              return;
                            }
                            complainId = int.parse(value.value.toString());
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.compalintsTypeErrorText.tr();
                            } else {
                              return null;
                            }
                          },
                          label: Text(LocaleKeys.complaintsTypeText.tr())),
                      const MyCustomDividerSize5(),
                      MyTextFormField(
                        readOnly: false,
                        control: compTitleController,
                        isAutoValid: AutovalidateMode.onUserInteraction,
                        type: TextInputType.name,
                        isPassword: false,
                        hint: LocaleKeys.complaintsTitle.tr(),
                        label: LocaleKeys.complaintsTitle.tr(),
                        onTap: () {},
                        onSubmit: () {},
                        validator: (value) {
                          if (value.isEmpty) {
                            return LocaleKeys.complaintsTitleErrorText.tr();
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      const MyCustomDividerSize5(),
                      MyTextFormField(
                        readOnly: false,
                        control: compSubjectController,
                        maxText: 15,
                        isAutoValid: AutovalidateMode.onUserInteraction,
                        type: TextInputType.name,
                        isPassword: false,
                        hint: LocaleKeys.compalintsSubject.tr(),
                        onTap: () {},
                        onSubmit: (value) {
                          debugPrint(value);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return LocaleKeys.compalintsSubjectErrorText.tr();
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
                        condition: state is! AddComplaintsLoadingState,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            cubit.addComplaints(
                              complaintTypeId: complainId,
                              title: compTitleController.text,
                              body: compSubjectController.text,
                              context: context,
                            );
                          }
                        },
                        buttonName: LocaleKeys.sendButtonText.tr(),
                        borderColor: ColorManager.mainPrimaryColor4,
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
