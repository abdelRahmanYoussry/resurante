// ignore_for_file: prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/app/font_manager.dart';
import 'package:hassy/core/utils/shared/app/styles_manager.dart';

import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/changeStyleWidget.dart';
import '../../../../../../core/utils/shared/widgets/changeThemeMode.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/loclization_widget.dart';

class StudentSettingScreen extends StatelessWidget {
  StudentSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          LocaleKeys.settingProfileScreen.tr(),
          style: TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
        ),
        mycolor: ColorManager.mainPrimaryColor4,
        toolBarHeight: myMediaQuery(context: context).height / 10,
        isLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.size10),
                color: ColorManager.mainPrimaryColor4.withOpacity(0.5),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.languageText.tr(),
                      style: getBoldStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontSize: FontSize.size14,
                      ),
                    ),
                    const Spacer(),
                    LoclizationWidget(
                      context: context,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ChangeThemeMode(),
                Spacer(),
                ChangeStyleWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
