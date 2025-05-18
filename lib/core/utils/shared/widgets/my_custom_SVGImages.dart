// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app/values_manager.dart';
class MyCustomSvgImage extends StatelessWidget {
  const MyCustomSvgImage({
    super.key,
    this.boxFit = BoxFit.cover,
    required this.image,
    required this.width,
    this.height = AppSize.size220,
    this.placeHolder = const CircularProgressIndicator(),
  });
  final String image;
  final BoxFit boxFit;
  final double width;
  final double height;
  final Widget placeHolder;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      fit: boxFit,
      width: width,
      height: height,
      placeholderBuilder: (context) => placeHolder,
      // height: MediaQuery.of(context).size.height / AppSize.size70,
    );
  }
}

// class MyCustomDividerSize20 extends StatelessWidget {
//   const MyCustomDividerSize20({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 20.h,
//       // height: MediaQuery.of(context).size.height / AppSize.size70,
//     );
//   }
// }
