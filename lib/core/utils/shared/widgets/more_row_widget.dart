import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';

import '../app/styles_manager.dart';
import '../translations/locale_keys.g.dart';

class MoreRowWidget extends StatelessWidget {
  const MoreRowWidget({super.key, required this.objectName, required this.onTap});
  final String objectName;
  final Function() onTap;
  String getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          objectName,
          style: getMediumBlack16Style(),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.more.tr(),
                style: getDeviceType() == 'tablet' ? getRegularBlue10Style() : getRegularBlue12Style(),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: ColorManager.mainPrimaryColor4,
                size: getDeviceType() == 'tablet' ? 25 : 14,
              )
            ],
          ),
        ),
      ],
    );
  }
}
