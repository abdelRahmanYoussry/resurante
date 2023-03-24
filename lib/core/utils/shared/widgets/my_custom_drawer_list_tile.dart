// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hassy/core/utils/shared/app/font_manager.dart';
import 'package:hassy/core/utils/shared/app/styles_manager.dart';

class MyCustomDrawerListTile extends StatelessWidget {
  MyCustomDrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).textTheme.bodyText1!.color,
      ),
      title: Text(
        title,
        style: getBoldStyle(
          color: Theme.of(context).textTheme.bodyText1!.color!,
          fontSize: FontSize.size18,
        ),
      ),
      onTap: onTap,
    );
  }
}
