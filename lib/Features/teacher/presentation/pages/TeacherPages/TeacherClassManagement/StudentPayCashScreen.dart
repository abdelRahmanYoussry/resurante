// ignore_for_file: prefer_const_constructors_in_immutables, file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_10.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../../core/utils/shared/widgets/textFormfield.dart';

class StudentPayCashScreen extends StatelessWidget {
  StudentPayCashScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        mycolor: ColorManager.mainPrimaryColor4,
        isLeading: true,
        toolBarHeight: myMediaQuery(context: context).height / 14,
        title: Text(
          LocaleKeys.confirmAttendance.tr(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.studentName.tr(),
                  style: getBoldStyle(
                    color: ColorManager.textFormBorderColor,
                    fontSize: FontSize.size20,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 300,
                  child: MyTextFormField(
                    readOnly: true,
                    control: searchController,
                    isAutoValid: AutovalidateMode.onUserInteraction,
                    type: TextInputType.name,
                    isPassword: false,
                    // LocaleKeys.studentName.tr(),
                    hint: 'Ali Mahmoud Ali',
                    prefix: Icon(
                      Icons.search,
                      color: ColorManager.mainPrimaryColor4,
                    ),
                    onTap: () {},
                    onSubmit: () {},
                    validator: (value) {},
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const MyCustomDividerSize10(),
            Text(
              "${LocaleKeys.collectAnAmount.tr()} 1000EGP",
              style: getBoldStyle(
                color: ColorManager.textFormBorderColor,
                fontSize: FontSize.size20,
              ),
            ),
            const MyCustomDividerSize10(),
            MyElevatedButton(
              radius: 10,
              textColor: ColorManager.white,
              height: myMediaQuery(context: context).height,
              width: myMediaQuery(context: context).width,
              borderColor: ColorManager.mainPrimaryColor4,
              fontSize: FontSize.size18,
              onTap: () {},
              borderWidth: 2,
              buttonName: LocaleKeys.confirmAttendance.tr(),
              buttonColor: ColorManager.mainPrimaryColor4,
            ),
          ],
        ),
      ),
    );
  }
}
