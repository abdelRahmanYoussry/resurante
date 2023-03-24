// ignore_for_file: file_names, duplicate_ignore, prefer_const_constructors_in_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/app/font_manager.dart';
import 'package:hassy/core/utils/shared/app/styles_manager.dart';
import 'package:hassy/core/utils/shared/app/values_manager.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';

class StudentClassCodeScreen extends StatelessWidget {
  StudentClassCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        mycolor: ColorManager.mainPrimaryColor4,
        isLeading: true,
        toolBarHeight: myMediaQuery(context: context).height / 14,
        title: Text(
          LocaleKeys.classCodeDetailsText.tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: ColorManager.mainPrimaryColor4,
            borderRadius: BorderRadius.circular(
              AppSize.size10,
            ),
          ),
          height: myMediaQuery(context: context).height / 4,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  '${LocaleKeys.classCodeDetailsText.tr()} Is',
                  style: getBoldStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.size18,
                  ),
                ),
                const MyCustomDividerSize10(),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.white,
                      width: AppSize.size3,
                    ),
                    borderRadius: BorderRadius.circular(
                      AppSize.size10,
                    ),
                  ),
                  height: myMediaQuery(context: context).height / 10,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '256987521',
                        style: getBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.size18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
