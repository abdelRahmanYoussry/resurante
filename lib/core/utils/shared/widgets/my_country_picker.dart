// ignore_for_file: depend_on_referenced_packages, unrelated_type_equality_checks

import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app/values_manager.dart';

Widget buildCountryDropdownItem(Country country) => SizedBox(
      width: AppSize.size80.w,
      height: 50.h,
      child: Row(
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            width: AppSize.size5.w,
          ),
          Flexible(
            child: Text(
              "+${country.phoneCode}",
              // style: getSemiBoldStyle(
              //   color: Colors.black,
              //   fontSize: FontSize.size10.sp,
              //   fontWeight: FontWeight.w500,
              // ),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
