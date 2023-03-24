import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hassy/core/utils/shared/app/font_manager.dart';
import 'package:hassy/core/utils/shared/app/styles_manager.dart';

import '../../domain/entities/onboarding.dart';

Widget buildOnBoardingItem({required OnBoarding model, required context}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: SvgPicture.asset(
              model.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.title.tr(),
          style: getBoldStyle(
            fontSize: FontSize.size22,
            color: ColorManager.mainPrimaryColor4,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.body.tr(),
          style: getBoldStyle(
            fontSize: FontSize.size20,
            color: ColorManager.mainPrimaryColor4,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
