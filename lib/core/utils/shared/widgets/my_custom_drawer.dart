// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:resturente/core/utils/shared/widgets/my_custom_divider_size_10.dart';

import '../app/assets_manager.dart';
import '../app/values_manager.dart';


class MyCustomDrawer extends StatelessWidget {
  MyCustomDrawer({super.key, required this.bottomWidget, this.topWidget});
  final Widget bottomWidget;
  Widget? topWidget;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageAssets.appBackGroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                 const Material(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSize.size80),
                  ),
                  elevation: AppSize.size8,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        ImageAssets.userAvatar,
                      ),
                    ),
                  ),
                ),
                const MyCustomDividerSize10(),
                topWidget != null ? topWidget! : Container(),
              ],
            ),
            const MyCustomDividerSize10(),
            Container(
              padding: const EdgeInsets.only(top: AppPadding.padding1),
              child: bottomWidget,
            ),
          ],
        ),
      ),
    );
  }
}
