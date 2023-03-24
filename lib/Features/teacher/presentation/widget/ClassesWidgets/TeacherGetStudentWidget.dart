// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/components/components.dart';

import '../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../core/utils/shared/widgets/elevatedButton.dart';

class TeacherGetStudentWidget extends StatelessWidget {
  TeacherGetStudentWidget({Key? key, required this.list, required this.onTap})
      : super(key: key);

  var list;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: SizedBox(
        height: myMediaQuery(context: context).height / 3.70,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Student Id',
                    style: getBoldStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: FontSize.size18,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    list.id.toString(),
                    style: getBoldStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: FontSize.size18,
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(list.studentImagePath.toString())),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Student Name',
                    style: getBoldStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: FontSize.size18,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    list.name.toString(),
                    style: getBoldStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: FontSize.size18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Student Address',
                    style: getBoldStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: FontSize.size18,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    list.address.toString(),
                    style: getBoldStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: FontSize.size18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Is Active',
                    style: getBoldStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: FontSize.size18,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    list.isActive.toString(),
                    style: getBoldStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: FontSize.size18,
                    ),
                  ),
                  const Spacer(),
                  MyElevatedButton(
                    onTap: onTap,
                    buttonName: LocaleKeys.detailsButton.tr(),
                    height: myMediaQuery(context: context).height / 20,
                    width: myMediaQuery(context: context).width / 3,
                    textColor: Theme.of(context).textTheme.bodyText1!.color,
                    borderColor: ColorManager.transparentColor,
                    borderWidth: AppSize.size_0,
                    fontSize: FontSize.size14,
                    radius: AppSize.size10,
                    buttonColor: ColorManager.mainPrimaryColor4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
