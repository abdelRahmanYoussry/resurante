
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resturente/core/utils/shared/app/styles_manager.dart';
import 'package:resturente/core/utils/shared/translations/locale_keys.g.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String loadingText = LocaleKeys.pleaseWait.tr();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          // DefaultTextStyle(
          //   style: getBoldBlue12Style(),
          //   child: AnimatedTextKit(
          //     repeatForever: true,
          //     isRepeatingAnimation: true,
          //     animatedTexts: [
          //       TypewriterAnimatedText(
          //         loadingText,
          //         speed: const Duration(milliseconds: 100),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
