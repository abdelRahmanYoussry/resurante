//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../app/assets_manager.dart';
// import '../app/color_manager.dart';
//
// class MyCachedNetworkImage extends StatelessWidget {
//   const MyCachedNetworkImage({
//     super.key,
//     required this.url,
//     this.width,
//     this.height,
//     this.boxFit,
//     this.backGroundColor,
//     this.placeholder,
//     this.progressIndicatorBuilder,
//   });
//
//   final String url;
//   final BoxFit? boxFit;
//   final double? width;
//   final double? height;
//   final Color? backGroundColor;
//   final Widget? placeholder;
//   final Widget? progressIndicatorBuilder;
//
//   bool get _isValidUrl => url.isNotEmpty && Uri.tryParse(url)?.hasAbsolutePath == true;
//
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: _isValidUrl ? url : "", // Handle empty URLs
//       width: width ?? 50,
//       height: height ?? 50,
//       fadeInCurve: Curves.bounceIn,
//       fit: boxFit ?? BoxFit.cover,
//       color: backGroundColor,
//
//       // ✅ Show only the progress indicator while loading
//       placeholder: (context, url) => Center(
//         child: progressIndicatorBuilder ??
//             CircularProgressIndicator(
//               color: ColorManager.mainPrimaryColor4,
//             ),
//       ),
//
//       // ✅ Show placeholder if the image fails to load
//       errorWidget: (context, url, error) =>
//           placeholder ??
//           SvgPicture.asset(
//             ImageAssets.imagePlaceHolder,
//             fit: BoxFit.contain,
//             width: width ?? 100,
//             height: height ?? 100,
//             alignment: Alignment.center,
//           ),
//     );
//   }
// }
