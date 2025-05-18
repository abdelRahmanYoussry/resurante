// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/components.dart';
import 'my_custom_divider_size_5.dart';

class PreviousCurrentLoadingScreen extends StatelessWidget {
  const PreviousCurrentLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
      height: myMediaQuery(context: context).height / 6.h,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: myMediaQuery(context: context).width / 3,
                      color: Colors.grey[100],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 10,
                      width: myMediaQuery(context: context).width / 4,
                      color: Colors.grey[100],
                    ),
                    MyCustomDividerSize5(),
                    Container(
                      height: 10,
                      width: myMediaQuery(context: context).width / 5,
                      color: Colors.grey[100],
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
                    Container(
                      height: 10,
                      width: myMediaQuery(context: context).width / 3,
                      color: Colors.grey[100],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 10,
                      width: myMediaQuery(context: context).width / 5,
                      color: Colors.grey[100],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: myMediaQuery(context: context).width / 2,
                  child: Container(
                    height: 10,
                    width: myMediaQuery(context: context).width / 2,
                    color: Colors.grey[100],
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
