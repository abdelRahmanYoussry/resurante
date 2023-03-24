// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:hassy/core/utils/shared/widgets/rating_stars.dart';

import '../../../../core/utils/shared/app/color_manager.dart';

class StudentCurrentLessonWidget extends StatelessWidget {
  StudentCurrentLessonWidget({
    Key? key,
    required this.onDetailsTapped,
    required this.onCancelTapped,
    required this.lessonDate,
    required this.startTime,
    required this.lessonType,
    required this.endTime,
    required this.price,
    required this.name,
    required this.rate,
    required this.address,
    required this.subjectName,
  }) : super(key: key);
  final VoidCallback onDetailsTapped;
  final VoidCallback onCancelTapped;
  String name;
  double rate;
  String price;
  String endTime;
  String startTime;
  String lessonDate;
  String lessonType;
  String address;
  String subjectName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(left: 5, right: 5, top: 10),
      height: myMediaQuery(context: context).height / 4.30,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                  Rating(rate: rate),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    subjectName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text(
                    lessonType,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    startTime,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    endTime,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                ],
              ),
              Spacer(),
              Text(
                lessonDate,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text(LocaleKeys.classAddress.tr()),
                SizedBox(
                  width: myMediaQuery(context: context).width / 2,
                  child: Text(
                    address,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Icon(
                  color: Theme.of(context).textTheme.subtitle2!.color,
                  Icons.location_on,
                ),
              ],
            ),
          ),
          // Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  color: Theme.of(context).textTheme.subtitle1!.color,
                  onPressed: onDetailsTapped,
                  icon: Icon(Icons.arrow_back_ios_outlined)),
              Text(
                price,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.error),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
