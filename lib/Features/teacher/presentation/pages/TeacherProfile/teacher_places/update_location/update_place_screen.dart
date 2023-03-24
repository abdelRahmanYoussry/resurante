// ignore_for_file: deprecated_member_use, unused_field, avoid_print, unnecessary_null_comparison, use_build_context_synchronously, must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_state.dart';
import 'package:hassy/core/utils/shared/chace_helper/cache_helper.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_10.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../../core/utils/shared/widgets/CustomDropDown.dart';
import '../../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../../../../core/utils/shared/widgets/my_custom_divider_size_5.dart';
import '../../../../../../../core/utils/shared/widgets/textFormfield.dart';
import '../../../../manager/TeacherProfile/teacher_profile_cubit.dart';
import '../map/map_screen.dart';

class TeacherUpdatePlacesScreen extends StatelessWidget {
  TeacherUpdatePlacesScreen({Key? key, required this.placeId})
      : super(key: key);
  int placeId;
  var nameController = TextEditingController();
  var cityController = SingleValueDropDownController();
  var areaController = SingleValueDropDownController();
  var streetNameController = TextEditingController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final myKey = GlobalKey<FormState>();
  double? lat = 0;
  double? lon = 0;
  int? cityId = 0;
  int areaId = 0;
  String cityName = "";
  String areaName = "";
  final Set<Marker> myMarker = {};

