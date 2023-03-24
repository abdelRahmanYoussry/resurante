// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, equal_keys_in_map

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../core/utils/shared/widgets/class_main_divider.dart';
import '../../../widget/ClassesWidgets/TeacherPerviousLessonWidget.dart';

class TeacherPreviousClassesScreen extends StatelessWidget {
  TeacherPreviousClassesScreen({Key? key}) : super(key: key);
  var myStaticCurrentClass = [
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': '45- asfra stereet ard al abtal',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': '45- asfra stereet ard al abtal',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': '45- asfra stereet ard al abtal',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': '45- asfra stereet ard al abtal',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': '45- asfra stereet ard al abtal',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': '45- asfra stereet ard al abtal',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': '45- asfra stereet ard al abtal',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': '45- asfra stereet ard al abtal',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': '45- asfra stereet ard al abtal',
      'count': '10',
      'educationlevel': 'Governmental',
    },
    {
      'date': '09-01-2023',
      'classname': 'Math',
      'alsaf': 'Fifth grade',
      'address': '45- asfra stereet ard al abtal',
      'count': '10',
      'educationlevel': 'Governmental',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainPrimaryColor4.withOpacity(0.1),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.padding10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt,
                      color: ColorManager.mainPrimaryColor4,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.sort,
                      color: ColorManager.mainPrimaryColor4,
                    ),
                  ),
                ],
              ),
              ConditionalBuilder(
                condition: myStaticCurrentClass.isNotEmpty,
                builder: (context) {
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return TeacherPreviousLessonWidget(
                        previousClasses: myStaticCurrentClass[index],
                        onDetailsTapped: () {
                          debugPrint(index.toString());
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const ClassesMainDivider(),
                    itemCount: myStaticCurrentClass.length,
                  );
                },
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
