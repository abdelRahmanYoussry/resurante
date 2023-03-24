// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/components/components.dart';

class ButtonList extends StatelessWidget {
  ButtonList({Key? key, required this.buttonList}) : super(key: key);
  Widget buttonList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: myMediaQuery(context: context).height / 15,
      child: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return [buttonList][index];
        },
      ),
    );
  }
}
