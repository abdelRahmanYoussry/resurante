// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';

class ContactWithParentScreen extends StatelessWidget {
  const ContactWithParentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          LocaleKeys.contactParentInProfileScreen.tr(),
          style: TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
        ),
        mycolor: ColorManager.mainPrimaryColor4,
        toolBarHeight: myMediaQuery(context: context).height / 10,
        isLeading: true,
      ),
      body: Center(
        child: Text(
          'Contact With Parent Screen',
          style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
        ),
      ),
    );
  }
}
