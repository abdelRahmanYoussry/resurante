// ignore_for_file: prefer_const_constructors_in_immutables, file_names, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/app/font_manager.dart';
import 'package:hassy/core/utils/shared/app/styles_manager.dart';
import 'package:hassy/core/utils/shared/app/values_manager.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_5.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../../core/utils/shared/app/assets_manager.dart';
import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../../core/utils/shared/widgets/textFormfield.dart';

class StudentPayVisaScreen extends StatelessWidget {
  StudentPayVisaScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          mycolor: ColorManager.mainPrimaryColor4,
          isLeading: false,
          toolBarHeight: myMediaQuery(context: context).height / 5,
          // LocaleKeys.classManagementMainText.tr()
          title: const Text(
            '',
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  LocaleKeys.classManagementMainText.tr(),
                  style: getBoldStyle(
                    color: Theme.of(context).textTheme.bodyText2!.color,
                    fontSize: FontSize.size22,
                  ),
                ),
                SizedBox(
                  height: myMediaQuery(context: context).height / 25,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Container(
                        width: myMediaQuery(context: context).width - 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius:
                                BorderRadius.circular(AppSize.size10)),
                        child: MyTextFormField(
                          readOnly: false,
                          control: searchController,
                          type: TextInputType.name,
                          isPassword: false,
                          hint: LocaleKeys.searchButton.tr(),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MyCustomDividerSize5(),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      myMediaQuery(context: context).width / 6,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color:
                                        ColorManager.darkGrey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '1$index',
                                      style: getBoldStyle(
                                        color: ColorManager.textFormBorderColor,
                                        fontSize: FontSize.size20,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ali Mahmoud Ali Hassan',
                                      style: getBoldStyle(
                                        color: ColorManager.mainPrimaryColor4,
                                        fontSize: FontSize.size20,
                                      ),
                                    ),
                                    index > 5
                                        ? Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Cash',
                                                style: getBoldStyle(
                                                  color: ColorManager
                                                      .textFormBorderColor,
                                                  fontSize: FontSize.size16,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const SizedBox(
                                                height: 25,
                                                width: 25,
                                                child: Image(
                                                  image: AssetImage(
                                                    ImageAssets.cashIcon,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Visa',
                                                style: getBoldStyle(
                                                  color: ColorManager
                                                      .textFormBorderColor,
                                                  fontSize: FontSize.size16,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const SizedBox(
                                                height: 25,
                                                width: 25,
                                                child: Image(
                                                  image: AssetImage(
                                                    ImageAssets.visaIcon,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                                const Spacer(),
                                const Material(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppSize.size80),
                                  ),
                                  // elevation: AppSize.size_0,
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                        ImageAssets.userAvatar,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 2,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      myMediaQuery(context: context).width / 6,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: ColorManager.mainPrimaryColor4,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.phone_rounded,
                                      color: ColorManager.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Container(
                                    width: myMediaQuery(context: context).width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: ColorManager.mainPrimaryColor4,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MyElevatedButton(
                                      radius: 10,
                                      textColor: ColorManager.white,
                                      height:
                                          myMediaQuery(context: context).height,
                                      width:
                                          myMediaQuery(context: context).width /
                                              2,
                                      borderColor:
                                          ColorManager.mainPrimaryColor4,
                                      fontSize: FontSize.size18,
                                      onTap: () {
                                        navigateTo(context,
                                            routeName:
                                                Routes.studentPayCashRoute);
                                      },
                                      borderWidth: 2,
                                      buttonName: LocaleKeys.checkInText.tr(),
                                      buttonColor:
                                          ColorManager.mainPrimaryColor4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container();
                  },
                  itemCount: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
