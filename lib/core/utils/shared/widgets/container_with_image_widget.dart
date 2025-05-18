// import 'package:flutter/material.dart';
// import 'package:resturente/core/utils/shared/app/assets_manager.dart';
// import 'package:sizer/sizer.dart';
//
// import '../app/color_manager.dart';
// import '../app/styles_manager.dart';
// import '../app/values_manager.dart';
//
// class ObjectWithImageWidget extends StatefulWidget {
//   ObjectWithImageWidget({
//     super.key,
//     required this.name,
//     required this.onTap,
//     required this.ifFalseFunction,
//     required this.clickedColor,
//     required this.notClickedColor,
//     this.imageUrl,
//     this.imageWidth,
//     this.imageHeight,
//     this.boxFit,
//     this.isTeacher,
//     required this.isCircle,
//     this.isHome,
//   });
//   final String name;
//   final Function()? onTap;
//   final Function()? ifFalseFunction;
//   final Color clickedColor;
//   final Color notClickedColor;
//   String? imageUrl;
//   double? imageWidth;
//   double? imageHeight;
//   BoxFit? boxFit;
//   bool? isHome = true;
//   bool? isTeacher = true;
//   final bool isCircle;
//   @override
//   State<ObjectWithImageWidget> createState() => _ObjectWithImageWidgetState();
// }
//
// class _ObjectWithImageWidgetState extends State<ObjectWithImageWidget> {
//   bool isClicked = false;
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           isClicked = !isClicked; // Toggle the isClicked state
//           debugPrint('Tapped, isClicked = $isClicked');
//         });
//
//         // Now, let's just test if onTap gets triggered
//         if (widget.onTap != null) {
//           widget.onTap?.call(); // Test if onTap gets called
//           debugPrint('onTap function called!');
//         }
//
//         // Call ifFalseFunction just for testing
//         if (widget.ifFalseFunction != null && !isClicked) {
//           widget.ifFalseFunction?.call();
//           debugPrint('ifFalseFunction called');
//         }
//       },
//       child: Column(
//         children: [
//           _buildImageContainer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: AppPadding.padding8),
//             child: SizedBox(
//               width: _getTextWidth(),
//               child: Center(
//                 child: Text(
//                   widget.name,
//                   softWrap: true,
//                   maxLines: 1,
//                   textAlign: TextAlign.center,
//                   style: _getTextStyle(),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildImageContainer() {
//     final bool hasImage = widget.imageUrl != null;
//     final bool isCircle = widget.isCircle;
//     const bool isTablet =true;
//
//     // Default dimensions based on shape and device
//     // final double width = widget.imageWidth ??
//         // (isTablet
//         //     ? 60.w
//         //     : isCircle
//         //         ? 48.w
//         //         : 50.w,);
//     final double height = widget.imageHeight ??
//         (isTablet
//             ? 60.h
//             : isCircle
//                 ? 48.h
//                 : 50.h,);
//
//     // Border styling
//     final borderColor =
//         isClicked ? widget.clickedColor : ColorManager.textGrey3;
//     final borderWidth = isClicked ? 2.5 : 1.0;
//     final borderRadius = BorderRadius.circular(isCircle ? 50 : 5);
//
//     final decoration = BoxDecoration(
//       color: ColorManager.mainObjectsBackGroundColor,
//       border: Border.all(color: borderColor, width: borderWidth),
//       borderRadius: borderRadius,
//     );
//
//     // Image widget: cached if URL exists, otherwise fallback asset
//     final Widget image = hasImage
//         ? MyCachedNetworkImage(
//             url: widget.imageUrl!,
//             width: width,
//             height: height,
//             boxFit: widget.boxFit ?? BoxFit.cover,
//           )
//         : Image.asset(
//             isCircle ? ImageAssets.userAvatar : ImageAssets.splashLogo_png,
//             width: width,
//             height: height,
//             fit: widget.boxFit ?? BoxFit.cover,
//           );
//
//     // Return proper layout based on shape
//     if (isCircle) {
//       final double size =
//           widget.imageWidth ?? (getDeviceType() == 'tablet' ? 60.w : 48.w);
//       final borderColor =
//           isClicked ? widget.clickedColor : ColorManager.textGrey3;
//       final borderWidth = isClicked ? 2.5 : 1.0;
//
//       final decoration = BoxDecoration(
//         color: ColorManager.mainObjectsBackGroundColor,
//         border: Border.all(color: borderColor, width: borderWidth),
//         borderRadius: BorderRadius.circular(50),
//       );
//
//       final Widget image = widget.imageUrl != null
//           ? MyCachedNetworkImage(
//               url: widget.imageUrl!,
//               width: size,
//               height: size,
//               boxFit: widget.boxFit ?? BoxFit.cover,
//             )
//           : Image.asset(
//               ImageAssets.userAvatar,
//               width: size,
//               height: size,
//               fit: widget.boxFit ?? BoxFit.cover,
//             );
//
//       return Container(
//         decoration: decoration,
//         child: ClipOval(child: image),
//       );
//     } else {
//       return Container(
//         width: 87.w,
//         height: 87.h,
//         padding: const EdgeInsets.all(10),
//         decoration: decoration,
//         child: Center(child: image),
//       );
//     }
//   }
//
//   double _getTextWidth() {
//     final isHome = widget.isHome ?? true;
//     final isTeacher = widget.isTeacher ?? true;
//
//     if (isHome && isTeacher) return 70.w;
//     if (isHome && !isTeacher) return 90.w;
//     if (!isHome && isTeacher) return 80.w;
//     return 120.w;
//   }
//
//   TextStyle _getTextStyle() {
//     final isHome = widget.isHome ?? true;
//     final isTeacher = widget.isTeacher ?? true;
//
//     if (isHome && isTeacher) {
//       return getMediumBlack10Style();
//     } else if (!isHome && isTeacher) {
//       return getMediumBlack12Style();
//     } else if (isHome && !isTeacher && !isClicked) {
//       return getMediumGrey10Style().copyWith(fontWeight: FontWeight.bold);
//     } else if (isClicked) {
//       return getMediumBlack12Style().copyWith(fontWeight: FontWeight.w700);
//     } else {
//       return getMediumGrey16Style();
//     }
//   }
// }
