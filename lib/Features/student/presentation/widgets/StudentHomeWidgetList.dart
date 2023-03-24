// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_5.dart';
import 'package:hassy/core/utils/shared/widgets/rating_stars.dart';

import '../../../../core/utils/shared/app/font_manager.dart';
import '../../../../core/utils/shared/app/strings_manager.dart';
import '../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../core/utils/shared/app/values_manager.dart';
import '../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../core/utils/shared/chace_helper/cache_helper.dart';
import '../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../core/utils/shared/widgets/my_custom_divider_size_10.dart';
import '../../../../core/utils/shared/widgets/my_custom_divider_size_2.dart';
import 'class_compelete_reserv_widget.dart';

class StudentHomeWidget extends StatefulWidget {
  StudentHomeWidget({
    Key? key,
    required this.assetsImage,
    required this.countryFlagName,
    required this.isFavourite,
    required this.rate,
    required this.rateNumber,
    required this.numberOfReviews,
    required this.aboutTeacher,
    required this.name,
    required this.price,
    required this.startTime,
    required this.date,
    required this.classType,
    required this.endTime,
    required this.address,
    required this.subject,
  }) : super(key: key);
  String assetsImage;
  String name;
  String address;
  String countryFlagName;
  String date;
  String subject;
  String startTime;
  String endTime;
  String classType;
  bool? isPrevious;

  bool isFavourite;
  double rate;
  String rateNumber;
  String numberOfReviews;
  String aboutTeacher;
  String price;
  @override
  State<StudentHomeWidget> createState() => _StudentHomeWidgetState();
}

class _StudentHomeWidgetState extends State<StudentHomeWidget> {
  var myLocale =
      CacheHelper.getSharedPreferencesValue(key: AppStrings.localCode);

  @override
  Widget build(BuildContext context) {
    debugPrint(myMediaQuery(context: context).height.toString());
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(AppSize.size10),
          ),
          height: myMediaQuery(context: context).height / 3.70,
          width: myMediaQuery(context: context).width,
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(widget.assetsImage)),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyCustomDividerSize2(),
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 18,
                                  // height: 1.3,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color!),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              size: 20,
                              Icons.verified_user,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ],
                        ),
                        // MyCustomDividerSize2(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.end,
                              widget.rateNumber,
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 16,
                              ),
                            ),
                            Column(
                              children: [
                                Rating(rate: widget.rate, iconSize: 16),
                                SizedBox(
                                  height: 2,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.numberOfReviews,
                              style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color)
                                  .copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.isFavourite = !widget.isFavourite;
                          });
                        },
                        icon: widget.isFavourite == true
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ))
                  ],
                ),
                MyCustomDividerSize5(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.startTime,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Text(widget.endTime,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: myMediaQuery(context: context).width / 3,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(widget.address,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Icon(
                                  FontAwesomeIcons.locationDot,
                                  size: 25,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    // Flexible(
                    //   flex: 3,
                    //   child: Text(widget.address,
                    //       maxLines: 2,
                    //       textAlign: TextAlign.start,
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           overflow: TextOverflow.ellipsis,
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.bold)),
                    // ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.subject,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(widget.date,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Text(widget.classType,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                // Spacer(),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          showBottomSheet(context: context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).textTheme.subtitle1!.color,
                        )),
                    Spacer(),
                    Text(widget.price,
                        maxLines: 2,
                        softWrap: true,
                        style: getBoldStyle(
                            color:
                                Theme.of(context).textTheme.subtitle2!.color!,
                            fontSize: 24)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showBottomSheet({required BuildContext context}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => SizedBox(
            height: myMediaQuery(context: context).height / 1.5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        LocaleKeys.lessonDetailsText.tr(),
                        style: getBoldStyle(
                          color: ColorManager.textFormBorderColor,
                          fontSize: FontSize.size22,
                        ),
                      ),
                    ),
                    const MyCustomDividerSize10(),
                    ClassesReserveDetailsWidget(
                      classTitleString:
                          '${LocaleKeys.classMaterialNameText.tr()} :',
                      classNoteString: 'Math',
                      classNoteColor: ColorManager.mainPrimaryColor4,
                    ),
                    const MyCustomDividerSize10(),
                    ClassesReserveDetailsWidget(
                      classTitleString:
                          '${LocaleKeys.classTeacherNameText.tr()} :',
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
                      classTitleString:
                          '${LocaleKeys.noteAddressAndHintLabel.tr()} :',
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
                              classTitleString:
                                  LocaleKeys.classTimeFromTimeText.tr(),
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
                              classTitleString:
                                  LocaleKeys.classTimeToTimeText.tr(),
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
                          classTitleString:
                              '${LocaleKeys.classPlaceText.tr()} :',
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
                    MyElevatedButton(
                      textColor: ColorManager.textFormBorderColor,
                      radius: 10,
                      height: myMediaQuery(context: context).height / 10,
                      width: myMediaQuery(context: context).width / 1.50,
                      borderColor: ColorManager.mainPrimaryColor4,
                      onTap: () {
                        navigateTo(context,
                            routeName: Routes.studentPaymentRoute);
                      },
                      borderWidth: 2,
                      buttonName: LocaleKeys.classConfirmReserveText.tr(),
                      buttonColor: ColorManager.mainPrimaryColor4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
