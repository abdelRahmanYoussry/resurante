import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/styles_manager.dart';

import '../translations/locale_keys.g.dart';

class TeacherPopUpMenu extends StatelessWidget {
  const TeacherPopUpMenu(
      {super.key,
      // required this.isAvailableLessons,
      // required this.isPreviousLessons,
      // required this.isReservedLessons,
      required this.onSortManagement,
      required this.onSortEdit,
      required this.isStudent});
  // final bool isAvailableLessons;
  // final bool isReservedLessons;
  // final bool isPreviousLessons;
  final bool isStudent;
  final Function onSortManagement;
  final Function onSortEdit;
  String getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: ColorManager.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
          bottom: Radius.circular(8),
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: MenuItem.item1,
          onTap: () {
            onSortManagement();
          },
          child: Text(
            LocaleKeys.classManagementMainText.tr(),
            style: getDeviceType() == 'tablet'
                ? getBoldBlack12Style()
                : getBoldBlack10Style(),
          ),
        ),
        PopupMenuItem(
          value: MenuItem.item2,
          onTap: () {
            onSortEdit();
          },
          child: Text(
            LocaleKeys.calssEdit.tr(),
            style: getDeviceType() == 'tablet'
                ? getBoldBlack12Style()
                : getBoldBlack10Style(),
          ),
        ),
      ],
    );
  }
}

enum MenuItem {
  item1,
  item2,
  item3,
  item4,
  item5,
}
