// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';

import '../app/font_manager.dart';
import '../app/styles_manager.dart';
import '../app/values_manager.dart';

class MySliverButton extends StatelessWidget {
  const MySliverButton(
      {Key? key, required this.buttonName, required this.onTap})
      : super(key: key);
  final String buttonName;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(
            AppSize.size20,
          ),
        ),
        margin: const EdgeInsets.all(AppMargin.margin5),
        child: SizedBox(
          height: AppSize.size100,
          width: AppSize.size100,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.padding8),
            child: Center(
              child: Text(
                buttonName.toString(),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: getBoldStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color!,
                  fontSize: FontSize.size16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
