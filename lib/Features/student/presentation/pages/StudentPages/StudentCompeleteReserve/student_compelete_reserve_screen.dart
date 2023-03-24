// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/app/values_manager.dart';
import 'package:hassy/core/utils/shared/app_routes/routes_manager.dart';
import 'package:hassy/core/utils/shared/chace_helper/cache_helper.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_10.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_5.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../widgets/class_compelete_reserv_widget.dart';

class ClassesReserveDetailsScreen extends StatelessWidget {
  ClassesReserveDetailsScreen({Key? key, this.isPrevious}) : super(key: key);
  bool? isPrevious;
  @override
  Widget build(BuildContext context) {
    var myLocale =
        CacheHelper.getSharedPreferencesValue(key: AppStrings.localCode);
    return Scaffold(
      appBar: CustomAppBar(
        mycolor: ColorManager.mainPrimaryColor4,
        isLeading: true,
        toolBarHeight: myMediaQuery(context: context).height / 14,
        title: Text(
          LocaleKeys.classCompleteTheReservationText.tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClassesReserveDetailsWidget(
              classTitleString: '${LocaleKeys.classMaterialNameText.tr()} :',
              classNoteString: 'Math',
              classNoteColor: ColorManager.mainPrimaryColor4,
            ),
            const MyCustomDividerSize10(),
            ClassesReserveDetailsWidget(
              classTitleString: '${LocaleKeys.classTeacherNameText.tr()} :',
              classNoteString: 'Ali Mahmoud Ali Hassan',
              classNoteColor: ColorManager.mainPrimaryColor4,
            ),
            const MyCustomDividerSize10(),
            ClassesReserveDetailsWidget(
              classTitleString:
                  '${LocaleKeys.lessonTitleMainTextAndLabel.tr()} :',
              classNoteString: '     Oral',
              classNoteColor: ColorManager.mainPrimaryColor4,
            ),
            const MyCustomDividerSize10(),
            ClassesReserveDetailsWidget(
              classTitleString: '${LocaleKeys.noteAddressAndHintLabel.tr()} :',
              maxTextLines: 2,
              classNoteString:
                  'Have Exam In Math Material Chapter 6 For Fifth Grade',
              classNoteColor: ColorManager.mainPrimaryColor4,
            ),
            const MyCustomDividerSize10(),
            Center(
              child: Text(
                LocaleKeys.classTimeText.tr(),
                style: getBoldStyle(
                  color: ColorManager.darkGrey,
                  fontSize: FontSize.size18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorManager.mainPrimaryColor4,
                        width: AppSize.size1_5,
                      ),
                    ),
                    child: ClassesReserveDetailsWidget(
                      classTitleString: LocaleKeys.classTimeFromTimeText.tr(),
                      classNoteString: '10:30 pm',
                      classNoteColor: ColorManager.darkGrey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 150,
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorManager.mainPrimaryColor4,
                        width: AppSize.size1_5,
                      ),
                    ),
                    child: ClassesReserveDetailsWidget(
                      classTitleString: LocaleKeys.classTimeToTimeText.tr(),
                      classNoteString: '01:30 pm',
                      classNoteColor: ColorManager.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
            const MyCustomDividerSize10(),
            Stack(
              alignment: myLocale == 'ar'
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              children: [
                ClassesReserveDetailsWidget(
                  classTitleString: '${LocaleKeys.classPlaceText.tr()} :',
                  classNoteString: 'Side Bashir Alexandria',
                  classNoteColor: ColorManager.mainPrimaryColor4,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.map_outlined,
                      size: 25,
                      color: ColorManager.mainPrimaryColor4,
                    )),
              ],
            ),
            const MyCustomDividerSize5(),
            ClassesReserveDetailsWidget(
              classTitleString:
                  '${LocaleKeys.lessonPriceHintAndLabelText.tr()} :',
              maxTextLines: 2,
              classNoteString: '300 EGP',
              classNoteColor: ColorManager.mainPrimaryColor4,
            ),
            const MyCustomDividerSize10(),
            isPrevious == false
                ? MyElevatedButton(
                    textColor: ColorManager.textFormBorderColor,
                    radius: 10,
                    height: myMediaQuery(context: context).height / 10,
                    width: myMediaQuery(context: context).width / 2,
                    borderColor: ColorManager.mainPrimaryColor4,
                    onTap: () {
                      navigateTo(context,
                          routeName: Routes.studentPaymentRoute);
                    },
                    borderWidth: 2,
                    buttonName: LocaleKeys.classConfirmReserveText.tr(),
                    buttonColor: ColorManager.backGroundColor,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
