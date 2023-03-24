// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/components/components.dart';

import '../../../../core/utils/shared/app/color_manager.dart';
import '../../../../core/utils/shared/app/values_manager.dart';

class SliverListMainWidget extends StatelessWidget {
  SliverListMainWidget({Key? key, required this.mainList}) : super(key: key);
  var mainList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.mainPrimaryColor1,
            borderRadius: BorderRadius.circular(AppSize.size10),
          ),
          padding: const EdgeInsets.all(20),
          height: myMediaQuery(context: context).height / 4.50,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(LocaleKeys.classDate.tr()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(mainList['date']),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(LocaleKeys.educationMaterial.tr()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(mainList['classname']),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(LocaleKeys.gradeName.tr()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(mainList['alsaf']),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(LocaleKeys.educationLevel.tr()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    mainList['educationlevel'],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(LocaleKeys.classAddress.tr()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    mainList['address'],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(LocaleKeys.classStudentCount.tr()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    mainList['count'],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
