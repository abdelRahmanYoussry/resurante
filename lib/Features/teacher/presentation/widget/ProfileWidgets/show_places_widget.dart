// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, deprecated_member_use

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hassy/core/utils/shared/translations/locale_keys.g.dart';

import '../../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
import '../../pages/TeacherProfile/teacher_places/map/map_screen.dart';

class ShowPlacesWidget extends StatelessWidget {
  ShowPlacesWidget({
    Key? key,
    required this.myList,
    required this.onIconUpdateTapped,
  }) : super(key: key);
  var myList;
  final Set<Marker> myMarker = {};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late dynamic onIconUpdateTapped;
  @override
  Widget build(BuildContext context) {
    double lat = double.parse(myList.latitude);
    double lon = double.parse(myList.longitude);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: myMediaQuery(context: context).height / 4.30,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                myList.name.toString(),
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              lat != 0.0 && lon != 0.0
                  ? IconButton(
                      onPressed: () async {
                        myMarker.add(
                          Marker(
                            markerId: const MarkerId('1'),
                            position: LatLng(
                              lat,
                              lon,
                            ),
                            draggable: true,
                            onDragEnd: (LatLng latLng) {},
                          ),
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return MapScreen(
                                  onResetTap: () {},
                                  myMarker: myMarker,
                                  lat: lat,
                                  lon: lon,
                                  onButtonTap: () {
                                    Navigator.popAndPushNamed(
                                      context,
                                      Routes.teacherMainPlacesRoute,
                                    );
                                  },
                                  onTap: (LatLng newLatLng) {
                                    myMarker.remove(
                                        const Marker(markerId: MarkerId('1')));
                                    myMarker.add(Marker(
                                      markerId: const MarkerId('1'),
                                      position: newLatLng,
                                    ));
                                  },
                                  myController: _controller,
                                  title: LocaleKeys.location.tr(),
                                );
                              });
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        size: 25.0,
                      ),
                    )
                  : Container(),
            ],
          ),
          const MyCustomDividerSize5(),
          Text(
            myList.countryName.toString(),
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          const MyCustomDividerSize5(),
          Text(
            myList.cityName.toString(),
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          const MyCustomDividerSize5(),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    myList.streetName.toString(),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: onIconUpdateTapped,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
