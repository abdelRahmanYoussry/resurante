// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SlideRight extends PageRouteBuilder {
  final page;

  SlideRight({this.page})
      : super(
            pageBuilder: (context, animation, animationTwo) => page,
            transitionDuration: const Duration(milliseconds: 500),
            // pageBuilder: ,
            transitionsBuilder: (context, animation, animationTwo, child) {
              var begin = context.locale.languageCode == 'en'
                  ? const Offset(-1.0, 0.0)
                  : const Offset(1.0, 0.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              var curvesAnimation =
                  CurvedAnimation(parent: animation, curve: Curves.linear);
              return SlideTransition(
                position:
                    // tween.animate(curvesAnimation),
                    offsetAnimation,
                child: child,
              );
            });
}
