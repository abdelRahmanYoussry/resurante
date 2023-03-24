// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_print, deprecated_member_use

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hassy/core/utils/shared/components/components.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_5.dart';

import '../../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../../core/utils/shared/widgets/elevatedButton.dart';

class MapScreen extends StatelessWidget {
  MapScreen(
      {Key? key,
      required this.lat,
      required this.lon,
      required this.onTap,
      required this.myController,
      required this.myMarker,
      required this.onButtonTap,
      required this.onResetTap,
      required this.title,
      this.showReset = false})
      : super(key: key);
  final double lat;
  final double lon;
  final String title;
  bool showReset = false;
  Function(LatLng) onTap;
  late dynamic onButtonTap;
  late dynamic onResetTap;
  final Completer<GoogleMapController> myController;
  final Set<Marker> myMarker;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
        ),
        mycolor: ColorManager.mainPrimaryColor4,
        toolBarHeight: myMediaQuery(context: context).height / 10,
        isLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: myMediaQuery(context: context).height / 1.50,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: myMarker,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    lat,
                    lon,
                  ),
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  myController.complete(controller);
                },
                onTap: onTap,
              ),
            ),
            MyCustomDividerSize5(),
            MyElevatedButton(
              onTap: onButtonTap,
              buttonName: LocaleKeys.submiButton.tr(),
              height: AppSize.size50,
              width: AppSize.size200,
              textColor: Theme.of(context).textTheme.bodyText1!.color,
              borderColor: ColorManager.transparentColor,
              borderWidth: AppSize.size_0,
              fontSize: FontSize.size14,
              radius: AppSize.size10,
              buttonColor: ColorManager.mainPrimaryColor4,
            ),
            if (showReset)
              Column(
                children: [
                  MyCustomDividerSize5(),
                  MyElevatedButton(
                    onTap: onResetTap,
                    buttonName: LocaleKeys.resetButtonText.tr(),
                    height: AppSize.size50,
                    width: AppSize.size200,
                    textColor: Theme.of(context).textTheme.bodyText1!.color,
                    borderColor: ColorManager.transparentColor,
                    borderWidth: AppSize.size_0,
                    fontSize: FontSize.size14,
                    radius: AppSize.size10,
                    buttonColor: ColorManager.mainPrimaryColor4,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
