// ignore_for_file: camel_case_types, file_names, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/home/presentation/manager/home_cubit.dart';
import 'package:hassy/core/utils/shared/translations/locale_keys.g.dart';

class ChangeThemeMode extends StatelessWidget {
  const ChangeThemeMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Transform.scale(
              scale: 1.5,
              child: Switch(
                value: HomeCubit.get(context).isDark,
                activeColor: Colors.white,
                activeTrackColor: Colors.black,
                inactiveThumbColor: Colors.black,
                inactiveTrackColor: Colors.grey,
                dragStartBehavior: DragStartBehavior.down,
                onChanged: (bool value) {
                  HomeCubit.get(context)
                      .changeThemeMode(isDarkFromShared: value);
                },
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            // AppStrings.isDark(isDark: HomeCubit.get(context).isDark)
            HomeCubit.get(context).isDark
                ? Text(
                    LocaleKeys.light.tr(),
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontSize: 20),
                  )
                : Text(
                    LocaleKeys.dark.tr(),
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontSize: 20),
                  )
          ],
        );
      },
    );
  }
}
