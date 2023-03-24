// ignore_for_file: prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_cubit.dart';
import 'package:hassy/Features/teacher/presentation/manager/TeacherProfile/teacher_profile_state.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';

class TeacherCommonQuestionScreen extends StatelessWidget {
  TeacherCommonQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TeacherProfileCubit.get(context);
    return BlocConsumer<TeacherProfileCubit, TeacherProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: Text(
              LocaleKeys.commonQuestionsText.tr(),
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color),
            ),
            mycolor: ColorManager.mainPrimaryColor4,
            toolBarHeight: myMediaQuery(context: context).height / 10,
            isLeading: true,
          ),
          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: ExpansionTile(
                  title: Text(
                    cubit
                        .getCommonQuestionsEntity.privacyPolicyData[index].title
                        .toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 19,
                      color: ColorManager.mainPrimaryColor4,
                    ),
                    maxLines: 1,
                  ),
                  shape: Border.all(color: Colors.transparent),
                  collapsedIconColor: ColorManager.unSelectedIconButtonColor,
                  iconColor: ColorManager.mainPrimaryColor4,
                  initiallyExpanded: false,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cubit.getCommonQuestionsEntity.privacyPolicyData[index]
                            .body
                            .toString(),
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          height: 1.30,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: cubit.getCommonQuestionsEntity.privacyPolicyData.length,
            // itemCount:,
          ),
        );
      },
    );
  }
}
