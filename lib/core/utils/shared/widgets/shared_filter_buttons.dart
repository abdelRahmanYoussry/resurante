
import 'package:flutter/material.dart';
import 'package:resturente/core/utils/shared/app/values_manager.dart';

import '../app/styles_manager.dart';

class MyFilterButtons extends StatefulWidget {
  MyFilterButtons(
      {super.key,
      required this.buttonName,
      required this.onTap,
      required this.ifFalseFunction,
      required this.clickedColor,
      required this.notClickedColor});
  final String buttonName;
  final Function()? onTap;
  final Function()? ifFalseFunction;
  final Color clickedColor;
  final Color notClickedColor;
  @override
  State<MyFilterButtons> createState() => _MyFilterButtonsState();
}

class _MyFilterButtonsState extends State<MyFilterButtons> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
        if (isClicked == false) {
          widget.ifFalseFunction!();
        } else {
          widget.onTap!();
        }

        // setState(() {
        //   isClicked = !isClicked;
        //   if (isClicked == false) {
        //     widget.ifFalseFunction!();
        //   }
        // });
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              isClicked == false ? widget.notClickedColor : widget.clickedColor,
          border: Border.all(color: widget.clickedColor),
          borderRadius: BorderRadius.circular(
            AppSize.size20,
          ),
        ),
        margin: const EdgeInsets.all(AppMargin.margin5),
        child: SizedBox(
          height: AppSize.size100,
          // width: AppSize.size200,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.padding8),
            child: Center(
              child: Text(
                widget.buttonName.toString(),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: getBoldBlack24Style(
                    // color: isClicked
                    //     ? Colors.white
                    //     : Theme.of(context).textTheme.bodyText1!.color!,
                    // fontSize: FontSize.size14.sp,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
