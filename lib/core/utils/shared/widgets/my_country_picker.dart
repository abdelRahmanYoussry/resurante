// ignore_for_file: depend_on_referenced_packages, unrelated_type_equality_checks

import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hassy/Features/home/presentation/manager/home_cubit.dart';

import '../../services/services_locator.dart';
import '../app/font_manager.dart';
import '../app/styles_manager.dart';
import '../app/values_manager.dart';

Widget buildCountryDropdownItem(Country country) => SizedBox(
      width: AppSize.size80,
      child: Row(
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(
            width: AppSize.size5_5,
          ),
          Text(
            "+${country.phoneCode}",
            style: getSemiBoldStyle(
              color: sl<HomeCubit>().isDark ? Colors.white : Colors.black,
              fontSize: FontSize.size10,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
