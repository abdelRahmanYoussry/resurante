// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:resturente/core/utils/shared/app/assets_manager.dart';
//
// import '../app/color_manager.dart';
// import '../app/styles_manager.dart';
// import '../app/values_manager.dart';
// import '../components/components.dart';
//
// class MainWarningButtonWidget extends StatelessWidget {
//   const MainWarningButtonWidget({
//     Key? key,
//     required this.warningTitleButton,
//     required this.onTap,
//     required this.warningColor,
//     required this.warningContentButton,
//   }) : super(key: key);
//   final String warningTitleButton;
//   final String warningContentButton;
//   final Function() onTap;
//   final Color warningColor;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 90.h,
//       width: myMediaQuery(context: context).width.w,
//       decoration: BoxDecoration(
//         color: warningColor,
//         borderRadius: BorderRadius.circular(AppSize.size10),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: SizedBox(
//               width: 5.w,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(2.w),
//             child: Container(
//               width: 35.w,
//               height: 40.h,
//               padding: const EdgeInsets.all(8),
//               decoration: ShapeDecoration(
//                 color: ColorManager.orangeColor2,
//                 shape: RoundedRectangleBorder(
//                   side: BorderSide(
//                     width: 4,
//                     strokeAlign: BorderSide.strokeAlignCenter,
//                     color: ColorManager.orangeColor1,
//                   ),
//                   borderRadius: BorderRadius.circular(28),
//                 ),
//               ),
//               child: SvgPicture.asset(
//                 ImageAssets.alertTriangleIcon,
//                 fit: BoxFit.contain,
//                 width: 40.w,
//                 height: 4.h,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 5.w,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 warningTitleButton,
//                 style: getBoldWhite12Style(),
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               Text(
//                 warningContentButton,
//                 style: getRegularWhite12Style(),
//               ),
//             ],
//           ),
//           const Spacer(),
//           IconButton(
//             icon: Icon(
//               Icons.arrow_forward_ios_outlined,
//               color: ColorManager.white,
//             ),
//             onPressed: onTap,
//           ),
//         ],
//       ),
//     );
//   }
// }
