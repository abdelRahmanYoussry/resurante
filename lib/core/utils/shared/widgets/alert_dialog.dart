import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/components/components.dart';
import 'package:resturente/core/utils/shared/widgets/elevatedButton.dart';

import '../app/color_manager.dart';
import '../app/styles_manager.dart';

class CustomDialogWidget extends StatefulWidget {
  const CustomDialogWidget({
    super.key,
    required this.onOkTap,
    required this.contentWidget,
    required this.dialogHeight,
    required this.okButtonText,
    required this.cancelButtonText,
  });
  final Function() onOkTap;
  final Widget contentWidget;
  final double dialogHeight;
  final String okButtonText;
  final String cancelButtonText;
  @override
  State<CustomDialogWidget> createState() => _CustomDialogWidgetState();
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: ColorManager.transparentColor,
      title: const Text(""),
      content: Container(
        width: double.maxFinite,
        height: widget.dialogHeight,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        child: widget.contentWidget,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SizedBox(
                width: myMediaQuery(context: context).width / 3.20,
                child: MyElevatedButton(
                  radius: 10,
                  buttonTextStyle: getBoldBlue12Style(),
                  width: 0.1,
                  borderColor: ColorManager.mainPrimaryColor4,
                  onTap: widget.onOkTap,
                  borderWidth: 2,
                  fontSize: 16.sp,
                  buttonName: widget.okButtonText,
                  buttonColor: ColorManager.white,
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                width: myMediaQuery(context: context).width / 3.20,
                child: MyElevatedButton(
                  radius: 10,
                  buttonTextStyle: getBoldWhite12Style(),
                  width: myMediaQuery(context: context).width / 3.w,
                  borderColor: ColorManager.mainPrimaryColor4,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderWidth: 2,
                  fontSize: 16.sp,
                  buttonName: widget.cancelButtonText,
                  buttonColor: ColorManager.mainPrimaryColor4,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
