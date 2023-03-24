import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/widgets/textButton.dart';

import '../app/color_manager.dart';
import '../app/values_manager.dart';
import '../components/components.dart';

class ClassMainWarningButtonWidget extends StatelessWidget {
  const ClassMainWarningButtonWidget(
      {Key? key, required this.buttonText, required this.onTap})
      : super(key: key);
  final String buttonText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: myMediaQuery(context: context).height / 15,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.5),
            borderRadius: BorderRadius.circular(AppSize.size10),
          ),
          child: Center(
            child: MyTextButton(
              text: buttonText,
              function: onTap,
              textColor: ColorManager.backGroundColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(2),
          child: Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
