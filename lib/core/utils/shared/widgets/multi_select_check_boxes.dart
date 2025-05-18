import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/components/components.dart';
import 'package:resturente/core/utils/shared/translations/locale_keys.g.dart';

import '../app/styles_manager.dart';
import 'DropDown/NewDropDownMultiSelection.dart';

class MultiSelectCheckBox extends StatelessWidget {
  MultiSelectCheckBox({
    super.key,
    required this.multiSelectItem,
    required this.confirmEvent,
    required this.label,
    required this.validator,
    required this.title,
    required this.subTitle,
    this.initalValue,
  });
  final List<MultiSelectItem> multiSelectItem;
  final void Function(List) confirmEvent;
  final String label;
  final String title;
  final String subTitle;
  late dynamic validator;
  List<dynamic>? initalValue;
  String getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  @override
  Widget build(BuildContext context) {
    return NewDropDownMultiSelect(
      initialValue: initalValue!,

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getMediumBlack18Style(),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            subTitle,
            style: getRegularGray14Style(),
          ),
        ],
      ),

      buttonText: Text(
        label,
        style: getDeviceType() == 'tablet'
            ? getBoldBlack9Style()
            : getBoldGrey12Style(),
      ),
      selectedItemsTextStyle: getBoldBlack16Style(),
      cancelText: Text(
        LocaleKeys.cancelText.tr(),
        style: getMediumBlack14Style(),
      ),
      chipDisplay: MultiSelectChipDisplay(
        textStyle: getMediumWhite14Style(),
        scroll: false,
        // chipWidth: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ColorManager.mainPrimaryColor4.withOpacity(0.3),
        ),
        chipColor: ColorManager.mainPrimaryColor4,
        alignment: context.locale.languageCode == 'en'
            ? Alignment.topLeft
            : Alignment.topRight,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      checkColor: ColorManager.white,
      itemsTextStyle: getMediumBlack14Style(),
      confirmText:
          Text(LocaleKeys.selectText.tr(), style: getMediumWhite14Style()),
      searchable: false,
      searchHint: LocaleKeys.searchButton.tr(),
      dialogWidth: 400.w,
      buttonIcon:
          Icon(Icons.keyboard_arrow_down_sharp, color: ColorManager.textGrey3),
      // searchIcon: const Icon(Icons.search),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      dialogHeight: myMediaQuery(context: context).height / 2.3.h,
      closeSearchIcon: const Icon(Icons.clear_outlined),
      decoration: BoxDecoration(
        // color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: ColorManager.textGrey3,
          width: 1,
        ),
      ),
      backgroundColor: ColorManager.white,
      selectedColor: ColorManager.mainPrimaryColor4,
      unselectedColor: Colors.yellow,
      items: multiSelectItem,
      onConfirm: confirmEvent,
    );
  }
}
