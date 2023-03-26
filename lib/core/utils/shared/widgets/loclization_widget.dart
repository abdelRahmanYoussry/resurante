// ignore_for_file: must_be_immutable, avoid_print, use_build_context_synchronously, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Features/startup/domain/use_cases/change_language_use_case.dart';
import '../../../../Features/startup/presentation/manager/startup_cubit.dart';
import '../../../../Features/startup/presentation/manager/startup_state.dart';
import '../app/color_manager.dart';
import '../app/font_manager.dart';
import '../app/styles_manager.dart';
import '../app/values_manager.dart';
import '../components/components.dart';

class LoclizationWidget extends StatelessWidget {
  LoclizationWidget({Key? key, required BuildContext context})
      : super(key: key);
  List lang = ['en', 'العربية'];

  @override
  Widget build(BuildContext context) {
    //abdo
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {
        if (state is LocalChangedSuccessState) {
          context.setLocale(state.selectedLocale);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        var cubit = OnBoardingCubit.get(context);
        return SizedBox(
          width: MediaQuery.of(context).size.width / AppSize.size3,
          height: MediaQuery.of(context).size.height / AppSize.size12,
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: myMediaQuery(context: context).width / 6,
                  child: Text(
                    cubit.currentLangCode == 'ar' ? 'English' : 'العربية',
                    style: getBoldStyle(
                        color: Colors.white, fontSize: FontSize.size14),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  FontAwesomeIcons.language,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
            onTap: () {
              showModalBottomSheet(
                isDismissible: true,
                useRootNavigator: false,
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        height: myMediaQuery(context: context).height / 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        context.locale.languageCode == 'en'
                                            ? MaterialStateProperty.all(
                                                ColorManager.mainPrimaryColor4)
                                            : MaterialStateProperty.all(
                                                Colors.transparent)),
                                onPressed: () async {
                                  await cubit.changeLocalLan(
                                    const ChangeLanguageParameters(
                                      local: 'en',
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'English',
                                  style: getBoldStyle(
                                      fontSize: 18,
                                      color: context.locale.languageCode == 'en'
                                          ? ColorManager.white
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color!),
                                )),
                            TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      context.locale.languageCode == 'ar'
                                          ? MaterialStateProperty.all(
                                              ColorManager.mainPrimaryColor4)
                                          : MaterialStateProperty.all(
                                              Colors.transparent)),
                              onPressed: () async {
                                await cubit.changeLocalLan(
                                  const ChangeLanguageParameters(
                                    local: 'ar',
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              child: Text(
                                'العربية',
                                style: getBoldStyle(
                                    fontSize: 18,
                                    color: context.locale.languageCode == 'ar'
                                        ? ColorManager.white
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
