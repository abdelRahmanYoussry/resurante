// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors, deprecated_member_use, use_build_context_synchronously, avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_cubit.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_state.dart';
import 'package:hassy/core/utils/shared/app_routes/routes_manager.dart';

import '../../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../../core/utils/shared/app/values_manager.dart';
import '../../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../../core/utils/shared/widgets/class_main_divider.dart';
import '../../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../../widget/ProfileWidgets/show_places_widget.dart';
import '../update_location/update_place_screen.dart';

class MainPlacesScreen extends StatelessWidget {
  MainPlacesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit = TeacherProfileCubit.get(context);
    return BlocConsumer<TeacherProfileCubit, TeacherProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: CustomAppBar(
            title: Text(
              LocaleKeys.locationsTextInProfile.tr(),
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color),
            ),
            mycolor: ColorManager.mainPrimaryColor4,
            toolBarHeight: myMediaQuery(context: context).height / 10,
            isLeading: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.padding10, horizontal: 5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyElevatedButton(
                        radius: 10,
                        textColor: ColorManager.backGroundColor,
                        height: myMediaQuery(context: context).height / 10,
                        width: myMediaQuery(context: context).width / 2,
                        borderColor: ColorManager.mainPrimaryColor4,
                        onTap: () async {
                          await cubit.getCountry(context: context);
                          await cubit.getCities(myCountryId: cubit.countryId);
                          navigateTo(context,
                              routeName: Routes.teacherAddLocationRoute);
                        },
                        borderWidth: 2,
                        buttonName: LocaleKeys.addLocationText.tr(),
                        buttonColor: ColorManager.mainPrimaryColor4,
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                      condition: cubit
                          .getTeacherPlaceEntity.teacherPlacesData.isNotEmpty,
                      builder: (context) {
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return ShowPlacesWidget(
                              myList: cubit.getTeacherPlaceEntity
                                  .teacherPlacesData[index],
                              onIconUpdateTapped: () async {
                                await cubit.getFullLocation(
                                  myCityId: cubit.getTeacherPlaceEntity
                                      .teacherPlacesData[index].id!,
                                );
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return TeacherUpdatePlacesScreen(
                                        placeId: cubit.id,
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const ClassesMainDivider(),
                          itemCount: cubit
                              .getTeacherPlaceEntity.teacherPlacesData.length,
                        );
                      },
                      fallback: (context) {
                        return Column(
                          children: [
                            SizedBox(
                              height: myMediaQuery(context: context).height / 3,
                            ),
                            Text(
                              LocaleKeys.addLocationWarning.tr(),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