  @override
  Widget build(BuildContext context) {
    var cubit = TeacherProfileCubit.get(context);
    cubit.getFullLocation(myCityId: placeId);
    cityController.dropDownValue = cubit.initialCityValueModel;
    areaController.dropDownValue = cubit.initialAreaValueModel;
    streetNameController.text = cubit.street;
    nameController.text = cubit.name;
    cityName = cubit.city;
    areaName = cubit.area;
    areaId = cubit.areaId;
    cityId = cubit.cityId;
    lat = cubit.lat;
    lon = cubit.lon;
    return BlocConsumer<TeacherProfileCubit, TeacherProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onPanUpdateDownDirection,
          ],
          child: Scaffold(
            appBar: CustomAppBar(
              title: Text(
                LocaleKeys.updateLocation.tr(),
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText2!.color),
              ),
              mycolor: ColorManager.mainPrimaryColor4,
              toolBarHeight: myMediaQuery(context: context).height / 10,
              isLeading: true,
            ),
            body: Form(
              key: myKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    if (state is GetLocationLoadingState)
                      const LinearProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 20.0,
                      ),
                      child: Column(
                        children: [
                          const MyCustomDividerSize10(),
                          MyTextFormField(
                            readOnly: false,
                            control: nameController,
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            type: TextInputType.name,
                            isPassword: false,
                            hint: LocaleKeys.locationName.tr(),
                            prefix: Icon(
                              Icons.place_outlined,
                              color:
                                  Theme.of(context).textTheme.subtitle1!.color,
                            ),
                            onTap: () {},
                            onSubmit: () {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return LocaleKeys.fieldReq.tr();
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                          const MyCustomDividerSize5(),
                          MyCustomDropDown(
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            enableSearch: true,
                            enableDropDown: true,
                            onChanged: (value) async {
                              if (cityController.dropDownValue == null) {
                                cityController.clearDropDown();
                                areaController.clearDropDown();
                                cubit.changeFilePickedBool(
                                  isPicked: cubit.isFilePicked,
                                );
                                cubit.areaList.clear();
                              } else {
                                areaController.clearDropDown();
                                cubit.getAreas(cityId: value.value);
                                cityId = value.value;
                                for (var value1
                                    in cubit.getCitiesEntity.locationData) {
                                  if (value1.id == cityId) {
                                    cityName = value1.name!;
                                  }
                                }
                              }
                            },
                            dropDownValueList: cubit.cityList,
                            controller: cityController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.fieldReq.tr();
                              } else {
                                return null;
                              }
                            },
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(LocaleKeys.cityName.tr()),
                            ),
                          ),
                          const MyCustomDividerSize5(),
                          MyCustomDropDown(
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            enableSearch: true,
                            enableDropDown: true,
                            onChanged: (value) async {
                              if (areaController.dropDownValue == null) {
                                areaController.clearDropDown();
                              } else {
                                areaId = value.value;
                                for (var value1
                                    in cubit.getAreaEntity.locationData) {
                                  if (value1.id == areaId) {
                                    areaName = value1.name!;
                                  }
                                }
                              }
                            },
                            dropDownValueList: cubit.areaList,
                            controller: areaController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.fieldReq.tr();
                              } else {
                                return null;
                              }
                            },
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(LocaleKeys.areaName.tr()),
                            ),
                          ),
                          const MyCustomDividerSize5(),
                          MyTextFormField(
                            readOnly: false,
                            control: streetNameController,
                            isAutoValid: AutovalidateMode.onUserInteraction,
                            type: TextInputType.name,
                            isPassword: false,
                            hint: LocaleKeys.streetName.tr(),
                            prefix: Icon(
                              Icons.place_outlined,
                              color:
                                  Theme.of(context).textTheme.subtitle1!.color,
                            ),
                            onTap: () {},
                            onSubmit: () {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return LocaleKeys.fieldReq.tr();
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                          const MyCustomDividerSize5(),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  if (cubit.myLocation == null) {
                                    await cubit.getGeoLocationPosition();
                                  }
                                  myMarker.add(
                                    Marker(
                                      markerId: const MarkerId('1'),
                                      position: LatLng(
                                        lat == 0.0
                                            ? cubit.myLocation!.latitude
                                            : lat!,
                                        lon == 0.0
                                            ? cubit.myLocation!.longitude
                                            : lon!,
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return MapScreen(
                                        onResetTap: () async {
                                          if (cubit.lat == 0.0 ||
                                              cubit.lon == 0.0) {
                                            lat = cubit.myLocation!.latitude;
                                            lon = cubit.myLocation!.longitude;
                                          } else {
                                            lat = cubit.lat!;
                                            lon = cubit.lon!;
                                          }
                                          CameraPosition nepPos =
                                              CameraPosition(
                                            target: LatLng(lat!, lon!),
                                            zoom: 14.4746,
                                          );
                                          final GoogleMapController controller =
                                              await _controller.future;
                                          controller.animateCamera(
                                              CameraUpdate.newCameraPosition(
                                                  nepPos));
                                          setState(() {});
                                          myMarker.clear();
                                          myMarker.add(
                                            Marker(
                                              markerId: const MarkerId('1'),
                                              position: LatLng(
                                                lat!,
                                                lon!,
                                              ),
                                            ),
                                          );
                                          CacheHelper
                                              .saveDataToSharedPreferences(
                                                  key: 'lat',
                                                  value: lat.toString());
                                          CacheHelper
                                              .saveDataToSharedPreferences(
                                                  key: 'lon',
                                                  value: lon.toString());
                                        },
                                        showReset: true,
                                        myMarker: myMarker.toSet(),
                                        lat: lat == 0.0
                                            ? cubit.myLocation!.latitude
                                            : lat!,
                                        lon: lon == 0.0
                                            ? cubit.myLocation!.longitude
                                            : lon!,
                                        onButtonTap: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TeacherUpdatePlacesScreen(
                                                placeId: placeId,
                                              ),
                                            ),
                                          );
                                        },
                                        onTap: (LatLng newLatLng) {
                                          lat = newLatLng.latitude;
                                          lon = newLatLng.longitude;
                                          myMarker.remove(const Marker(
                                              markerId: MarkerId('1')));
                                          myMarker.add(Marker(
                                              markerId: const MarkerId('1'),
                                              position: newLatLng));
                                          setState(() {});
                                          CacheHelper
                                              .saveDataToSharedPreferences(
                                                  key: 'lat',
                                                  value: lat.toString());
                                          CacheHelper
                                              .saveDataToSharedPreferences(
                                                  key: 'lon',
                                                  value: lon.toString());
                                          showToast(
                                            text: LocaleKeys
                                                .teacherFinalRegisterMessage
                                                .tr(),
                                            state: ToastState.Success,
                                          );
                                        },
                                        myController: _controller,
                                        title: LocaleKeys.chooseLocation.tr(),
                                      );
                                    });
                                  }));
                                },
                                icon: Icon(
                                  Icons.add_location_alt_outlined,
                                  color: ColorManager.mainPrimaryColor4,
                                  size: 35.0,
                                ),
                              ),
                              Text(
                                LocaleKeys.addLocationMainText.tr(),
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                  fontSize: 17,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const MyCustomDividerSize10(),
                          MyElevatedButton(
                            onTap: () async {
                              if (myKey.currentState!.validate()) {
                                String lat =
                                    CacheHelper.getSharedPreferencesValue(
                                            key: 'lat') ??
                                        '0.0';
                                String lon =
                                    CacheHelper.getSharedPreferencesValue(
                                            key: 'lon') ??
                                        '0.0';
                                print(lat);
                                print(lon);
                                print(nameController.text);
                                print(cityName);
                                print(cityId);
                                print(areaId);
                                print(cubit.myCountryId);
                                print(streetNameController.text);
                                print(areaName);
                                print(placeId);
                                cubit.updatePlace(
                                  id: placeId,
                                  name: nameController.text.toString(),
                                  countryName: cityName.toString(),
                                  cityName: areaName.toString(),
                                  countryId: cubit.myCountryId,
                                  cityId: cityId!,
                                  areaId: areaId,
                                  streetName:
                                      streetNameController.text.toString(),
                                  longitude: lon.toString(),
                                  latitude: lat.toString(),
                                  context: context,
                                );
                              }
                            },
                            buttonName: LocaleKeys.submiButton.tr(),
                            height: AppSize.size50,
                            width: AppSize.size300,
                            textColor:
                                Theme.of(context).textTheme.bodyText1!.color,
                            borderColor: ColorManager.transparentColor,
                            borderWidth: AppSize.size_0,
                            fontSize: FontSize.size14,
                            radius: AppSize.size10,
                            condition: state is! UpdatePlaceLoadingState,
                            buttonColor: ColorManager.mainPrimaryColor4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
