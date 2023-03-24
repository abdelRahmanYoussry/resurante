// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/components/components.dart';

import '../../../../../core/utils/shared/app/color_manager.dart';

class TeacherPreviousLessonWidget extends StatelessWidget {
  TeacherPreviousLessonWidget({
    Key? key,
    required this.previousClasses,
    required this.onDetailsTapped,
  }) : super(key: key);
  var previousClasses;
  final VoidCallback onDetailsTapped;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: myMediaQuery(context: context).height / 3.80,
      width: double.infinity,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  size: 16,
                  Icons.circle,
                  color: ColorManager.error,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Live',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1,
                    color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Revision',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 0.2,
                    color: Colors.blue),
              ),
              Text(
                '2200 EGP',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 0.2,
                    color: ColorManager.error),
              ),
              Column(
                children: [
                  Text(
                    previousClasses['count'],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 0.5,
                        color: ColorManager.error),
                  ),
                  Text(
                    'Student',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                previousClasses['date'],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 0.2,
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              Text(
                'From:10:30 Am',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 0.2,
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              Text(
                'To:12:30 pm',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 0.2,
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(LocaleKeys.classAddress.tr()),
              SizedBox(
                width: myMediaQuery(context: context).width / 1.5,
                child: Text(
                  previousClasses['address'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 0.2,
                      color: Theme.of(context).textTheme.subtitle1!.color),
                ),
              ),
              Spacer(),
              IconButton(
                  color: ColorManager.mainPrimaryColor4,
                  onPressed: () {},
                  icon: Icon(Icons.map,
                      color: Theme.of(context).textTheme.subtitle1!.color))
            ],
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: onDetailsTapped,
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Theme.of(context).textTheme.subtitle1!.color,
                  ),
                ),
                // IconButton(
                //     onPressed: onDetailsTapped,
                //     icon: Icon(
                //       Icons.arrow_back_ios_outlined,
                //       color: Theme.of(context).textTheme.subtitle1!.color,
                //     )),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
